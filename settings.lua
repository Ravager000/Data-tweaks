
local modinfo = require("modinfo")
-- Map  Configurablemaplines   MapPollutionVisibility   artillery-visibility
data:extend({
   {
      type = "double-setting",
      name = modinfo.prefix .. "overlay-strength",
      default_value = 1, -- zoom_to_world_effect_strength = 1
      minimum_value = 0,
      maximum_value = 1,
      setting_type = "startup",
      order = 'map-a'
   }, {
   type = "string-setting",
   name = modinfo.prefix .. "artillery-visibility-color",
   setting_type = "startup",
   default_value = "default", -- {r = 0.8, g = 0.25, b = 0.25, a = 1},
   order = 'map-b',
   allowed_values = {
      "default",
      "orange",
      "yellow"
   }
}, {
   type = "bool-setting",
   name = modinfo.prefix .. "white-polution",
   setting_type = "startup",
   default_value = false, -- { a = 149,b = 0, g = 0, r = 140},
   order = 'map-c'
}, {
   type = "bool-setting",
   name = modinfo.prefix .. "zoom-use-nightvision",
   setting_type = "startup",
   default_value = false, -- false
   order = 'map-d'
}
})
-- Wire  ThickerLines   AlmostInvisibleElectricWires
data:extend({
   {
      type = "string-setting",
      name = modinfo.prefix .. "wire-color",
      setting_type = "startup",
      default_value = "Default",
      allowed_values = { "Invisible", "Visible 30%", "Visible 50%", "Visible 80%", "Default", "Thicker" },
      order = 'wire-a'
   }, {
   type = "string-setting",
   name = modinfo.prefix .. "wire-color-green",
   setting_type = "startup",
   default_value = "Default",
   allowed_values = { "Thicker", "Visible 50%", "Invisible", "Default" },
   order = 'wire-b'
}, {
   type = "string-setting",
   name = modinfo.prefix .. "wire-color-red",
   setting_type = "startup",
   default_value = "Default",
   allowed_values = { "Thicker", "Visible 50%", "Invisible", "Default" },
   order = 'wire-c'
}
})
--Collision  Tree colision   pumping_from_landfill
data:extend({
   {
      type = 'bool-setting',
      name = modinfo.prefix .. 'smaller-tree-box',
      setting_type = 'startup',
      default_value = false, -- {{-0.05, -0.05}, {0.05, 0.05}}
      order = 'colli-c'
   }, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'pumping-from-landfill',
   setting_type = 'startup',
   default_value = false,
   order = 'colli-d'
}
})
--  PlayerCharacter
data:extend({
   {
      type = 'int-setting',
      name = modinfo.prefix .. 'pc-inventory-size',
      setting_type = 'startup',
      default_value = 80,
      minimum_value = 1,
      maximum_value = 600,
      order = 'pc-a'
      --default factorio 80
   }, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-build-distance',
   setting_type = 'startup',
   default_value = 10,
   maximum_value = 10000,
   minimum_value = 1,
   order = 'pc-b'
   --default factorio 10
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-reach-distance',
   setting_type = 'startup',
   default_value = 10,
   maximum_value = 10000,
   minimum_value = 1,
   order = 'pc-a'
   --default factorio 10
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-reach-resource-distance',
   setting_type = 'startup',
   default_value = 2.7,
   maximum_value = 10000,
   minimum_value = 1,
   order = 'pc-c'
   --default factorio 2.7
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-drop-item-distance',
   setting_type = 'startup',
   default_value = 10,
   maximum_value = 10000,
   minimum_value = 1,
   order = 'pc-d'
   --default factorio 10
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-item-pickup-distance',
   setting_type = 'startup',
   default_value = 1,
   maximum_value = 100,
   minimum_value = 1,
   order = 'pc-e'
   --default factorio 1
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-loot-pickup-distance',
   setting_type = 'startup',
   default_value = 2,
   maximum_value = 100,
   minimum_value = 1,
   order = 'pc-f'
   --default factorio 2
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-enter-vehicle-distance',
   setting_type = 'startup',
   default_value = 3,
   maximum_value = 10,
   minimum_value = 1,
   order = 'pc-g'
   --default factorio 3
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-healing-per-tick',
   setting_type = 'startup',
   default_value = 0.15,
   maximum_value = 100,
   minimum_value = 0.1,
   order = 'pc-h'
   --default factorio 0.15 per tick
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-ticks-to-stay-in-combat',
   setting_type = 'startup',
   default_value = 600,
   maximum_value = 10000,
   minimum_value = 0.1,
   order = 'pc-i'
   --default factorio 600 ticks
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-max-health',
   setting_type = 'startup',
   default_value = 250,
   maximum_value = 10000,
   minimum_value = 1,
   order = 'pc-j'
   --default factorio 250
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-mining-speed',
   setting_type = 'startup',
   default_value = 0.5,
   maximum_value = 100,
   minimum_value = 0.1,
   order = 'pc-k'
   --default factorio 0.5
}, {
   type = 'double-setting',
   name = modinfo.prefix .. 'pc-running-speed',
   setting_type = 'startup',
   default_value = 0.15,
   maximum_value = 100,
   minimum_value = 0.1,
   order = 'pc-l'
   --default factorio 0.15
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'pc-has-belt-immunity',
   setting_type = 'startup',
   default_value = false,
   order = 'pc-m'
   --default factorio false
}
})
--  Bot   fireproof-worker-bots   ShowBotsOnMap   UnminableBots   PickerTweaks
data:extend({
   {
      type = 'bool-setting',
      name = modinfo.prefix .. 'unminable-construction-robots',
      setting_type = 'startup',
      default_value = false,
      order = 'bot-a'
   }, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'unminable-logistic-robots',
   setting_type = 'startup',
   default_value = false,
   order = 'bot-b'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'fireproof-construction-robots',
   setting_type = 'startup',
   default_value = false, -- fire percent = 85,
   order = 'bot-c'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'show-bots-on-map',
   setting_type = 'startup',
   default_value = false,
   order = 'bot-d'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'BetterRoboport',
   setting_type = 'startup',
   default_value = false,
   order = 'bot-e'
}

})
-- Belt   belt-legacy
data:extend({
   {
      type = "bool-setting",
      name = modinfo.prefix .. "fast-replaceable-protection",
      setting_type = "startup",
      default_value = false, -- fast_replaceable_group = "transport-belt",
      order = "belt-a"
   }, {
   type = "bool-setting",
   name = modinfo.prefix .. "car-belt-immunity",
   setting_type = "startup",
   default_value = false,    --
   order = "pc-n"
}
})
-- Decoration   UnPollock   Clean_Tree_Burning   CleanedConcreteCompatibility   PickerTweaks   nonukescorch
data:extend({
   {
      type = "bool-setting",
      name = modinfo.prefix .. "enable-unpollock",
      setting_type = "startup",
      default_value = false,
      order = 'deco'
   }, {
   type = "double-setting",
   name = modinfo.prefix .. "decorative-rate",
   setting_type = "startup",
   default_value = .4,
   minimum_value = 0,
   maximum_value = 1,
   order = 'deco-a'
}, {
   type = "bool-setting",
   name = modinfo.prefix .. "no-fake-rocks",
   setting_type = "startup",
   default_value = false,
   order = 'deco-b'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'roundup-pavement',
   setting_type = 'startup',
   default_value = false, -- decorative_removal_probability = 0.15 to 0.25
   order = 'deco-c'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'roundup-resources',
   setting_type = 'startup',
   default_value = false, ---- tree_removal_probability = 0.7 to 0.8 - tree_removal_max_distance = 1024,
   order = 'deco-d'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'clean-tree-burning',
   setting_type = 'startup',
   default_value = false, -- tree_dying_factor = 0.8,
   order = 'deco-e'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'no-nuke-scorch',
   setting_type = 'startup',
   default_value = false,
   order = 'deco-f'
}

})
-- Light   VilsClearNightvision   EvenMoreLight   Brighter-Lamps
data:extend({
   {
      type = "int-setting",
      name = modinfo.prefix .. "light-size",
      setting_type = "startup",
      default_value = 40, -- intensity = 0.9, size = 40
      minimum_value = 1,
      maximum_value = 100,
      order = 'light-a'
   }, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'brighter-lights-player',
   setting_type = 'startup',
   default_value = false, -- {{intensity = 0.4, size = 25}}
   order = 'lights-b'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'brighter-lights-vehicles',
   setting_type = 'startup',
   default_value = false,
   order = 'lights-c'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'brighter-night-vision',
   setting_type = 'startup',
   default_value = false, -- darkness_to_turn_on = 0.5
   order = 'lights-d'
}
})
-- Weapon rz-LandmineGridlock   NoArtilleryMapReveal
data:extend({
   {
      type = 'bool-setting',
      name = modinfo.prefix .. 'no-artillery-reveal',
      setting_type = 'startup',
      default_value = false, -- reveal_map = true
      order = 'weapon-a'
   }, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'landmine-gridlock',
   setting_type = 'startup',
   default_value = false,
   order = 'weapon-c'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'low-radar-reveal',
   setting_type = 'startup',
   default_value = false, -- max_distance_of_sector_revealed = 14,
   order = 'weapon-b'
}
})
-- Repair  no-wall-repair no_wall_alerts  fireproof-rail-signals   fireproof-land-mine
data:extend({
   {
      type = 'bool-setting',
      name = modinfo.prefix .. 'no-wall-repair',
      setting_type = 'startup',
      default_value = false,
      order = 'repair-a'
   }, {
   setting_type = "startup",
   type = "bool-setting",
   name = modinfo.prefix .. 'no-wall-alert',
   default_value = false,
   order = "repair-aa"
}, {
   setting_type = "startup",
   type = "bool-setting",
   name = modinfo.prefix .. 'no-wall-alert-landmines',
   default_value = false,
   order = "repair-aaa"
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'fireproof-rail-signals',
   setting_type = 'startup',
   default_value = false, -- resistances = nil
   order = 'repair-b'
}, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'fireproof-land-mine',
   setting_type = 'startup',
   default_value = false, -- resistances = nil
   order = 'repair-c'
},
})
-- Visual    More UPS,FPS   TintedGhosts
data:extend({
   {
      type = "color-setting",
      name = modinfo.prefix .. "damage-flash-color",
      setting_type = "startup",
      default_value = { a = 0, b = 0, g = 0, r = 1 }, -- damage_hit_tint = {a = 0,b = 0,g = 0,r = 1}
      order = 'visual-a'
   }, {
   type = 'bool-setting',
   name = modinfo.prefix .. 'remove-biters-blood',
   setting_type = 'startup',
   default_value = false,
   order = 'visual-b'
}, {
   type = "color-setting",
   name = modinfo.prefix .. "ghost-tint",
   setting_type = "startup",
   default_value = { r = 0.6, g = 0.6, b = 0.6, a = 0.3 }, -- {r = 0.6, g = 0.6, b = 0.6, a = 0.3},
   order = 'visual-c'
}, {
   type = "color-setting",
   name = modinfo.prefix .. "tile-ghost-tint",
   setting_type = "startup",
   default_value = { r = 0.8, g = 0.8, b = 0.8, a = 0.4 }, -- {r = 0.8, g = 0.8, b = 0.8, a = 0.4},
   order = 'visual-d'
},

})

