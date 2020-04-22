local a = {"one", "two", "three"}
for i, v in pairs(a) do
  io.write(string.format("i=%s, v=%s\n", i, v))
end

io.write("\n")


for i=1,6, 2 do
  io.write(string.format("i=%s\n", i))
end