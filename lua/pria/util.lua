local M = {}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h:h")

function M.mod(modname)
	if package.loaded[modname] then
		return package.loaded[modname]
	end
	local ret = loadfile(me .. "/" .. modname:gsub("%.", "/") .. ".lua")()
	package.loaded[modname] = ret
	return ret
end

---@param groups pria.Highlights
---@return pria.Highlights
function M.resolve(groups)
	for _, hl in pairs(groups) do
		if type(hl.style) == "table" then
			for k, v in pairs(hl.style) do
				hl[k] = v
			end
			hl.style = nil
		end
	end
	return groups
end

-- example: "${name} is ${value}"
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
	return (
		str:gsub("($%b{})", function(w)
			return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
		end)
	)
end

-- Color helpers (OKLCH / OKLab). All helpers take and return "#RRGGBB" hex
-- strings so they can be composed directly on top of palette colors, e.g.
-- `util.lighten(colors.red, 0.15)`.

local atan2 = math.atan2
	or function(y, x)
		if x > 0 then
			return math.atan(y / x)
		elseif x < 0 then
			return math.atan(y / x) + (y >= 0 and math.pi or -math.pi)
		elseif y > 0 then
			return math.pi / 2
		elseif y < 0 then
			return -math.pi / 2
		end
		return 0
	end

local function hex_to_rgb(hex)
	local h = hex:gsub("#", "")
	if #h == 3 then
		h = h:gsub("(.)", "%1%1")
	end
	return tonumber(h:sub(1, 2), 16) / 255, tonumber(h:sub(3, 4), 16) / 255, tonumber(h:sub(5, 6), 16) / 255
end

local function rgb_to_hex(r, g, b)
	local function channel(x)
		return math.floor(math.max(0, math.min(1, x)) * 255 + 0.5)
	end
	return string.format("#%02X%02X%02X", channel(r), channel(g), channel(b))
end

local function srgb_to_linear(c)
	if c <= 0.04045 then
		return c / 12.92
	end
	return ((c + 0.055) / 1.055) ^ 2.4
end

local function linear_to_srgb(c)
	if c <= 0.0031308 then
		return c * 12.92
	end
	return 1.055 * c ^ (1 / 2.4) - 0.055
end

local function rgb_to_oklab(r, g, b)
	r, g, b = srgb_to_linear(r), srgb_to_linear(g), srgb_to_linear(b)
	local l = 0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b
	local m = 0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b
	local s = 0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b
	l, m, s = l ^ (1 / 3), m ^ (1 / 3), s ^ (1 / 3)
	return 0.2104542553 * l + 0.7936177850 * m - 0.0040720468 * s,
		1.9779984951 * l - 2.4285922050 * m + 0.4505937099 * s,
		0.0259040371 * l + 0.7827717662 * m - 0.8086757660 * s
end

local function oklab_to_rgb(L, A, B)
	local l = L + 0.3963377774 * A + 0.2158037573 * B
	local m = L - 0.1055613458 * A - 0.0638541728 * B
	local s = L - 0.0894841775 * A - 1.2914855480 * B
	l, m, s = l ^ 3, m ^ 3, s ^ 3
	local r = 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s
	local g = -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s
	local b = -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s
	return linear_to_srgb(r), linear_to_srgb(g), linear_to_srgb(b)
end

local function to_oklch(hex)
	local r, g, b = hex_to_rgb(hex)
	local L, A, B = rgb_to_oklab(r, g, b)
	return L, math.sqrt(A * A + B * B), atan2(B, A)
end

local function in_gamut(r, g, b)
	local eps = 1e-6
	return r >= -eps and r <= 1 + eps and g >= -eps and g <= 1 + eps and b >= -eps and b <= 1 + eps
end

-- Convert OKLab to hex, reducing chroma (never lightness or hue) until the
-- color fits inside the sRGB gamut. Plain per-channel clipping would distort
-- hue and break lighten/darken round-trips on saturated colors.
local function oklab_to_hex(L, A, B)
	local C = math.sqrt(A * A + B * B)
	local cosH, sinH = 1, 0
	if C > 0 then
		cosH, sinH = A / C, B / C
	end
	local function sample(scale)
		return oklab_to_rgb(L, C * scale * cosH, C * scale * sinH)
	end

	local r, g, b = sample(1)
	if not in_gamut(r, g, b) then
		local lo, hi = 0, 1
		for _ = 1, 12 do
			local mid = (lo + hi) / 2
			local rr, gg, bb = sample(mid)
			if in_gamut(rr, gg, bb) then
				lo = mid
			else
				hi = mid
			end
		end
		r, g, b = sample(lo)
	end
	return rgb_to_hex(r, g, b)
end

local function from_oklch(L, C, H)
	return oklab_to_hex(L, C * math.cos(H), C * math.sin(H))
end

--- Raise a color's lightness, keeping its hue.
---@param hex string
---@param amount number 0..1
---@return string
function M.lighten(hex, amount)
	local L, C, H = to_oklch(hex)
	return from_oklch(math.min(1, L + amount), C, H)
end

--- Lower a color's lightness, keeping its hue.
---@param hex string
---@param amount number 0..1
---@return string
function M.darken(hex, amount)
	local L, C, H = to_oklch(hex)
	return from_oklch(math.max(0, L - amount), C, H)
end

--- Reduce a color's chroma, keeping its lightness and hue.
---@param hex string
---@param amount number 0..1 (0 = unchanged, 1 = fully grey)
---@return string
function M.desaturate(hex, amount)
	local L, C, H = to_oklch(hex)
	return from_oklch(L, math.max(0, C * (1 - amount)), H)
end

--- Blend two colors in OKLab. `t = 0` returns `a`, `t = 1` returns `b`.
--- Use it as a wash: `util.mix(colors.bg, colors.red, 0.12)`.
---@param a string
---@param b string
---@param t number 0..1
---@return string
function M.mix(a, b, t)
	local ar, ag, ab = hex_to_rgb(a)
	local br, bg, bb = hex_to_rgb(b)
	local al, aa, ab2 = rgb_to_oklab(ar, ag, ab)
	local bl, ba, bb2 = rgb_to_oklab(br, bg, bb)
	return oklab_to_hex(al + (bl - al) * t, aa + (ba - aa) * t, ab2 + (bb2 - ab2) * t)
end

return M
