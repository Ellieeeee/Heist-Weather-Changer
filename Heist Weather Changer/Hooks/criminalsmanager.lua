if (Global.load_level and Global.game_settings.single_player) or not Network:is_server() then return end
--raincoats only when raining check
if not ROAH.Options:GetValue("enable_sneak") and ROAH.Options:GetValue("enable_coats_on_rain") and not rain and not snow then return end



function CriminalsManager:add_character(name, unit, peer_id, ai, ai_loadout)
	print("[CriminalsManager]:add_character", name, unit, peer_id, ai)
 	for id, data in pairs(self._characters) do
 		if data.name == name then
 			if data.taken then
 				Application:error("[CriminalsManager:set_character] Error: Trying to take a unit slot that has already been taken!")
 				Application:stack_dump()
 				Application:error("[CriminalsManager:set_character] -----")
 				self:_remove(id)
 			end
 			data.taken = true
 			data.unit = unit
 			data.peer_id = peer_id
 			data.data.ai = ai or false
			data.data.mask_id = data.static_data.ai_mask_id
			data.data.mask_blueprint = nil
			if ai_loadout then
				unit:base():set_loadout(ai_loadout)
			end
			data.data.mask_id = managers.blackmarket:get_real_mask_id(ai_loadout and ai_loadout.mask or data.static_data.ai_mask_id, nil, name)
			if Network:is_server() and ai_loadout then
				local crafted = managers.blackmarket:get_crafted_category_slot("masks", ai_loadout and ai_loadout.mask_slot)
				data.data.mask_blueprint = crafted and crafted.blueprint
			end
			data.data.mask_blueprint = data.data.mask_blueprint or ai_loadout and ai_loadout.mask_blueprint
 			data.data.mask_obj = managers.blackmarket:mask_unit_name_by_mask_id(data.data.mask_id, nil, name)
 			if not ai and unit then
 				local mask_id = managers.network:session():peer(peer_id):mask_id()
 				data.data.mask_obj = managers.blackmarket:mask_unit_name_by_mask_id(mask_id, peer_id)
 				data.data.mask_id = managers.blackmarket:get_real_mask_id(mask_id, peer_id)
 				data.data.mask_blueprint = managers.network:session():peer(peer_id):mask_blueprint()
 			end
 			managers.hud:remove_mugshot_by_character_name(name)
 			if unit then
 				data.data.mugshot_id = managers.hud:add_mugshot_by_unit(unit)
 				if unit:base().is_local_player then
 					self._local_character = name
 					managers.hud:reset_player_hpbar()
 				end
 				unit:sound():set_voice(data.static_data.voice)
 			else
 				if not ai or not managers.localization:text("menu_" .. name) then
 				end
 				data.data.mugshot_id = managers.hud:add_mugshot_without_unit(name, ai, peer_id, (managers.network:session():peer(peer_id):name()))
 			end
 		else
 		end
 	end
 	self:event_listener():call("on_criminal_added", name, unit, peer_id, ai)
 	managers.sync:send_all_synced_units_to(peer_id)
	local current_level = managers.job and managers.job:current_level_id()
	if current_level then
		if ROAH.Options:GetValue("enable_sneak") then
			local sequence = "spawn_prop_sneak_suit"
			if sequence and alive(unit) then
				local unit_damage = not unit:damage() and unit:camera() and unit:camera():camera_unit():damage()
				if unit_damage then
					unit_damage:run_sequence_simple(sequence)
				end
			end
		--snow coats override raincoats
		elseif (snow and ROAH.Options:GetValue("enable_coats")) or current_level == "brb" then
			local sequence = "spawn_prop_winter_suit"
			if sequence and alive(unit) then
				local unit_damage = not unit:damage() and unit:camera() and unit:camera():camera_unit():damage()
				if unit_damage then
					unit_damage:run_sequence_simple(sequence)
				end
			end
		elseif ROAH.Options:GetValue("enable_coats") then
			local sequence = "spawn_prop_raincoat"
			if sequence and alive(unit) then
				local unit_damage = not unit:damage() and unit:camera() and unit:camera():camera_unit():damage()
				if unit_damage then
					unit_damage:run_sequence_simple(sequence)
				end
			end
		else
			local sequence = tweak_data.levels[current_level] and tweak_data.levels[current_level].player_sequence
			if sequence and alive(unit) then
				local unit_damage = not unit:damage() and unit:camera() and unit:camera():camera_unit():damage()
				if unit_damage then
					unit_damage:run_sequence_simple(sequence)
				end
			end
		end
	end
end