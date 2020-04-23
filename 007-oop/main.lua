-- http://lua-users.org/wiki/SimpleLuaClasses
Person = {
  name
}

function Person:new(instance, name)
  instance = instance or {}
  setmetatable(instance, self)
  self.__index = self
  self.name = name
  return instance
end

-- static method
function Person.toLowerCase(str)
  return string.lower(str)
end

-- instance method
function Person:say()
  print(string.format("Hello World, my name is: %s!!!", self.name))
end

local ana = Person:new(nil, "Ana Carolina")

ana:say()
print(Person.toLowerCase("HELLO WORLD"))