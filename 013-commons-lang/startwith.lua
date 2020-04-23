ss1 = "hello"
ss2 = "does not start with hello"
ss3 = "does not even contain hello"

pattern = "^hello"

print(ss1:find(pattern) ~= nil)  -- true:  correct
print(ss2:find(pattern) ~= nil)  -- false: correct
print(ss3:find(pattern) ~= nil)  -- false: correct