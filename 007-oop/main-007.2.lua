-- http://lua-users.org/wiki/SimpleLuaClasses
function class(base, init)
  local c = {}    -- a new class instance
  if not init and type(base) == 'function' then
    init = base
    base = nil
  elseif type(base) == 'table' then
    -- our new class is a shallow copy of the base class!
    for i,v in pairs(base) do
      c[i] = v
    end
    c._base = base
  end
  -- the class will be the metatable for all its objects,
  -- and they will look up their methods in it.
  c.__index = c

  -- expose a constructor which can be called by <classname>(<args>)
  local mt = {}
  mt.__call = function(class_tbl, ...)
    local obj = {}
    setmetatable(obj,c)
    if init then
      init(obj,...)
    else
      -- make sure that any stuff from the base class is initialized!
      if base and base.init then
        base.init(obj, ...)
      end
    end
    return obj
  end
  c.init = init
  c.is_a = function(self, klass)
    local m = getmetatable(self)
    while m do
      if m == klass then return true end
      m = m._base
    end
    return false
  end
  setmetatable(c, mt)
  return c
end

Person = class(function(instance, name)
  instance.name = name
end)

-- static method
function Person.toLowerCase(str)
  print(Person.type) -- accessing as a static field
  return string.lower(str)
end

-- instance method
function Person:say()
  print(string.format("Hello World, my name is: %s!!!", self.name))
end

local people = {}
table.insert(people, Person("Ana Carolina"))
table.insert(people, Person("Bruna"))

for i, v in ipairs(people) do
  v:say()
end

-- static method call
print(Person.toLowerCase("HELLO WORLD"))