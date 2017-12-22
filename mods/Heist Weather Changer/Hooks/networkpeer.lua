if Network:is_server() then return end

if not ROAH.Options:GetValue("enable_sneak") and not coats then return end


function NetworkPeer:_update_equipped_armor()
	if not alive(self._unit) then
		return
	end
	local new_armor_id = self:armor_id(true) or self:armor_id()
	print("[NetworkPeer:update_equipped_armor]", "equipped_armor", self._equipped_armor_id, "new_armor", new_armor_id)
	if self._equipped_armor_id ~= new_armor_id then
		self._equipped_armor_id = new_armor_id
        local armor_sequence = tweak_data.blackmarket.armors[new_armor_id].sequence
        local map = Global.load_level and Global.level_data.level_id
		if ROAH.Options:GetValue("enable_coats") or ROAH.Options:GetValue("enable_sneak") or map == "glace" or map == "dah" or map == "wwh" then
			armor_sequence = nil
		end
		if armor_sequence and self._unit:damage() and self._unit:damage():has_sequence(armor_sequence) then
			self._unit:damage():run_sequence_simple(armor_sequence)
		end
		local con_mul, index = managers.blackmarket:get_concealment_of_peer(self)
		self._unit:base():set_suspicion_multiplier("equipment", 1 / con_mul)
		self._unit:base():set_detection_multiplier("equipment", 1 / con_mul)
		self._unit:base():setup_hud_offset(self)
	end
end
--[[
function NetworkPeer:set_unit(unit, character_name, team_id)
    local is_new_unit = unit and (not self._unit or self._unit:key() ~= unit:key())
    self._unit = unit
    managers.player:need_send_player_status()
    if is_new_unit and self._id == managers.network:session():local_peer():id() then
        managers.player:spawned_player(1, unit)
    end
    if is_new_unit then
        unit:inventory():set_melee_weapon_by_peer(self)
    end
    if unit then
        if managers.criminals:character_peer_id_by_name(character_name) == self:id() then
            managers.criminals:set_unit(character_name, unit)
        else
            if managers.criminals:is_taken(character_name) then
                managers.criminals:remove_character_by_name(character_name)
            end
            managers.criminals:add_character(character_name, unit, self:id(), false)
        end
    end
    if is_new_unit then
        unit:movement():set_team(managers.groupai:state():team_data(tweak_data.levels:get_default_team_ID("player")))
        self._equipped_armor_id = nil
        self:_update_equipped_armor()
        if unit:damage() then
           
            local current_level = managers.job and managers.job:current_level_id()
            local sequence = managers.blackmarket:character_sequence_by_character_id(self:character_id(), self:id())
 
            if ROAH.Options:GetValue("enable_coats") then
                sequence = "spawn_prop_raincoat"
                unit:damage():run_sequence_simple(sequence)
            else
                sequence = managers.blackmarket:character_sequence_by_character_id(self:character_id(), self:id())
                unit:damage():run_sequence_simple(sequence)
            end
        end
        unit:movement():set_character_anim_variables()
    end
end
]]