local function log_mod_list(playerId)
  local flagAppend = false
  --local playerId = event.player_index --print only for server or event.player_index multiplayer

  for name, version in pairs(game.active_mods) do
    local web = string.gsub(name, "%s", "%%20")
    local output = name .. "    " .. version .. "\n    https://mods.factorio.com/mod/" .. web .. "\n"
    game.write_file("Server_Mod_list.txt", output, flagAppend, playerId)
    flagAppend = true
  end
end

local function log_map_setting(playerId)
  game.write_file("map-settings.json", game.table_to_json(game.parse_map_exchange_string(game.get_map_exchange_string())),false, playerId)
  local sufixx = "local all_map_setting = "
  local tablee = serpent.block(game.parse_map_exchange_string(game.get_map_exchange_string()))
  game.write_file("map-settings.lua", sufixx .. tablee, false, playerId)
  game.write_file("map-extchange-string.txt", game.get_map_exchange_string(), false, playerId)
  game.write_file("nauvis-map-gen-settings.json", game.table_to_json(game.surfaces['nauvis'].map_gen_settings), false, playerId)
  local sufix = "local all_map_gen_settings = "
  local table = serpent.block(game.surfaces['nauvis'].map_gen_settings)
  game.write_file("nauvis-map-gen-settings-lua-table.lua", sufix .. table, false, playerId)
end

--log(serpent.block())
commands.add_command(
  'log',
  'Create log file in script-output. /log map or mod ',
  function(command)
    local playerId = command.player_index
    if not playerId then return end
    local parameter = command.parameter
    if parameter == "map" then
      log_map_setting(playerId)
      game.players[playerId].print("Files generated in script-output folder")
    elseif parameter == "mod" then
      log_mod_list(playerId)
      game.players[playerId].print("Files generated in script-output folder")
    else
      game.players[playerId].print("Invalid parameter!! Use map or mod")
    end
  end
)

--script.on_event(defines.events.on_player_created, log_map_setting)
--script.on_event(defines.events.on_player_created, log_mod_list)
