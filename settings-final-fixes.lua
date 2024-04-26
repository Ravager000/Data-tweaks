
--- Sets the default value for a setting
--- @param setting_type '"bool-setting"'|'"int-setting"'|'"double-setting"'|'"string-setting"'' The type of the setting
--- @param setting_name string
--- @param value boolean | string | integer | double
local function set_default_value(setting_type, setting_name, value)
    if data.raw[setting_type] then
        local setting = data.raw[setting_type][setting_name]
        if (setting) then
            setting.default_value = value
        end
    end
end

--- Forces a setting to a specific value
--- @param setting_type '"bool-setting"'|'"int-setting"'|'"double-setting"'|'"string-setting"'' The type of the setting
--- @param setting_name string
--- @param value boolean | string | integer | double
local function force_value(setting_type, setting_name, value)
    if data.raw[setting_type] then
        local setting = data.raw[setting_type][setting_name]
        if setting then
            if setting_type == 'bool-setting' then
                setting.forced_value = value
            else
                setting.default_value = value
                setting.allowed_values = {value}
            end
            setting.hidden = true
        end
    end
end

--  VolumeControl
if mods["VolumeControl"] then
    set_default_value("string-setting", "VolumeControl-settings","{__core__/sound/nightvision-on.ogg, 0}, {__core__/sound/nightvision-off.ogg, 0}, {__base__/sound/nightvision-on.ogg, 0}, {__base__/sound/nightvision-off.ogg, 0}")
end

-- Noxys_QuickerFade
if mods["Noxys_QuickerStumpFade"] then
    set_default_value("int-setting", "Noxys_Fading-tree-stump-fading-time", 54000)
    set_default_value("int-setting", "Noxys_Fading-biter-fading-time", 54000)
    set_default_value("int-setting", "Noxys_Fading-building-fading-time", 162000)
    set_default_value("int-setting", "Noxys_Fading-rail-fading-time", 54000)
    set_default_value("int-setting", "Noxys_Fading-character-fading-time", 54000)
    set_default_value("int-setting", "Noxys_Fading-character-footprint-fading-time", 600)
end

-- SmallRobots
if mods["SmallRobots"] then
    set_default_value("int-setting", "SmallRobots-robot-size", 100)
end
