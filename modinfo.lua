-- Usage: local modinfoinfo = require("modinfo")
-- modinfo.prefix..

--defines globals libs for this modinfo
--LibPath="__CoreLib__/lib/"
--DataPath="__PrototypeData__/"

local modinfo = {}
modinfo.name = "Data-tweaks"
modinfo.prefix = modinfo.name .. "-"
modinfo.path = "__" .. modinfo.name .. "__/"
modinfo.graphics = modinfo.path .. "graphics/"
return modinfo
