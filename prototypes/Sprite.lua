local modinfo = require("modinfo")



--[[ "name":"Humble_Alt_Mode_Shadow",
	"author":"Preston Lee ℭole",
	"version":"1.0.0",
	"title":"Humble Alt-Mode Shadow",
	"description":"Do the black shadows behind icons in Alt-mode distract you? Humble those Alt-Mode Shadows. Mod default options work out-of-the-box. Mod is configurable with 4 options for shadow color, shadow opacity, and shadow radius.",
	"factorio_version":"1.1",
]]
local utility = data.raw["utility-constants"]["default"]

local color_string = settings.startup[modinfo.prefix .. "alt-shadow-color"].value
local opacity_string = settings.startup[modinfo.prefix .. "alt-shadow-opacity"].value
local radius_string = settings.startup[modinfo.prefix .. "alt-shadow-radius"].value

local color = 0.00 --vanilla
if color_string == "minimal" then color = 0.06 end
if color_string == "less-noticeable" then color = 0.04 end
if color_string == "noticeable" then color = 0.02 end

local opacity = 1.00 --vanilla
if opacity_string == "minimal" then opacity = 0.65 end
if opacity_string == "less-noticeable" then opacity = 0.77 end
if opacity_string == "noticeable" then opacity = 0.89 end

local radius = 16 --vanilla
if radius_string == "minimal" then radius = 10 end
if radius_string == "less-noticeable" then radius = 12 end
if radius_string == "noticeable" then radius = 14 end

utility.item_outline_color = { color, color, color, opacity }
utility.filter_outline_color = { color, color, color, opacity }
utility.item_outline_radius = radius

--[[  "name": "BorderedAlertIcons_NtmFork",
  "version": "0.2.1",
  "factorio_version": "1.1",
  "title": "Bordered Alert Icons (Ntm fork)",
  "author": "Newtomic",
  "description": "Restores borders to alert icons, added custom settings for Scale, Offset and Icons.",
  ]]


local v_scale = settings.startup[modinfo.prefix .. "icon-scale"].value
local v_shift = {settings.startup[modinfo.prefix .. "icon-shift-x"].value, settings.startup[modinfo.prefix .. "icon-shift-y"].value}

-- \core\prototypes\utility-sprites.lua
local sprite_path = data.raw["utility-sprites"].default
local sprite1 = sprite_path.ammo_icon
sprite1.scale = v_scale
sprite1.shift = v_shift
local sprite2 = sprite_path.danger_icon
sprite2.scale = v_scale
sprite2.shift = v_shift
local sprite3 = sprite_path.destroyed_icon
sprite3.scale = v_scale
sprite3.shift = v_shift
local sprite4 = sprite_path.electricity_icon
sprite4.scale = v_scale
sprite4.shift = v_shift
local sprite5 = sprite_path.electricity_icon_unplugged
sprite5.scale = v_scale
sprite5.shift = v_shift
local sprite6 = sprite_path.fluid_icon
sprite6.scale = v_scale
sprite6.shift = v_shift
local sprite7 = sprite_path.fuel_icon
sprite7.scale = v_scale
sprite7.shift = v_shift
local sprite8 = sprite_path.no_building_material_icon
sprite8.scale = v_scale
sprite8.shift = v_shift
local sprite9 = sprite_path.no_storage_space_icon
sprite9.scale = v_scale
sprite9.shift = v_shift
local sprite10 = sprite_path.not_enough_construction_robots_icon
sprite10.scale = v_scale
sprite10.shift = v_shift
local sprite11 = sprite_path.not_enough_repair_packs_icon
sprite11.scale = v_scale
sprite11.shift = v_shift
local sprite12 = sprite_path.recharge_icon
sprite12.scale = v_scale
sprite12.shift = v_shift
local sprite13 = sprite_path.too_far_from_roboport_icon
sprite13.scale = v_scale
sprite13.shift = v_shift
local sprite14 = sprite_path.warning_icon
sprite14.scale = v_scale
sprite14.shift = v_shift

-- \base\prototypes\entity\demo-entities.lua
local sprite15 = data.raw["item-request-proxy"]["item-request-proxy"].picture
sprite15.scale = v_scale
sprite15.shift = v_shift