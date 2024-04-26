local modinfo = require("modinfo")
-- Extra setting included in SmallRobots 

--[["name": "fireproof-worker-bots",
	"version": "1.0.0",
	"factorio_version": "1.1",
	"title": "Fireproof Worker Bots",
	"author": "KamiUnitY",Nauviax
	"description": "Give construction and logistic bots 100% fire resistance. forked from Invincible Construction Bots made by Nauviax."

  "name": "ShowBotsOnMap",
  "description": "Now you can see your robots on the map",
  "version": "0.0.1",
  "title": "Show Bots On Map",
  "author": "darkfrei",

  "name": "UnminableBots",
  "version": "1.0.0",
  "title": "Unminable Bots",
  "author": "Optera", Choumiko
  "description": "Logistics and Cargo Bots are not minable. Includes mod settings to disable every aspect separately.",
   Code adopted from Choumiko - SmallFixes

  "name": "PickerTweaks",
  "version": "2.2.7",
  "factorio_version": "1.1",
  "title": "Picker Tweaks",
  "author": "Nexela",
  "contact": "nexela@gmail.com",
  "homepage": "https://forums.factorio.com/viewtopic.php?f=93&t=14695",
  "description": "Picker Tweaks, and Fixes",
  ]]

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

local bot_types = { "construction-robot", "logistic-robot" }

for index, bot in pairs(bot_types) do
  for _, entity in pairs(data.raw[bot]) do
    local flags = get_flag(entity.flags, 'not-on-map')

    if settings.startup[modinfo.prefix .. 'show-bots-on-map'].value and flags then
      table.remove(entity.flags, flags)
      if bot == "construction-robot" then --Map Yellow square
        entity.map_color = { r = 0, g = 0, b = 0, a = 0.5 }
      end
      if bot == "logistic-robot" then --Map White square
        entity.map_color = { r = 0, g = 0, b = 0, a = 0.5 }
      end
    end

    -- while iterating also set minable properties
    if bot == "construction-robot" then
      if settings.startup[modinfo.prefix .. "unminable-construction-robots"].value then
        entity.minable = nil
      end

      if settings.startup[modinfo.prefix .. 'fireproof-construction-robots'].value then
        entity.resistances = entity.resistances or {}
        local changed = false
        for _, resistance in pairs(entity.resistances) do
          if resistance.type == 'fire' then
            resistance.percent = 100 -- default percent = 85,
            changed = true
            break
          end
        end
        if not changed then 
          table.insert(entity.resistances, { type = 'fire', percent = 100 }) 
        end
      end
    end

    if bot == "logistic-robot" then
      if settings.startup[modinfo.prefix .. "unminable-logistic-robots"].value then
        entity.minable = nil
      end
    end
  end
end

--[[ "name": "BetterRoboport",
    "version": "1.1.0",
    "factorio_version": "1.1",
    "title": "Better Roboport",
    "author": "realtux",
    "license": "https://opensource.org/licenses/MIT",
    "description": "No more lazy robots. 2x charging ports, x charge speed, 2 x energy buffer.",
    ]]
if settings.startup[modinfo.prefix .. 'BetterRoboport'].value then  
-- energy transferred to robot per tick
--data.raw.roboport.roboport.charging_energy = "2MW" --  charging_energy = "1000kW",  mod: "20MW"

-- energy properties for the roboport
data.raw.roboport.roboport.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    input_flow_limit = "20MW", --  input_flow_limit = "5MW", mod: "80MW",
    buffer_capacity = "100MJ" --  buffer_capacity = "100MJ", mod; 500MJ" 
}
-- idle usage
--data.raw.roboport.roboport.energy_usage = "50kW"   -- energy_usage = "50kW",
-- waiting distance
data.raw.roboport.roboport.charge_approach_distance = 3 -- charge_approach_distance = 5,

-- charging positions
data.raw["roboport"]["roboport"].charging_offsets = {  -- default: 4 charging spot
  { -1.5,  -0.5 },
  { -0.75, -0.25 },
  { 1.5,   -0.5 },
  { 0.75,  -0.25 },
  { 1.5,   1.5 },
  { 0.75,  0.75 },
  { -1.5,  1.5 },
  { -0.75, 0.75 }
}
end