function randomWord()
  local str = "";
  for i=0, 5 do
    str = str .. string.char(math.random(97, 122))
  end
  return str
end


js.global.randomWord = randomWord