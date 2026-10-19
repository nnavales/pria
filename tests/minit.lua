#!/usr/bin/env -S nvim -l

vim.env.LAZY_STDPATH = ".tests"
vim.env.LAZY_PATH = vim.fs.normalize("~/projects/lazy.nvim")

if vim.fn.isdirectory(vim.env.LAZY_PATH) == 1 then
	loadfile(vim.env.LAZY_PATH .. "/bootstrap.lua")()
else
	load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"), "bootstrap.lua")()
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

local opt = vim.opt
opt.inccommand = "split"
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = false
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.cursorline = true
opt.wrap = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.scrolloff = 8
opt.termguicolors = true
opt.formatoptions:remove("o")
opt.guicursor = ""
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.isfname:append("@-@")
opt.autoread = true
opt.smoothscroll = true
opt.updatetime = 100
opt.scrolloff = 8
opt.clipboard = "unnamedplus"
vim.opt.rtp:append(vim.fs.normalize("~/.local/share/nvim/site"))

local plugins = {
	{
		dir = vim.uv.cwd(),
		opts = {
			plugins = {},
		},
		priority = 1000,
		lazy = false,
	},

	{
		"echasnovski/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "pria_transparent",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					globalstatus = true,
					disabled_filetypes = {
						statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
					},
				},
			})
		end,
	},

	{
		"stevearc/oil.nvim",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = { "icon" },
				buf_options = {
					buflisted = false,
					bufhidden = "hide",
				},
				win_options = {
					wrap = false,
					signcolumn = "no",
					cursorcolumn = false,
					foldcolumn = "0",
					spell = false,
					list = false,
					conceallevel = 3,
					concealcursor = "nvic",
					cursorline = true,
				},
			})
			vim.api.nvim_set_keymap("n", "<leader>e", ":Oil<CR>", { noremap = true, silent = true, desc = "Oil" })
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			lspkind.init({})

			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
				}),
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					}),
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = function()
			local parsers = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"svelte",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"rust",
				"go",
				"sql",
				"c",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"bash",
				"dockerfile",
			}
			require("nvim-treesitter").install(parsers):wait(300000)
		end,
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fs.normalize("~/.local/share/nvim/site"),
			})

			require("nvim-treesitter").install({
				"lua",
				"vim",
				"vimdoc",
				"query",
				"svelte",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"rust",
				"go",
				"c",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"bash",
				"dockerfile",
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"lua",
					"vim",
					"vimdoc",
					"query",
					"svelte",
					"python",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"rust",
					"go",
					"c",
					"html",
					"css",
					"json",
					"yaml",
					"markdown",
					"bash",
					"dockerfile",
				},
				callback = function()
					local ok = pcall(vim.treesitter.start)
					if not ok then
						require("nvim-treesitter").install({ vim.bo.filetype }):wait(300000)
						pcall(vim.treesitter.start)
					end
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true,
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "V",
					},
					include_surrounding_whitespace = false,
				},
				move = {
					enable = true,
					set_jumps = true,
				},
				swap = {
					enable = true,
				},
			})

			local ts_select = require("nvim-treesitter-textobjects.select")
			for _, mode in ipairs({ "x", "o" }) do
				vim.keymap.set(mode, "af", function()
					ts_select.select_textobject("@function.outer", "textobjects")
				end)
				vim.keymap.set(mode, "if", function()
					ts_select.select_textobject("@function.inner", "textobjects")
				end)
				vim.keymap.set(mode, "ac", function()
					ts_select.select_textobject("@class.outer", "textobjects")
				end)
				vim.keymap.set(mode, "ic", function()
					ts_select.select_textobject("@class.inner", "textobjects")
				end)
			end

			local ts_move = require("nvim-treesitter-textobjects.move")
			for _, mode in ipairs({ "n", "x", "o" }) do
				vim.keymap.set(mode, "]f", function()
					ts_move.goto_next_start("@function.outer", "textobjects")
				end)
				vim.keymap.set(mode, "[f", function()
					ts_move.goto_previous_start("@function.outer", "textobjects")
				end)
				vim.keymap.set(mode, "]c", function()
					ts_move.goto_next_start("@class.outer", "textobjects")
				end)
				vim.keymap.set(mode, "[c", function()
					ts_move.goto_previous_start("@class.outer", "textobjects")
				end)
			end
		end,
	},

	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		cmd = "Neogit",
		keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" } },
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = { enabled = false },
				search = { enabled = false },
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
	},

	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
	},

	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("noice").setup({
				cmdline = { enabled = true, view = "cmdline" },
				messages = { enabled = true, view = "notify", view_error = "notify", view_warn = "notify" },
				popupmenu = { enabled = true },
				notify = { enabled = true, view = "notify" },
				lsp = {
					hover = { enabled = true },
					signature = { enabled = true },
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = true,
				},
			})
		end,
	},

	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			dashboard = {
				enabled = false,
			},
			input = { enabled = true },
			picker = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
		},
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = true, terminal = false },
			})
			require("mini.move").setup({
				mappings = {
					left = "H",
					right = "L",
					down = "J",
					up = "K",
				},
			})
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},

	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
		event = { "VeryLazy" },
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				lazy = true,
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				lazy = true,
			},
		},
		config = function()
			vim.defer_fn(function()
				local mason = require("mason")
				mason.setup({
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				})

				vim.defer_fn(function()
					local mason_lspconfig = require("mason-lspconfig")
					mason_lspconfig.setup({
						ensure_installed = {
							"ts_ls",
							"html",
							"cssls",
							"tailwindcss",
							"gopls",
							"svelte",
							"bashls",
							"lua_ls",
							"pyright",
							"dockerls",
							"yamlls",
						},
						automatic_installation = true,
					})

					vim.defer_fn(function()
						local mason_tool_installer = require("mason-tool-installer")
						mason_tool_installer.setup({
							ensure_installed = {
								"prettier",
								"prettierd",
								"stylua",
								"goimports",
								"shfmt",
								"eslint_d",
								"eslint",
								"ruff",
								"golangci-lint",
								"gofumpt",
							},
						})
					end, 100)
				end, 50)
			end, 0)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
		},
		config = function()
			require("lazydev").setup({})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.offsetEncoding = { "utf-16" }
			capabilities.workspace = capabilities.workspace or {}
			capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }

			local function on_attach(_, bufnr)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"gD",
					"<Cmd>rightbelow vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"gd",
					"<Cmd>lua vim.lsp.buf.hover()<CR>",
					{ noremap = true, silent = true }
				)
			end

			local servers = {
				gopls = {
					settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},
				pyright = {
					settings = {
						pyright = {},
						python = {
							analysis = {
								ignore = { "*" },
								typeCheckingMode = "off",
							},
						},
					},
				},
				html = {
					filetypes = { "html", "templ", "gohtml", "gotmpl" },
				},
				ts_ls = {},
				tailwindcss = {
					filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "svelte" },
				},
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = { enable = false },
							format = { enable = false },
						},
					},
				},
			}

			for name, config in pairs(servers) do
				config = vim.tbl_deep_extend("force", {
					capabilities = capabilities,
					on_attach = on_attach,
				}, config)
				vim.lsp.config(name, config)
			end

			vim.diagnostic.config({
				float = {
					focusable = true,
					style = "minimal",
					border = "single",
					source = true,
					header = "",
					prefix = "",
				},
			})
		end,
	},

	{
		"dmtrKovalenko/fff.nvim",
		dir = vim.fs.normalize("~/.local/share/nvim/lazy/fff.nvim"),
		build = function()
			require("fff.download").download_or_build_binary()
		end,
		lazy = false,
		opts = {
			debug = {
				enabled = false,
				show_scores = false,
			},
			prompt = "> ",
			title = "Files",
			layout = {
				prompt_position = "top",
				preview_position = "right",
				show_scrollbar = false,
				path_shorten_strategy = "middle_number",
			},
			hl = {
				border = "FFFBorder",
				normal = "FFFNormal",
				cursor = "FFFCursor",
				matched = "FFFMatch",
				title = "FFFTitle",
				prompt = "FFFPrompt",
				frecency = "FFFFrecency",
				debug = "FFFDebug",
				combo_header = "FFFComboHeader",
				directory_path = "FFFDir",
				grep_match = "FFFMatch",
				grep_line_number = "FFFGrepLineNumber",
				grep_regex_active = "FFFGrepRegexActive",
				grep_plain_active = "FFFGrepPlainActive",
				grep_fuzzy_active = "FFFGrepFuzzyActive",
			},
		},

		keys = {
			{
				"<space>ff",
				function()
					require("fff").find_files()
				end,
				desc = "Find files",
			},
		},
	},

	{ "folke/lazy.nvim", version = false },
}

local theme = require("pria")
theme.load()

require("lazy.minit").setup({ spec = plugins })

vim.api.nvim_create_user_command("ReloadTheme", function()
	for k in pairs(package.loaded) do
		if k:find("^pria") then
			package.loaded[k] = nil
		end
	end
	theme.load()
	print("Theme reloaded")
end, {})

vim.keymap.set("n", "<leader>r", ":ReloadTheme<CR>", { desc = "Reload theme" })

local set = vim.keymap.set

set("v", "<", "<gv", { silent = true })
set("v", ">", ">gv", { silent = true })

set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
