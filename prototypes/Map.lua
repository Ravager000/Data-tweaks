local modinfo = require("modinfo")
--[[ "name": "MapPollutionVisibility",
    "factorio_version": "1.1",
    "title": "Map Pollution Visibility",
    "author": "DanielZlotin",
    "contact": "https://github.com/DanielZlotin/FactorioMapPollutionVisibility",
    "homepage": "https://github.com/DanielZlotin/FactorioMapPollutionVisibility",
    "description": "# Map Pollution Visibility\nBetter map pollution visibility, changing the color to translucent white\n",
    "source": "https://github.com/DanielZlotin/FactorioMapPollutionVisibility",
]]
if settings.startup[modinfo.prefix .. "white-polution"].value then
    data.raw["utility-constants"]["default"].chart.pollution_color = { r = 140, g = 140, b = 140, a = 149 } -- { a = 149,b = 0, g = 0, r = 140},
end

--[[ "name": "Configurable-map-lines",
	"version": "1.0.0",
	"title": "Configurable map overlay strength",
	"author": "SpeckledFleebeedoo",
	"factorio_version": "1.1",
	"description": "Adds a setting for the intensity of the map view overlay."
]]
data.raw['utility-constants']["default"].zoom_to_world_effect_strength = settings.startup[modinfo.prefix .. "overlay-strength"].value                                                                                        -- zoom_to_world_effect_strength = 1

--[[ "name":"artillery-visibility",
	"author":"JadeE1024",
	"version":"0.0.1",
	"title":"Artillery Visibility",
	"description":"Makes artillery more visible on the map by turning the range indicator from red to green.",
	"factorio_version": "1.1",
    ]]
local range_colors = {
    default = { r = 0.8, g = 0.25, b = 0.25, a = 1 },
    red = { r = 1, g = 0, b = 0, a = 1 },
    orange = { r = 1, g = 0.5, b = 0, a = 1 },
    yellow = { r = 1, g = 1, b = 0, a = 1 },
    green = { r = 0, g = 1, b = 0, a = 1 },
    blue = { r = 0, g = 0, b = 1, a = 1 },
}

data.raw["utility-constants"]["default"].chart.artillery_range_color = range_colors[settings.startup[modinfo.prefix .. "artillery-visibility-color"].value]

data.raw["utility-constants"]["default"]["zoom_to_world_can_use_nightvision"] = settings.startup[modinfo.prefix .. "zoom-use-nightvision"].value


