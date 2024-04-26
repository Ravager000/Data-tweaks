local modinfo = require("modinfo")

local function get_flag(flags, need)
    local pos
    if type(flags) == "table" and type(need) == "string" then
      for i = 1, table_size(flags) do
        if flags[i] == need then
          pos = i
          break
        end
      end
    end
    return pos
  end
--[[ "name": "NoArtilleryMapReveal",
"version": "0.1.6",
"title": "NoArtilleryMapReveal",
"author": "JohnTheCoolingFan",
"contact": "https://discord.gg/KPnETvMDYk",
"homepage": "https://discord.gg/KPnETvMDYk",
"description": "Make artillery projectiles to not reveal map.",
]]

--data.raw["recipe"]["artillery-shell"].ingredients ={{"explosive-cannon-shell", 4},{"explosives", 8}}

if settings.startup[modinfo.prefix .. 'no-artillery-reveal'].value then
    local arty = data.raw['artillery-projectile']['artillery-projectile']
    arty.reveal_map = false
    arty.action.action_delivery.target_effects[4] = nil
end

--[[ "name": "rz-LandmineGridlock",
    "version": "0.0.1",
    "title": "Landmine Gridlock",
    "author": "RusselRaZe", Doctor_Goose's
    "factorio_version": "1.1",
    "description": "Landmines will be locked to the grid. Includes modded landmines. Inspired by Doctor_Goose's mod with same name."
    ]]
if settings.startup[modinfo.prefix .. 'landmine-gridlock'].value then
    for _, entity in pairs(data.raw["land-mine"]) do
        local flags = get_flag(entity.flags, 'placeable-off-grid')
        table.remove(entity.flags, flags)
    end
end

if settings.startup[modinfo.prefix .. 'low-radar-reveal'].value then
    local radar = data.raw['radar']['radar']

    radar.max_distance_of_nearby_sector_revealed = 3 -- max_distance_of_nearby_sector_revealed = 3,
    radar.max_distance_of_sector_revealed = 6     -- max_distance_of_sector_revealed = 14,
end
