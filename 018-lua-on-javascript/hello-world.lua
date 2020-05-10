function randomWord()
  local str = "";
  for i=0, 5 do
    str = str .. string.char(math.random(97, 122))
  end
  return str
end

function luaRandomWord()
  return randomWord()
end


js.global.randomWord = randomWord