local lfs = require "lfs"
local io = require "io"

--local oldPrint = print
-- local out = io.popen('find /v "" > con', "w")
-- function print(s)
--   out:write(s.."\r\n") --\r because windows
--   out:flush()
-- end
--print("It really works this time!")

--循环指定目录下所有文件，加入列表
local function listFile()
    local srcDir = "./SrcFiles"
    for f in lfs.dir(srcDir) do
        print(f)
    end
end

--[[
{
    "InputFormat" : "UG NX 3D (*.prt)",
    "InputFormatExt" : "UG NX 3D (*.prt)|*.prt|",
    "OutputFormat" : "SVL2.0 (*.svlx)",
    "OutputFormatExt" : ".svlx",
    "ConfigFile" : "\\Converters\\SVL2.0\\CadConverter\\CadConverter.config",
    "Input" : "UG NX 3D",
    "Output" : "SVL2.0",
    "ConverterInterface" : "\\Converters\\SVL2.0\\CadConverter\\CadConverter.exe"
 },

 --]]
local function convertFile(source,target,opt)
    --local t = io.popen('F:\\source\\SView\\转换器\\SViewConverter8.2.1.12-x64绿色版\\SViewConverterCmd.exe'.." "..source.." "..target)
    --local t = io.popen('F:\\source\\SView\\convert\\CADExchanger\\CADExchanger.exe'.." "..source.." "..target)
    local exe = "F:\\source\\SView\\convert\\CadConverter\\CADConverter.exe"
    local t = io.popen(exe.." "..source.." "..target .. " " .. opt)
    local a = t:read("*all")
    print(a)
    return a
end

--listFile()
local opt = "F:\\source\\SView\\convert\\CadConverter\\CADConverter.exe"
convertFile("SrcFiles\\pipe.prt", "TarFiles\\", opt)
print("end")

