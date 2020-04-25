local status, err = pcall(function()
  error("some error")
end)

print(string.format("status=%s, error=%s", tostring(status), tostring(err)))