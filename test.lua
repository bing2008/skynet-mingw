local lfs = require "lfs"
local io = require "io"

--local oldPrint = print
-- local out = io.popen('find /v "" > con', "w")
-- function print(s)
--   out:write(s.."\r\n") --\r because windows
--   out:flush()
-- end
print("It really works this time!")

--循环指定目录下所有文件，加入列表
local srcDir = "./SrcFiles"
for f in lfs.dir(srcDir) do
    print(f)
end

--print = oldPrint
