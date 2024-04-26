local modinfo = require("modinfo")

require("scripts.nobackename")
require("scripts.log")

--   set-player_color    playern-name-tag
--https://mods.factorio.com/mod/playertags

--[[
local Event = require('__stdlib__/stdlib/event/event')
local color = require('__stdlib__/stdlib/utils/defines/color')

local function set_player_color(event)
    local player = game.players[event.player_index]
    local set = player.mod_settings
    local chat = set["picker-chat-color"].value
    local char = set["picker-character-color"].value
    if chat ~= "default" then
        player.chat_color = color[chat]
    end
    if char ~= "default" then
        player.color = color[char]
    end
end
Event.register(defines.events.on_player_created, set_player_color)
-------------------------------------------------------------------
local color = require('__stdlib__/stdlib/utils/defines/color')

local allowed_values = {'default'}
for name in pairs(color) do
    allowed_values[#allowed_values + 1] = name
end

data:extend{
    {
        type = 'string-setting',
        name = 'picker-chat-color',
        setting_type = 'runtime-per-user',
        default_value = 'default',
        allowed_values = allowed_values,
        order = 'player-options-chat-color'
    },
    {
        type = 'string-setting',
        name = 'picker-character-color',
        setting_type = 'runtime-per-user',
        default_value = 'default',
        allowed_values = allowed_values,
        order = 'player-options-character-color'
    }
}
]]

script.on_event(defines.events.on_player_created, function(event)--on_player_joined_game
    local player = game.players[event.player_index]
    
    if settings.global[modinfo.prefix .. 'alt-mode-default'].value then
        player.game_view_settings.show_entity_info = true
    end

    if settings.global[modinfo.prefix .. 'enable-crafting-queue'].value then
        player.force.research_queue_enabled = true
    end
end)

local function on_init()
    if not remote.interfaces.freeplay then
      return
    end
  
    local disable_crashsite = settings.global[modinfo.prefix .. "disable-crashsite"].value
    local skip_cutscene = settings.global[modinfo.prefix .. "skip-cutscene"].value

    if skip_cutscene then
	    remote.call("freeplay", "set_skip_intro", true)
    end

    if disable_crashsite then
      skip_cutscene = true
    end
  
    if (disable_crashsite or skip_cutscene) then
      remote.call("freeplay", "set_disable_crashsite", true)
    end
end
      script.on_init(on_init)
