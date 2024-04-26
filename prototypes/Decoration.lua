local modinfo = require("modinfo")
-- Extra setting included in Noxys_QuickerStumpFade

--[[  "name": "UnPollock",
  "version": "1.1.0",
  "title": "UnPollock",
  "author": "Loren1350",
  "contact": "Schmendrick on the Factorio Forums",
  "homepage": "",
  "description": "Allows customization of decorative density, for a less cluttered map without barren monotony.",
--]]
if settings.startup[modinfo.prefix .. "enable-unpollock"].value then
    local rate = settings.startup[modinfo.prefix .. "decorative-rate"].value
    local frocks = settings.startup[modinfo.prefix .. "no-fake-rocks"].value
    local tne = require("noise").to_noise_expression
    local a

    if frocks or rate < 1 then
        for _, d in pairs(data.raw["optimized-decorative"]) do
            a = d.autoplace
            if a then
                if rate == 0 then
                    d.autoplace = nil
                end

                if a.peaks then
                    if frocks then
                        for _, p in pairs(a.peaks) do
                            if p.noise_layer == "rocks" then
                                d.autoplace = nil
                                break
                            end
                        end
                    end
                    if rate < 1 then
                        a.max_probability = (a.max_probability or 1) * rate
                    end
                else
                    a.probability_expression = a.probability_expression * tne(rate)
                end
            end
        end
    end
end
--[[ "name": "Clean_Tree_Burning",
 "version": "1.0.5",
 "title": "Clean Tree Burning",
 "author": "Gegell",
 "description": "Burnt trees won't be left when burning forests ",
--]]
if settings.startup[modinfo.prefix .. 'clean-tree-burning'].value then
    data.raw.fire["fire-flame-on-tree"].tree_dying_factor = 1 -- tree_dying_factor = 0.8,
end

--[[     "name": "CleanedConcreteCompatibility",
    "version": "1.0.0",
    "title": "Cleaned Concrete (Mod Compatible)",
    "author": "RockPaperKatana","JusticeDroid",
    "description":"Removes all ground decoration when placing tiles. Works with modded tiles too.",
    "factorio_version": "1.1"
    ]]
if settings.startup[modinfo.prefix .. 'roundup-pavement'].value then
    for k, _ in pairs(data.raw['tile']) do
        if data.raw.tile[k].decorative_removal_probability ~= nil then
            data.raw.tile[k].decorative_removal_probability = 1
        end
    end
end

--[[ "name": "PickerTweaks",
  "version": "2.2.7",
  "factorio_version": "1.1",
  "title": "Picker Tweaks",
  "author": "Nexela",
  "contact": "nexela@gmail.com",
  "homepage": "https://forums.factorio.com/viewtopic.php?f=93&t=14695",
  "description": "Picker Tweaks, and Fixes",
  ]]
if settings.startup[modinfo.prefix .. 'roundup-resources'].value then
    for _, tree in pairs(data.raw.resource) do
        tree.tree_removal_probability = 1        -- tree_removal_probability = 0.7 to 0.8
        tree.tree_removal_max_distance = 1000000 -- tree_removal_max_distance = 1024,
    end
end

--[[ "name": "nonukescorch",
  "version": "0.9.0",
  "title": "No Nuke Scorch",
  "author": "DofD","warbaque"
  "factorio_version": "1.1",
  "description": "This mod removes the nuke scorches on the map and world"
  ]]

local remove_nuclear_ground_effect = function(projectile)
    local is_nuclear_ground_effect = function(effect)
        local to_remove = {
            {key="type", value="set-tile"},
            {key="type", value="create-decorative"},
        }
        for _, f in ipairs(to_remove) do
            if (effect[f.key] == f.value) then
                return true
            end
        end
        return false
    end

    local effects = {}
    for _, effect in ipairs(projectile.action.action_delivery.target_effects) do
        if not is_nuclear_ground_effect(effect) then
            table.insert(effects, effect)
        end
    end
    projectile.action.action_delivery.target_effects = effects
end

if settings.startup[modinfo.prefix .. 'no-nuke-scorch'].value then
    remove_nuclear_ground_effect(data.raw["projectile"]["atomic-rocket"])

    if mods["AtomicArtillery"] then
      require("__AtomicArtillery__.prototypes.entity.projectiles")
      remove_nuclear_ground_effect(data.raw["artillery-projectile"]["atomic-artillery-projectile"])
    end
end