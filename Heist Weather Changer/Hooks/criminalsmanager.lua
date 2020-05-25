if ROAH.Options:GetValue("change_outfit") and (rain or snow) then
    function CriminalsManager:update_character_visual_state(character_name, visual_state)
        local character = self:character_by_name(character_name)
    
        if not character or not character.taken or not alive(character.unit) then
            return
        end
    
        visual_state = visual_state or {}															   
        local unit = character.unit
        local is_local_peer = visual_state.is_local_peer or character.visual_state.is_local_peer or false
        local visual_seed = visual_state.visual_seed or character.visual_state.visual_seed or CriminalsManager.get_new_visual_seed()
        local mask_id = visual_state.mask_id or character.visual_state.mask_id
        local armor_id = visual_state.armor_id or character.visual_state.armor_id or "level_1"
        local armor_skin = visual_state.armor_skin or character.visual_state.armor_skin or "none"
        local player_style = self:active_player_style() or "none"
        local suit_variation = nil
        local user_player_style = visual_state.player_style or character.visual_state.player_style or "none"
        --force outfit to the proper type if conditions are met (clientside)
        local map = Global.load_level and Global.level_data.level_id	
        if rain or map == "glace" then
            user_player_style = "raincoat"
        elseif snow or map == "wwh" or map == "brb" then
            user_player_style = "winter_suit"
        end

        
    
        if not self:is_active_player_style_locked() and user_player_style ~= "none" then
            player_style = user_player_style
            suit_variation = visual_state.suit_variation or character.visual_state.suit_variation or "default"
        end

        
            
    
        local character_visual_state = {
            is_local_peer = is_local_peer,
            visual_seed = visual_seed,
            player_style = player_style,
            suit_variation = suit_variation,
            mask_id = mask_id,
            armor_id = armor_id,
            armor_skin = armor_skin
        }
    
        CriminalsManager.set_character_visual_state(unit, character_name, character_visual_state)
    
        character.visual_state = {
            is_local_peer = is_local_peer,
            visual_seed = visual_seed,
            player_style = user_player_style,
            suit_variation = suit_variation,
            mask_id = mask_id,
            armor_id = armor_id,
            armor_skin = armor_skin
        }
    end
end