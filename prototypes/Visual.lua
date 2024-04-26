local modinfo = require("modinfo")

data.raw["character"]["character"].damage_hit_tint = settings.startup[modinfo.prefix .. "damage-flash-color"].value -- damage_hit_tint = {a = 0,b = 0,g = 0,r = 1}

--[["name": "TintedGhosts",
        "version": "1.0.1",
        "title": "Tinted Ghosts",
        "description": "Tint ghosts to make them easier to see. Fully customizable!",
        "author": "raiguard",
        "contact": "https://github.com/raiguard/TintedGhosts",
        "homepage": "https://github.com/raiguard/TintedGhosts",
        "factorio_version": "1.1",
]]
data.raw["utility-constants"]["default"].ghost_tint = settings.startup[modinfo.prefix .. "ghost-tint"].value -- {r = 0.6, g = 0.6, b = 0.6, a = 0.3},
data.raw["utility-constants"]["default"].tile_ghost_tint = settings.startup[modinfo.prefix .. "tile-ghost-tint"].value -- {r = 0.8, g = 0.8, b = 0.8, a = 0.4}

--[[   "name": "ups-fps",
    "version": "0.3.1",
    "factorio_version": "1.1",
    "title": "More UPS, FPS",
    "author": "ZwerOxotnik",
    "contact": "zweroxotnik@gmail.com, Discord:ZwerOxotnik#7117",
    "homepage": "https://www.reddit.com/r/ZwerOxotnik/",
  ]]
if settings.startup[modinfo.prefix .. 'remove-biters-blood'].value then
    local explosions = data.raw['explosion']
    explosions['blood-explosion-small'].created_effect = nil
    explosions['blood-explosion-big'].created_effect = nil
    explosions['blood-explosion-huge'].created_effect = nil
end

-- Removes corpses and some effects in each unit
--for _, unit in pairs(data.raw.unit) do
--	unit.dying_explosion = nil
--	unit.corpse = nil
--end

--if settings.startup["ups-fps_remove-remnants"].value == true then
--	for _, prototype in pairs(data.raw) do
--		for _, entity in pairs(prototype) do
--			entity.corpse = nil
--		end
--	end