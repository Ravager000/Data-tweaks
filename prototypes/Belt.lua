local modinfo = require("modinfo")
--[["name": "belt-legacy",
    "version": "1.1.5",
    "factorio_version": "1.1",
    "title": "Belt Legacy",
    "author": "fishycat",
    "description": "Tired of accidentally replacing underground-belts and splitters with transport-belts? Then this small mod is for you. When activated they can't fast-replace each other anymore. For a safer bus building. For Vanilla and for Bob's basic, green and purple belt stuff.",
]]
if settings.startup[modinfo.prefix .. "fast-replaceable-protection"].value then
    for _, entity in pairs(data.raw['underground-belt']) do
        entity.fast_replaceable_group = "underground-belt" -- fast_replaceable_group = "transport-belt",
    end
    for _, entity in pairs(data.raw['splitter']) do
        entity.fast_replaceable_group = "splitter"  -- fast_replaceable_group = "transport-belt",
    end
end
--[["name": "car-belt-immunity",
	"version": "1.0.0",
	"title": "car belt immunity",
	"description": "A mod that makes vehicles immune to belt movement",
	"author": "commanderguy3001",
	"factorio_version": "1.1",
    ]]
if settings.startup[modinfo.prefix .. "car-belt-immunity"].value then
for _, entity in pairs(data.raw['car']) do
	entity.has_belt_immunity = true
end
end