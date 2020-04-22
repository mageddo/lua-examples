Person = {
  name
}

function Person:new(instanc, name)
  instanc = instanc or {}
  setmetatable(instanc, self)
  self.__index = self
  self.name = name
  return instanc
end

function Person:say()
  io.write(string.format("Hello World, my name is: %s!!!", self.name))
end

local ana = Person:new(nil, "Ana Carolina")
ana:say()