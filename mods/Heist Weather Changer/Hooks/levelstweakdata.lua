local old_init = LevelsTweakData.init
function LevelsTweakData:init(tweak_data)
     old_init(self, tweak_data)
     
     --snow
     if Global.load_level == true and snow and not PackageManager:loaded("packages/lvl_wwh") then
         PackageManager:load( "packages/lvl_wwh" )
     end

     --sneak suits
     if Global.load_level == true and ROAH.Options:GetValue("enable_sneak") and not PackageManager:loaded("packages/lvl_dah") then
         PackageManager:load( "packages/lvl_dah" )
     end

    --rain package
    if Global.load_level == true and rain and not PackageManager:loaded("packages/narr_glace") then
    PackageManager:load( "packages/narr_glace" )
    end

if Global.load_level == true then
    for _, entry_name in ipairs(self._level_index) do
            if self[entry_name] then
                if rain then
                    self[entry_name].environment_effects = {
                        "rain",
                        "lightning"
                    }
                elseif snow then
                        self[entry_name].environment_effects = {"snow"}
                end           
                if ROAH.Options:GetValue("enable_sneak") then
                    if (Global.game_settings.single_player or not Network:is_server()) then
                        self[entry_name].player_sequence = "spawn_prop_sneak_suit"
                    end           
                elseif coats then
                    --snow coats override raincoats
                    if snow then
                        if (Global.game_settings.single_player or not Network:is_server()) then
                            self[entry_name].player_sequence = "spawn_prop_winter_suit"
                        end
                    elseif (Global.game_settings.single_player or not Network:is_server()) then
                        --just to make sure this is loaded. its possible to have this happen without loading the package otherwise
                        if not PackageManager:loaded("packages/narr_glace") then
                            PackageManager:load( "packages/narr_glace" )
                        end
                        self[entry_name].player_sequence = "spawn_prop_raincoat"
                    end
                end
            end
        end
    end

end