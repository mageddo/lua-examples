-- coroutines can't run in parallel
-- they just can be suspended then resumed using coroutine.yield

function luaSleep(s)
local ntime = os.clock() + s/10
repeat until os.clock() > ntime
end

local a = coroutine.create(function()
  --luaSleep(10)
  for i=0, 100 do
    print("a")
  end
end)
local b = coroutine.create(function()
  --luaSleep(40)
  for i=0, 100 do
    print("b")
  end
end)

coroutine.resume(a)
coroutine.resume(b)
print("end")