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

if Global.load_level == true then
    --add weather effects to levels
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
            end
        end
    end

end