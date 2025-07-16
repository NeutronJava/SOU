-- Program to download and play sou on loop.
-- code edited from https://github.com/Axisok/qtccv/blob/master/sample/playbadapple.lua
local badapplerepository = "https://raw.githubusercontent.com/Axisok/qtccv/master/"
local myrepository = "https://raw.githubusercontent.com/NeutronJava/SOU/master/"

local function getFile(name, lname, repository)
	local r = http.get(repository .. name, nil, true)
	local f = fs.open(lname, "wb")
	f.write(r.readAll())
	f.close()
	
end

if (not fs.exists("sou.qtv")) then
	getFile("decode/apis/bitreader.lua", "apis/bitreader.lua", badapplerepository)
	getFile("decode/apis/hexscreen.lua", "apis/hexscreen.lua", badapplerepository)
	getFile("audioversion/souplayer.lua", "souplayer.lua", myrepository)
	getFile("audioversion/sou.dfpwm", "sou.dfpwm", myrepository)
	getFile("sample/sou.qtv", "sou.qtv", myrepository)
	
end

shell.run("souplayer", "sou")
