local modinfo = require("modinfo")
--[[ "name": "Brighter-Lamps",
	"version": "1.1.0",
	"factorio_version": "1.1",
	"title": "Brighter Lamps",
	"author": "Krydax",
	"description": "Basic Changes",
    ]]
data.raw["lamp"]["small-lamp"].light.size = settings.startup[modinfo.prefix .. "light-size"].value -- intensity = 0.9, size = 40
--data.raw["lamp"]["small-lamp"].glow_size = 6
--data.raw["lamp"]["small-lamp"].glow_color_intensity = 1,
--data.raw["lamp"]["small-lamp"].darkness_for_all_lamps_off = 0.3,
--data.raw["lamp"]["small-lamp"].darkness_for_all_lamps_on = 0.5,

--[[ "name": "EvenMoreLight",
  "version": "0.1.1",
  "factorio_version": "1.1",
  "title": "EvenMoreLight",
  "author": "Woetoo",JamesOFarrell, closteam and antisocialian.
  "description": "Expanded MoreLight, also adds Cars, Trains and some other vehicles. Credits to JamesOFarrell, closteam and antisocialian."
]]

if settings.startup[modinfo.prefix .. 'brighter-lights-player'].value then
    for _, player in pairs(data.raw['character']) do
        player.light = { { intensity = 0.8, size = 50 } } -- {{intensity = 0.4, size = 25}}
    end
end
-- Improved light look for picker veicule code
if settings.startup[modinfo.prefix .. 'brighter-lights-vehicles'].value then
    for _, vehicle in pairs(data.raw['car']) do
        if vehicle.light then
            vehicle.light[#vehicle.light + 1] = { intensity = 0.9, size = 75, minimum_darkness = 0.1 } --  intensity = 0.8, minimum_darkness = 0.3, size = 2,
        end
    end

    for _, loco in pairs(data.raw['locomotive']) do
        -- front_light is the headlight going forward
        -- back_light is the red light at the back
        -- stand_by_light is the blue light at the front when parked.
        if loco.front_light then
            loco.front_light[#loco.front_light + 1] = { intensity = 0.9, size = 125, minimum_darkness = 0.1 }
        end
        if loco.stand_by_light then
            loco.stand_by_light[#loco.stand_by_light + 1] = { intensity = 0.9, size = 125, minimum_darkness = 0.1 }
        end
        if loco.back_light then
            loco.back_light[#loco.back_light + 1] = { intensity = 0.9, size = 125, minimum_darkness = 0.1 }
        end
    end
end

--[[ "name": "VilsClearNightvision",
  "version": "1.0.1",
  "factorio_version": "1.1",
  "title": "Vil's Clear nightvision",
  "author": "Vil",
  "description": "Originally by Gotmachine. Updated for 1.1. When using the nightvision equipment, the color tone will stay the same as at sunset instead of changing into the hard on the eye desaturated one.",
  ]]
if settings.startup[modinfo.prefix .. 'brighter-night-vision'].value then
    data.raw["night-vision-equipment"]["night-vision-equipment"].color_lookup = {{ 0.5, "__core__/graphics/color_luts/lut-sunset.png" } }
    --Activate night-vision-equipment Earlier
    data.raw["night-vision-equipment"]["night-vision-equipment"].darkness_to_turn_on = 0.3 -- darkness_to_turn_on = 0.5
end
