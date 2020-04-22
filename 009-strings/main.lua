local text = [[
  This is a 
  multiline text
]]
print(string.format("%s\n", text))


local textb = [==[
  This is a 
  multiline text also
]==]

print(string.format("%s\n", textb))

local someText = someVariableNotDefinedBefore
someVariableNotDefinedBefore = "Defined after it's use"
print(string.format("someText=%s, someVariableNotDefinedBefore=%s\n", tostring(someText), someVariableNotDefinedBefore))