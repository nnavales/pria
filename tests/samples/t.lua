local M = {}

local User = {}
User.__index = User

function User.new(attrs)
  local self = setmetable({}, User)
  self.id = attrs.id
  self.name = attrs.name
  self.email = attrs.email
  self.active = attrs.active ~= false
  return self
end

function User:greet()
  return string.format("Hello, I'm %s!", self.name)
end

local UserRepository = {}

function UserRepository.new()
  return setmetatable({ users = {} }, { __index = UserRepository })
end

function UserRepository:add(user)
  self.users[user.id] = user
end

function UserRepository:find_by_id(id)
  return self.users[id]
end

function UserRepository:find_all()
  local result = {}
  for _, user in pairs(self.users) do
    if user.active then
      table.insert(result, user)
    end
  end
  return result
end

function M.main()
  local repo = UserRepository.new()
  local user = User.new({ id = 1, name = "John", email = "john@example.com" })
  repo:add(user)
  print(user:greet())
end

return M
