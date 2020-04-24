function bytesToStr (bytes)
  local buff = ""
  for i = 1, #bytes do
    buff = buff .. string.char(bytes[i])
  end
  return buff
end


print(string.char(65, 100, 75))
print(bytesToStr({ 65, 100, 75 }))