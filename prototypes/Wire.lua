local modinfo = require("modinfo")
--[[ "name": "AlmostInvisibleElectricWires",
  "version": "0.0.13",
  "title": "Almost Invisible Electric Wires",
  "author": "DellAquila, kuxynator",
  "description": "You can make the wires 80%, 50% or completely invisible. The Red and Green wire can be Blue and Yellow, or invisible too. Now you can customize it in settings.",
  TODO: High resulution sprites
  ]]
local sprites = data.raw["utility-sprites"]["default"]
local core_graphics = modinfo.graphics .. "AlmostInvisibleElectricWires"

if settings.startup[modinfo.prefix .. "wire-color"].value == "Invisible" then
  sprites["copper_wire"].filename = core_graphics .. "/copper-wire.png"
  sprites["copper_wire"].hr_version.filename = core_graphics .. "/hr-copper-wire.png"
  sprites["wire_shadow"].filename = core_graphics .. "/transparent.png"
elseif settings.startup[modinfo.prefix .. "wire-color"].value == "Visible 80%" then
  sprites["copper_wire"].filename = core_graphics .. "/80-copper-wire.png"
  sprites["copper_wire"].hr_version.filename = core_graphics .. "/80-hr-copper-wire.png"
  sprites["wire_shadow"].filename = core_graphics .. "/transparent.png"
elseif settings.startup[modinfo.prefix .. "wire-color"].value == "Visible 50%" then
  sprites["copper_wire"].filename = core_graphics .. "/50-copper-wire.png"
  sprites["copper_wire"].hr_version.filename = core_graphics .. "/50-hr-copper-wire.png"
  sprites["wire_shadow"].filename = core_graphics .. "/transparent.png"
elseif settings.startup[modinfo.prefix .. "wire-color"].value == "Visible 30%" then
  sprites["copper_wire"].filename = core_graphics .. "/30-copper-wire.png"
  sprites["copper_wire"].hr_version.filename = core_graphics .. "/30-hr-copper-wire.png"
  sprites["wire_shadow"].filename = core_graphics .. "/transparent.png"
end

if settings.startup[modinfo.prefix .. "wire-color-green"].value == "Invisible" then
  sprites["green_wire"].filename = core_graphics .. "/green-wire.png"
  sprites["green_wire"].hr_version.filename = core_graphics .. "/hr-green-wire.png"
  --  sprites.green_wire_shadow.filename = core_graphics .. "/transparent.png"
elseif settings.startup[modinfo.prefix .. "wire-color-green"].value == "Visible 50%" then
  sprites["green_wire"].filename = core_graphics .. "/50-green-wire.png"
  sprites["green_wire"].hr_version.filename = core_graphics .. "/50-hr-green-wire.png"
  -- sprites.green_wire_shadow.filename = core_graphics .. "/transparent.png"
end

if settings.startup[modinfo.prefix .. "wire-color-red"].value == "Invisible" then
  sprites["red_wire"].filename            = core_graphics .. "/red-wire.png"
  sprites["red_wire"].hr_version.filename = core_graphics .. "/hr-red-wire.png"
  -- sprites.red_wire_shadow.filename = core_graphics .. "/transparent.png"
elseif settings.startup[modinfo.prefix .. "wire-color-red"].value == "Visible 50%" then
  sprites["red_wire"].filename            = core_graphics .. "/50-red-wire.png"
  sprites["red_wire"].hr_version.filename = core_graphics .. "/50-hr-red-wire.png"
  -- sprites.red_wire_shadow.filename = core_graphics .. "/transparent.png"
end
--[[ "name": "ThickerLines",
  "version": "0.0.5",
  "title": "Thicker Power Wires",
  "author": "Lachlan McDonald",
  "factorio_version": "1.1",
  "description": "Improved visibility of power lines and circuit wires"
]]

local core_graphics = modinfo.graphics .. "ThickerLines"

if settings.startup[modinfo.prefix .. "wire-color"].value == "Thicker" then
  sprites["copper_wire"].filename            = core_graphics .. "/copper-wire.png"
  sprites["copper_wire"].hr_version.filename = core_graphics .. "/hr-copper-wire.png"
  sprites["wire_shadow"].filename            = core_graphics .. "/wire-shadow.png"
  sprites["wire_shadow"].hr_version.filename = core_graphics .. "/hr-wire-shadow.png"
end

if settings.startup[modinfo.prefix .. "wire-color-red"].value == "Thicker" then
  sprites["red_wire"].filename                       = core_graphics .. "/red-wire.png"
  sprites["red_wire"].hr_version.filename            = core_graphics .. "/hr-red-wire.png"
  sprites["red_wire_hightlight"].filename            = core_graphics .. "/wire-highlight.png"
  sprites["red_wire_hightlight"].hr_version.filename = core_graphics .. "/hr-wire-highlight.png"
end

if settings.startup[modinfo.prefix .. "wire-color-green"].value == "Thicker" then
  sprites["green_wire"].filename                       = core_graphics .. "/green-wire.png"
  sprites["green_wire"].hr_version.filename            = core_graphics .. "/hr-green-wire.png"
  sprites["green_wire_hightlight"].filename            = core_graphics .. "/wire-highlight.png"
  sprites["green_wire_hightlight"].hr_version.filename = core_graphics .. "/hr-wire-highlight.png"
end
