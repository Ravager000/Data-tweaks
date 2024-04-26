local modinfo = require("modinfo")
local player_character = data.raw["character"]["character"]
--[[ "name": "PickerTweaks",
  "version": "2.2.7",
  "factorio_version": "1.1",
  "title": "Picker Tweaks",
  "author": "Nexela",
  "contact": "nexela@gmail.com",
  "homepage": "https://forums.factorio.com/viewtopic.php?f=93&t=14695",
  "description": "Picker Tweaks, and Fixes",
  ]]
local inv_size = settings.startup[modinfo.prefix .. 'pc-inventory-size'].value -- inventory_size = 80,
if player_character.inventory_size < inv_size then player_character.inventory_size = inv_size end

player_character.build_distance = settings.startup[modinfo.prefix .. 'pc-build-distance'].value                 -- build_distance = 10,
player_character.reach_distance = settings.startup[modinfo.prefix .. 'pc-reach-distance'].value                 -- reach_distance = 10,
player_character.reach_resource_distance = settings.startup[modinfo.prefix .. 'pc-reach-resource-distance'].value    --  reach_resource_distance = 2.7000000000000002,
player_character.drop_item_distance = settings.startup[modinfo.prefix .. 'pc-drop-item-distance'].value            --  drop_item_distance = 10,
player_character.loot_pickup_distance = settings.startup[modinfo.prefix .. 'pc-loot-pickup-distance'].value         -- loot_pickup_distance = 2,
player_character.item_pickup_distance = settings.startup[modinfo.prefix .. 'pc-item-pickup-distance'].value        -- item_pickup_distance = 1,

player_character.enter_vehicle_distance = settings.startup[modinfo.prefix .. 'pc-enter-vehicle-distance'].value       -- enter_vehicle_distance = 3,
player_character.healing_per_tick = settings.startup[modinfo.prefix .. 'pc-healing-per-tick'].value                --/60 -- healing_per_tick = 0.15, 60 tick per sec
player_character.ticks_to_stay_in_combat = settings.startup[modinfo.prefix .. "pc-ticks-to-stay-in-combat"].value    --*60 --ticks_to_stay_in_combat = 600,   60 tick per sec
player_character.max_health = settings.startup[modinfo.prefix .. 'pc-max-health'].value                         -- max_health = 250,
player_character.mining_speed = settings.startup[modinfo.prefix .. 'pc-mining-speed'].value                     -- mining_speed = 0.5,
player_character.running_speed = settings.startup[modinfo.prefix .. 'pc-running-speed'].value                   -- running_speed = 0.15,
player_character.has_belt_immunity = settings.startup[modinfo.prefix .. 'pc-has-belt-immunity'].value          -- has_belt_immunity = false,

-- Hide the technology, as a reminder you're already running this mod.
-- Once you're at the tech level to unlock the equipment,
-- you could disable this mod and switch to the equipment.
--data.raw.technology["belt-immunity-equipment"].hidden = true

-- Hide the recipe.
-- If you unlocked the technology previously,
-- but have still decided to run this mod,
-- you don't need the recipe cluttering your interface.
--data.raw.recipe["belt-immunity-equipment"].hidden = true
--[[
local modifiers = {
    [1] = 'build_distance',
    [2] = 'crafting_speed',
    [3] = 'max_health',
    [4] = 'inventory_size',
    [5] = 'drop_item_distance',
    [6] = 'item_pickup_distance',
    [7] = 'loot_pickup_distance',
    [8] = 'mining_speed',
    [9] = 'reach_distance',
    [10] = 'reach_resource_distance',
    [11] = 'running_speed',
	[12] = 'enter_vehicle_distance',
	[13] = 'has_belt_immunity'	
}
]]