-- Sprite   BorderedAlertIcons_NtmFork   Humble_Alt_Mode_Shadow
data:extend({
   {
      type = "string-setting",
      name = modinfo.prefix .. "alt-shadow-color",
      setting_type = "startup",
      default_value = "vanilla", -- item_outline_color = { 0, 0, 0, 1 }   filter_outline_color = { 0, 0, 0, 1 }
      allowed_values = { "minimal", "less-noticeable", "noticeable", "vanilla" },
      order = 'sprite-a'
   }, {
   type = "string-setting",
   name = modinfo.prefix .. "alt-shadow-opacity",
   setting_type = "startup",
   default_value = "vanilla",    -- item_outline_color = { 0, 0, 0, 1 }   filter_outline_color = { 0, 0, 0, 1 }
   allowed_values = { "minimal", "less-noticeable", "noticeable", "vanilla" },
   order = 'sprite-b'
}, {
   type = "string-setting",
   name = modinfo.prefix .. "alt-shadow-radius",
   setting_type = "startup",
   default_value = "vanilla",    --item_outline_radius = 16
   allowed_values = { "minimal", "less-noticeable", "noticeable", "vanilla" },
   order = 'sprite-c'
}, {
   type = "double-setting",
   name = modinfo.prefix .. "icon-scale",
   -- localised_name="Icon Scale",
   -- localised_description = "Defines the Icons Scale\nDefault = 0.6 (0 = hidden, 1 = 100%)\nMin = 0\nMax = 10",
   setting_type = "startup",
   order = 'sprite-d',
   minimum_value = 0,
   maximum_value = 10,
   default_value = 0.6
}, {
   type = "double-setting",
   name = modinfo.prefix .. "icon-shift-x",
   --  localised_name="Icon Offset X",
   --  localised_description = "Defines the Icons Offset in X (horizontal)\n(-) negative values to left, (+) positive values to right\nDefault = -0.55 (0 = center)\nMin = -5\nMax = 5",
   setting_type = "startup",
   order = 'sprite-e',
   minimum_value = -5,
   maximum_value = 5,
   default_value = -0.55
}, {
   type = "double-setting",
   name = modinfo.prefix .. "icon-shift-y",
   --  localised_name="Icon Offset Y",
   --  localised_description = "Defines the Icons Offset in Y (vertical)\n(-) negative values to up, (+) positive values to down\nDefault = 0.55 (0 = center)\nMin = -5\nMax = 5",
   setting_type = "startup",
   order = 'sprite-f',
   minimum_value = -5,
   maximum_value = 5,
   default_value = 0.55
}
})
-- Control Script    NoFreeplayCutscene     No_Lab_Names
data:extend({
   {
      type = 'bool-setting',
      name = modinfo.prefix .. 'no-backer-name',
      setting_type = 'runtime-global',
      default_value = false,
      order = 'zzz-a'
   }, {
   type = "bool-setting",
   name = modinfo.prefix .. "disable-crashsite",
   setting_type = "runtime-global",
   default_value = false,
   order = "zzz-c"
}, {
   type = "bool-setting",
   name = modinfo.prefix .. "skip-cutscene",
   setting_type = "runtime-global",
   default_value = false,
   order = "zzz-d"
}, {
   type = "bool-setting",
   name = modinfo.prefix .. "enable-crafting-queue",
   setting_type = "runtime-global",
   default_value = false,
   order = "zzz-e"
}, {
   type = "bool-setting",
   name = modinfo.prefix .. "alt-mode-default",
   setting_type = "runtime-global",
   default_value = false,
   order = "zzz-f"
},

})
