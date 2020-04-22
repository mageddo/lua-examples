-- sum the keys of the passed table
function summArrayItems(a)
  local sum = 0
  for i,v in ipairs(a) do
    sum = sum + v
  end
  return sum
end

io.write("summArrayItems=", summArrayItems({1, 2, 3}), "\n")


-- sum two properties of an object
function sum(o)
  return o.a + o.b
end
io.write("sum=", sum({a=5, b=4}), "\n")

-- sum two params
function sum2(a, b)
  return a + b
end
io.write("sum2=", sum2(6, 2), "\n")


-- suming two objects by defining it's metatable
function sum3(a, b)
  return a + b
end

function myTableSumFunction(x, y)
  return x.amount + y.amount
end

local mt = { __add = myTableSumFunction }
local a = {amount = 3}
local b = {amount = 2}

setmetatable(a, mt)
setmetatable(b, mt)

io.write("sum3=", sum3(a, b), "\n")
