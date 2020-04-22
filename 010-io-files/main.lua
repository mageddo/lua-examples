fname = string.format("G:\%s", os.tmpname())
tmpFile = io.open(fname, "a")
tmpFile:write("--test")
tmpFile:close()

print(string.format("file = %s", tostring(fname)))
