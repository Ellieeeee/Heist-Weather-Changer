-- RAIN



if rain then
	local ids_rain_post_processor = Idstring("rain_post_processor")
	local ids_rain_ripples = Idstring("rain_ripples")
	local ids_rain_off = Idstring("rain_off")
	local ripple_fix = false
	local map = Global.level_data.level_id
	--lazy terrible fix for these levels having droplets indoors
	--causes droplets to pop in but what the fuck else can i do?
	if map == "fish" or map == "arena" or map == "mus" or map == "red2" or map == "pbr" or map == "big" or map == "hox_2" then
		ids_rain_off = Idstring("rain_inside")
		ripple_fix = true
	end
	local inside = false
	local outside = false
	local _raineffectloopdelay = 0
	local inside_delay = 1
	function RainEffect:update(t, dt)
		local vp = managers.viewport:first_active_viewport()
		if vp and self._vp ~= vp then
			vp:vp():set_post_processor_effect("World", ids_rain_post_processor, ids_rain_ripples)
			if alive(self._vp) then
				self._vp:vp():set_post_processor_effect("World", ids_rain_post_processor, ids_rain_off)
			end
			self._vp = vp
		end
		local c_rot = managers.environment_effects:camera_rotation()
		if not c_rot then
			return
		end
		local c_pos = managers.environment_effects:camera_position()
		if not c_pos then
			return
		end
		local normal = math.UP
		local mvec_to = Vector3()
		mvector3.set(mvec_to, -normal)
		mvector3.multiply( mvec_to, 20000000000 )
		mvector3.add(mvec_to, c_pos)
		local col_rayy = World:raycast("ray", c_pos + Vector3(0, 0, 5000000), mvec_to, "slot_mask", managers.slot:get_mask("bullet_impact_targets" ))
		if col_rayy and mvector3.distance_sq(col_rayy.hit_position, c_pos) < 22000 then
		--player is outside in the rain
			--probably the dumbest way possible to do it but idc, if outside set our inside timer to current time + 1
				inside_delay = t + 1
			--probably overthought this but this makes sure it only plays the sound once, when the player goes in/outside
			if outside == false then
				if Utils:IsInHeist() and Utils:IsInCustody() == false and game_state_machine then
					managers.player:player_unit():sound():play("ambience_ext_heavy_rain_storm_asphalt", nil, false)
					if ripple_fix then
						vp:vp():set_post_processor_effect("World", ids_rain_post_processor, ids_rain_ripples)
					end
					outside = true
					inside = false
				end
			end
		else
		--player is inside, not in the rain
		--check our delay of 1 second to make sure it doesn't trigger from running over terrain, which restarts the sound
		--again, only start playing the sound once
		if not (inside_delay > t) then 
				if inside == false then
					inside_delay = t + 1
					if Utils:IsInHeist() and Utils:IsInCustody() == false and game_state_machine then
						managers.player:player_unit():sound():play("ambience_ext_heavy_rain_storm_tarp", nil, false)
						if ripple_fix then
							vp:vp():set_post_processor_effect("World", ids_rain_post_processor, ids_rain_off)
						end
						outside = false
						inside = true
					end
				end
		end
			return
		end
		World:effect_manager():move_rotate(self._effect, c_pos, c_rot)
	end
end



-- SNOW



if snow then
	local ids_snow_post_processor = Idstring("snow_post_processor")
	local ids_snow_ripples = Idstring("snow_ripples")
	local ids_snow_off = Idstring("snow_off")
	local inside = false
	local outside = false
	local _snoweffectloopdelay = 0
	local inside_delay = 1
	function SnowEffect:update(t, dt)
		local vp = managers.viewport:first_active_viewport()
		if vp and self._vp ~= vp then
			vp:vp():set_post_processor_effect("World", ids_snow_post_processor, ids_snow_ripples)
			if alive(self._vp) then
				self._vp:vp():set_post_processor_effect("World", ids_snow_post_processor, ids_snow_off)
			end
			self._vp = vp
		end
		local c_rot = managers.environment_effects:camera_rotation()
		if not c_rot then
			return
		end
		local c_pos = managers.environment_effects:camera_position()
		if not c_pos then
			return
		end
		local normal = math.UP
		local mvec_to = Vector3()
		mvector3.set(mvec_to, -normal)
		mvector3.multiply( mvec_to, 20000000000 )
		mvector3.add(mvec_to, c_pos)
		local col_rayy = World:raycast("ray", c_pos + Vector3(0, 0, 5000000), mvec_to, "slot_mask", managers.slot:get_mask("bullet_impact_targets" ))
		if col_rayy and mvector3.distance_sq(col_rayy.hit_position, c_pos) < 22000 then
		--player is outside in the snow
			--probably the dumbest way possible to do it but idc, if outside set our inside timer to current time + 1
				inside_delay = t + 1
			--probably overthought this but this makes sure it only plays the sound once, when the player goes in/outside
			if outside == false then
				if Utils:IsInHeist() and Utils:IsInCustody() == false and game_state_machine then
					managers.player:player_unit():sound():play("ambience_ext_cold_winds", nil, false)
					outside = true
					inside = false
				end
			end
		else
		--player is inside, not in the snow
		--check our delay of 1 second to make sure it doesn't trigger from running over terrain, which restarts the sound
		--again, only start playing the sound once
		if not (inside_delay > t) then 
				if inside == false then
					inside_delay = t + 1
					if Utils:IsInHeist() and Utils:IsInCustody() == false and game_state_machine then
						managers.player:player_unit():sound():play("ambience_int_office_small", nil, false)
						vp:vp():set_post_processor_effect("World", ids_snow_post_processor, ids_snow_off)
						outside = false
						inside = true
					end
				end
		end
			return
		end
		World:effect_manager():move_rotate(self._effect, c_pos, c_rot)
	end
end
