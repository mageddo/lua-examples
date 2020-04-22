local a = 3

if( a > 2) then
  io.write("a is greater than 2\n")
elseif( a == 4) then
  io.write("a is equal to 4 and have the same data type \n")
else 
  io.write("a is smaller than 2\n")
end

io.write(string.format("\"2\" == 2 = %s\n", tostring("2" == 2)))
io.write(string.format("\"true\" == true = %s\n", tostring("true" == true)))
io.write(string.format("\"false\" == false = %s\n", tostring("false" == false)))
io.write(string.format("\"true\" == false = %s\n", tostring("true" == false)))
io.write(string.format("true == 1 = %s\n", tostring(true == 1)))


local x = 4

if(x) then
  io.write("x is true!\n")
else
  io.write("x is false!\n")
end