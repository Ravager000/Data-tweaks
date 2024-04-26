local modinfo = require("modinfo")
-- Extra setting included in Squeak Through

--[[ "name": "tree_collision",
"version": "1.1.0",
"factorio_version": "1.1",
"title": "Tree Collision",
"author": "skomick",
"contact": "https://mods.factorio.com/mod/tree_collision/discussion",
"description": "Makes tree collision box very small - easily traverse dense forests"
]]
if settings.startup[modinfo.prefix .. 'smaller-tree-box'].value then
	for _, smaller_tree in pairs(data.raw['tree']) do
		if smaller_tree.collision_box then
			smaller_tree.collision_box = { { -0.05, -0.05 }, { 0.05, 0.05 } } -- {{-0.4, -0.4}, {0.4, 0.4}}
		end
	end
end

--[[ "name": "pumping_from_landfill",
	"version": "0.0.1",
	"factorio_version": "1.1",
	"title": "pumping from landfill",
	"description":"pumping from landfill",
	"author": "meifray",
    ]]
if settings.startup[modinfo.prefix .. 'pumping-from-landfill'].value then
	local water_contained_layer = require("__core__/lualib/collision-mask-util").get_first_unused_layer();

	for _, tile in pairs(data.raw.tile) do
		if (tile.name == "landfill" or tile.water_contained) then
			table.insert(tile.collision_mask, water_contained_layer);
		end
	end

	data.raw["offshore-pump"]["offshore-pump"].adjacent_tile_collision_mask = {};
	table.insert(data.raw["offshore-pump"]["offshore-pump"].adjacent_tile_collision_test, water_contained_layer);
end
