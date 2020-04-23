-- http://lua-users.org/wiki/SimpleLuaClasses
Person = {
  name,
  type = "Enterprise"
}

function Person:new(instance, name)
  instance = instance or {}
  setmetatable(instance, self)
  self.__index = self
  instance.name = name
  return instance
end

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
table.insert(people, Person:new(nil, "Ana Carolina"))
table.insert(people, Person:new(nil, "Bruna"))

for i, v in ipairs(people) do
  v:say()
end

-- static method call
print(Person.toLowerCase("HELLO WORLD"))