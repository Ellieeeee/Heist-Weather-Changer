local old_init = LevelsTweakData.init
function LevelsTweakData:init(tweak_data)
     old_init(self, tweak_data)
     
     --snow
     if Global.load_level == true and snow and not PackageManager:loaded("packages/lvl_wwh") then
         PackageManager:load( "packages/lvl_wwh" )
     end

    --rain package
    if Global.load_level == true and rain and not PackageManager:loaded("packages/narr_glace") then
    PackageManager:load( "packages/narr_glace" )
    end
    
    --screendrop package
    if (Global.load_level == true and rain and ROAH.Options:GetValue("enable_screendrops")) and not PackageManager:loaded("levels/narratives/classics/glace/world/world") then
    PackageManager:load( "levels/narratives/classics/glace/world/world")
    end

if Global.load_level == true then
    for _, entry_name in ipairs(self._level_index) do
            if self[entry_name] then
                if rain then
                    self[entry_name].environment_effects = {
                        "rain",
                        "raindrop_screen",
                        "lightning"
                    }
                elseif snow then
                        self[entry_name].environment_effects = {"snow"}
                end              
                if ROAH.Options:GetValue("enable_coats") then
                    if (Global.game_settings.single_player or not Network:is_server()) and not (ROAH.Options:GetValue("enable_coats_on_rain") and not rain) then
                        self[entry_name].player_sequence = "spawn_prop_raincoat"
                    end
                end
            end
        end
    end

end