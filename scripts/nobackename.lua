local modinfo = require("modinfo")
--[[	"name": "No_Lab_Names",
	"version": "1.0.0",
	"title": "No Lab Names",
	"author": "Preston Lee ℭole",
	"description": "No random backer name will be attached to any new Labs, Train stops, Trains, Roboports, Radars, or any other new entity you place, including modded entities like Repair turrets. Trains and Train stops are placed with blank names. This mod also removes existing names on these 3: Labs, Roboports, and Radars.",
	"factorio_version": "1.1",
	]]

local function on_built_entity(event)
	local entity = event.created_entity --or event.entity or event.destination

	if entity.supports_backer_name() and settings.global[modinfo.prefix .. 'no-backer-name'].value  then
		if entity.type == 'entity-ghost'and entity.ghost_name == 'train-stop'then return end
		if entity.type == 'entity-ghost'and entity.ghost_type == 'train-stop'then return end
 		if entity.type == 'train-stop' or entity.name == 'train-stop' then return end

		entity.backer_name = ""
	end
end

-- When an entity is built, remove its backer name.  
script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity}, on_built_entity)

	--[defines.events.on_built_entity] 
	--[defines.events.on_robot_built_entity] 
	--[defines.events.script_raised_built]
	--[defines.events.script_raised_revive] 
	--[defines.events.on_entity_cloned] 