 if Global.load_level == true then
    --green bridge fix for drop effect
    local job = Global.level_data and Global.level_data.level_id
    local _raineffectloopdelay = 0
    Hooks:PostHook(PlayerManager, "update", "screen_drops", function(self, t, dt)
        if Utils:IsInHeist() and Utils:IsInCustody() == false and game_state_machine and job == "glace" then
            if _raineffectloopdelay > t then
                return
            end
            _raineffectloopdelay = t + 2
            World:effect_manager():spawn(
                {
                    effect = Idstring("effects/particles/rain/screendrops"),
                    position = Vector3(),
                    rotation = Rotation()
                }
            )
        end
    end)
end