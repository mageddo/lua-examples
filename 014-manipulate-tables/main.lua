-- https://www.lua.org/pil/19.2.html

a = {}
for k, line in pairs({1, 3, 5, 10}) do
  table.insert(a, line)
end
print(table.getn(a))