    --[[
     "name": "smaller-mod-list",
     "version": "0.0.1",
     "title": "Smaller Mod List",
     "author": "_CodeGreen",
     "description": "For when you have so many mods in your mod menu and you want to see more of them at once.",
     "factorio_version": "1.1",
     --]]
     local styles = data.raw["gui-style"].default
     styles.mods_table.top_cell_padding = 0
     styles.mods_table.bottom_cell_padding = 0
     data:extend{{
         type = "font",
         name = "mod_label_font",
         from = "default",
         size = 11
     }}
     
     local labels = {
         "invalid_mod_label",
         "invalid_hovered_mod_label",
         "invalid_selected_mod_label",
         "valid_mod_label",
         "valid_hovered_mod_label",
         "valid_selected_mod_label"
     }
     for _, label in pairs(labels) do
         local style = styles[label]
         style.font = "mod_label_font"
     end