local cars = {
  {
    name = "Ford Mustang"
  },
  {
    name = "Audi R8"
  },
  {
    name = "Hilux"
  },
  {
    name = "Blazer"
  }
}

for i, v in pairs(cars) do
  print(v.name)
end
print("==========")

table.sort(cars, function(a, b)
  return a.name < b.name
end)

for i, v in pairs(cars) do
  print(v.name)
end
print("==========")
