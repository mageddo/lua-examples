local x=1

function printY()
  z=55
  local y=32
  io.write("m=printY, x=", x, ", y=", y, ", z=", z, "\n")
end

printY()
io.write("m=main, x=", x, ", y=", tostring(y), ", z=", z, "\n")
