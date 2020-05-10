// using page instead of the console
console.info = function(){
  let pre = document.querySelector("pre");
  Array
    .prototype
    .slice
    .call(arguments)
    .forEach(it => pre.innerHTML += it)
  ;
  pre.innerHTML += "\n";
} 

// preparing lua env
const lua = fengari.lua
const lauxlib = fengari.lauxlib
const lualib   = fengari.lualib
const L = lauxlib.luaL_newstate()
lualib.luaL_openlibs(L)

// executing some lua code
mfn = `
function sum(a, b)
  return a + b
end
`
if(lauxlib.luaL_dostring(L, fengari.to_luastring(mfn)) != lua.LUA_OK){
  throw "error loading lua script: " + fengari.to_jsstring(lua.lua_tostring(L, -1));
}

// calling the executed load code from javascript
if(lua.lua_getglobal(L, fengari.to_luastring("sum")) == 0){
  throw "Didn't find the passed function"
}

lua.lua_pushnumber(L, 4); 
lua.lua_pushnumber(L, 7);

let params = 2
let returnParams = 1
if (lua.lua_pcall(L, params, returnParams, 0) != lua.LUA_OK){
  throw "error running function: " + fengari.to_jsstring(lua.lua_tostring(L, -1));
}

// reading the function return result
if (!lua.lua_isnumber(L, -1)){
  throw "must return a number: " + fengari.to_jsstring(lua.lua_tostring(L, -1))
}
let r = lua.lua_tonumber(L, -1);
let rUsingEasiestCall = fengari.interop.tojs(L, -1);
lua.lua_pop(L, 1);

console.info("sum is: ", r)
console.info("sum using easiest return call: ", rUsingEasiestCall);
