local modinfo = require("modinfo")
--[[ "name": "no-wall-repair",
    "version": "0.0.4",
    "factorio_version": "1.1",
    "title": "No Wall Repair",
    "author": "Pawz",
    "description": "Disable repair for walls. This will prevent bots from sitting on walls 'repairing' them and taking damage / dying needlessly."
    ]]

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

if settings.startup[modinfo.prefix .. 'no-wall-repair'].value then
    for k, wall in pairs(data.raw["wall"]) do
        if (string.find(wall.name, "wall")) then
            if (wall.flags) and (not has_value(wall.flags, "not-repairable")) then
                table.insert(wall.flags, "not-repairable")
            end
        end
    end

    for k, wall in pairs(data.raw["gate"]) do
        if (string.find(wall.name, "gate")) then
            if (wall.flags) and (not has_value(wall.flags, "not-repairable")) then
                table.insert(wall.flags, "not-repairable")
            end
        end
    end
end

--[[ "name": "Shinys-fireproof-signals",
        "title": "Shinys fireproof signals",
        "author": "ShinyAfro",
        "description": "Makes train signals fire-proof"
        ]]
if settings.startup[modinfo.prefix .. 'fireproof-rail-signals'].value then
    local signals = { 'rail-signal', 'rail-chain-signal', 'train-stop' }

    for _, s in pairs(signals) do
        for _, entity in pairs(data.raw[s]) do
            local changed = false
            entity.resistances = entity.resistances or {}
            for _, resistance in pairs(entity.resistances) do
                if resistance.type == 'fire' then
                    resistance.percent = 100
                    changed = true
                    break
                end
            end
            if not changed then
                table.insert(entity.resistances, { type = 'fire', percent = 100 })
            end
        end
    end
end

--[["name": "fireproof-land-mines",
	"version": "1.0.0",
	"factorio_version": "1.1",
	"title": "Fireproof Land Mines",
	"author": "Bodleum",
	"description": "Makes land mines completely fireproof.",
    ]]
if settings.startup[modinfo.prefix .. 'fireproof-land-mine'].value then
    for _, entity in pairs(data.raw["land-mine"]) do
        local changed = false
        entity.resistances = entity.resistances or {}
        for _, resistance in pairs(entity.resistances) do
            if resistance.type == 'fire' then
                resistance.percent = 100
                changed = true
                break
            end
        end
        if not changed then
            table.insert(entity.resistances, { type = 'fire', percent = 100 })
        end
    end
end

--[["name": "no_wall_alerts",
"version": "1.0.1",
"title": "No Wall Alerts",
"author": "exfret",	
"factorio_version": "1.1",
"description": "Don't get alerts for walls being damaged/destroyed.",
  ]]
if settings.startup[modinfo.prefix .. 'no-wall-alert'].value then
for k, wall in pairs(data.raw["wall"]) do
    wall.alert_when_damaged = false
end

for k, wall in pairs(data.raw["gate"]) do
    wall.alert_when_damaged = false
end
end
if settings.startup[modinfo.prefix .. 'no-wall-alert-landmines'].value then
    for k, landmine in pairs(data.raw["land-mine"]) do
        landmine.alert_when_damaged = false
    end
end



