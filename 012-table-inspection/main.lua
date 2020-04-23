function printObj(obj, hierarchyLevel)
  if (hierarchyLevel == nil) then
    hierarchyLevel = 0
  elseif (hierarchyLevel == 4) then
    return 0
  end

  local whitespace = ""
  for i=0,hierarchyLevel,1 do
    whitespace = whitespace .. "-"
  end
  io.write(whitespace)

  print(obj)
  --print(string.format("%s: %s", tostring(obj), tostring(name)))
  if (type(obj) == "table") then
    for k,v in pairs(obj) do
      io.write(whitespace .. "-")
      if (type(v) == "table") then
        printObj(v, hierarchyLevel+1)
      else
        print(string.format("%s %s: %s", type(v), tostring(k), tostring(v)))
      end
    end
  else
    print(obj)
  end
end

function print_r ( t )
  local print_r_cache={}
  local function sub_print_r(t,indent)
    if (print_r_cache[tostring(t)]) then
      print(indent.."*"..tostring(t))
    else
      print_r_cache[tostring(t)]=true
      if (type(t)=="table") then
        for pos,val in pairs(t) do
          if (type(val)=="table") then
            print(indent.."["..pos.."] => "..tostring(t).." {")
            sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
            print(indent..string.rep(" ",string.len(pos)+6).."}")
          else
            print(indent.."["..pos.."] => "..tostring(val))
          end
        end
      else
        print(indent..tostring(t))
      end
    end
  end
  sub_print_r(t,"  ")
end

local Person = {
  name = "Ana",
  Brother = {
    act = function() end
  }
}

function Person:say()
  return "something"
end

function Person.wordPhrase()
  return "some random  phrase"
end

printObj(Person, 2)
print()
print(print_r(Person))
