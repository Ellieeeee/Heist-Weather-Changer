--dont fucking bother if the option is off
if ROAH.Options:GetValue("enable_skybox") then
	--if not rain and not snow then return end
	--HUGE thanks to Martini for all of this
	Hooks:Add("BeardLibCreateScriptDataMods", "RainyDay", function()

		--set this to false so if we fail (not rain or snow or night), it means the check below won't work
		local environment = false

		--weird way of doing this but it HUGELY cuts down on spam
		if rain and night then
			environment = "mods/Heist Weather Changer/scriptdata/storm_night.custom_xml"
		elseif rain then
			environment = "mods/Heist Weather Changer/scriptdata/storm.custom_xml"
		elseif snow and night then
			environment = "mods/Heist Weather Changer/scriptdata/blizzard_night.custom_xml"
		elseif snow then
			environment = "mods/Heist Weather Changer/scriptdata/blizzard.custom_xml"
		elseif night then
			environment = "mods/Heist Weather Changer/scriptdata/storm_no_rain_night.custom_xml"
		end

			--if environment is defined to something else through the globals, do shit. otherwise chill
			if environment then
				--res dogs
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_inside", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_exterior", "environment")

				--brooklyn bank
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_brb/environments/pd2_env_brb_interior_bank", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_brb/environments/pd2_env_brb_exterior_v4", "environment")

				--diamond heist
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_dah/environments/pd2_dah_outdoor/pd2_dah_outdoor", "environment")

				--henry's cock
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_des/environments/des_indoor/des_indoor", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_des/environments/des_indoor_02/des_indoor_02", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_des/environments/des_outdoor/des_outdoor", "environment")

				--hell's island
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_bph/environments/pd2_env_bph_interior", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_bph/environments/pd2_bph_env_exterior_fog", "environment")

				--beneath the FOSHO
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_berry_connection/pd2_berry_connection", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_berry_outdoor_final_top_part/pd2_berry_outdoor_final_top_part", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_berry_outdoor_night/pd2_berry_outdoor_night", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_berry_underground/pd2_berry_underground", "environment")

				--worst heist (car shop)
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_cage/pd2_cage", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_cage_docks/pd2_cage_docks", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_cage_indoor/pd2_cage_indoor", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_cage_indoor2/pd2_cage_indoor2", "environment")

				--safehouse shit
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_chl_chill_01/pd2_chl_chill_01", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_chl_chill_03/pd2_chl_chill_03", "environment")

				--slaughterhouse
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_dinner_office/pd2_dinner_office", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_dinner_outdoor/pd2_dinner_outdoor", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_dinner_outdoor_ending/pd2_dinner_outdoor_ending", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_dinner_outdoor_middle/pd2_dinner_outdoor_middle", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_dinner_room/pd2_dinner_room", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_dinner_slaughterhouse/pd2_dinner_slaughterhouse", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_afternoon/pd2_env_afternoon", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_arm_hcm_02/pd2_env_arm_hcm_02", "environment")

				--big dank
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_bigbank/pd2_env_bigbank", "environment")

				--biker 1
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_born_indoor_bar/pd2_env_born_indoor_bar", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_born_outdoor/pd2_env_born_outdoor", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_born_outdoor_darker/pd2_env_born_outdoor_darker", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_cane/pd2_env_cane", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_cane_indoor/pd2_env_cane_indoor", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_cage_tunnels_02/env_cage_tunnels_02", "environment")

				--biker day 2 (broken)
			--	BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_chew/pd2_env_chew", "environment")
			--	BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_chew_2/pd2_env_chew_2", "environment")

				--shit
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_cro_night/pd2_env_cro_night", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_docks/pd2_env_docks", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_ed1/pd2_env_ed1", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_ed2/pd2_env_ed2", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_foggy_bright/pd2_env_foggy_bright", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_fork_01/pd2_env_fork_01", "environment")

				--framing frame
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_framing_frame_stage_2/pd2_env_framing_frame_stage_2", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_framing_frame_stage_3/pd2_env_framing_frame_stage_3", "environment")

				--prison nightmare
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_help/pd2_env_help_main", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_help/pd2_env_help_smoke", "environment")

				--HOXTILICIOUS
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_hox_02/pd2_env_hox_02", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_hox1_01/pd2_env_hox1_01", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_hox1_02/pd2_env_hox1_02", "environment")

				--more shit
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_jew_street/pd2_env_jew_street", "environment")

				--birth of FOSHO
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_jry/pd2_env_jry", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_jry_interior_01/pd2_env_jry_interior_01", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_jry_plane/pd2_env_jry_plane", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_jry_plane/pd2_env_jry_clouds", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_jry_plane/pd2_env_jry_clouds2", "environment")

				--generic shit (and shit i cant be bothered to sort)
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_lxy_gala_01/pd2_env_lxy_gala_01", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_lxy_gala_02/pd2_env_lxy_gala_02", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_lxy_lowerdeck_01/pd2_env_lxy_lowerdeck_01", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_lxy_stern_01/pd2_env_lxy_stern_01", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/casino/env_casino_01", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_0200_night_moon_stars/env_0200_night_moon_stars", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_1930_sunset_heavy_clouds/env_1930_sunset_heavy_clouds", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_1945_sunset/env_1945_sunset", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_2100_moon/env_2100_moon", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_airfield/env", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_assault_forest/env_assault_forest", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_bridge2/env_bridge2", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_cafe/env_cafe", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_core_inside_01/env_core_inside_01", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_csgo_de_bank/env_csgo_de_bank", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_forest_night/env", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_gunrange/env_gunrange", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_nail/env_nail", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_nightclub/env_nightclub", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_office/env_office", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_test_dark/env_test_dark", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_trailer_bank/env_trailer_bank", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/env_watchdogs_2_3/env_watchdogs_2_3", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_are_atrium/pd2_are_atrium", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_are_basement/pd2_are_basement", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_are_coffeeshop/pd2_are_coffeeshop", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_are_corridors/pd2_are_corridors", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_are_corridors_bright/pd2_are_corridors_bright", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_are_lobby/pd2_are_lobby", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_are_stage/pd2_are_stage", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_midday/pd2_env_midday", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_morning/pd2_env_morning", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_morning_02/pd2_env_morning_02", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_motel/pd2_env_motel", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_mountain/pd2_env_mountain", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_n2/pd2_env_n2", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_pines/pd2_env_pines", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_rat_night/pd2_env_rat_night", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_rat_night_stage_3/pd2_env_rat_night_stage_3", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_rat_stage_2/pd2_env_rat_stage_2", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_short_2_1/pd2_env_short_2_1", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_sunset/pd2_env_sunset", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_villa_vivaldi/pd2_env_villa_vivaldi", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_wd2_evening/pd2_env_wd2_evening", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_ff_2/pd2_ff_2", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_flat/pd2_flat", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_flat_indoor/pd2_flat_indoor", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_friend/pd2_friend", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_hlm1/pd2_hlm1", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_hox_1/pd2_hox_1", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_lxa_river/pd2_lxa_river", "environment")

				--THE diamond
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana/pd2_indiana", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_basement/pd2_indiana_basement", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_big_room/pd2_indiana_big_room", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_blue_room/pd2_indiana_blue_room", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_corridor/pd2_indiana_corridor", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_corridor_skylight/pd2_indiana_corridor_skylight", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_diamond_room/pd2_indiana_diamond_room", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_green_room/pd2_indiana_green_room", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_lobby/pd2_indiana_lobby", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_red_room/pd2_indiana_red_room", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_renovated_room/pd2_indiana_renovated_room", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_small_lobby/pd2_indiana_small_lobby", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_indiana_yellow_room/pd2_indiana_yellow_room", "environment")

				--shadow meme
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_kosugi/pd2_kosugi", "environment")

				--boiling point
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_mad_lab/pd2_mad_lab", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_mad_outdoor/pd2_mad_outdoor", "environment")

				--undercover
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_man/pd2_man_main", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_man/pd2_man_rooms", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_man/pd2_man_corridor", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_man/pd2_man_corridor_nofog", "environment")

				--hox revenge
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_mcmansion_indoor_basement/pd2_mcmansion_indoor_basement", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_mcmansion_indoor_dark/pd2_mcmansion_indoor_dark", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_mcmansion_night/pd2_mcmansion_night", "environment")

				--lab rats (necrocloaker event)
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_nail_event_01/pd2_nail_event_01", "environment")

				--counterfeit
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_pal_basement/pd2_pal_basement", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_pal_indoor/pd2_pal_indoor", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_pal_outdoor/pd2_pal_outdoor", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/suburbia_env/suburbia_env", "environment")

				--gots!
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_peta1_outside/env_peta1_outside", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_peta2_new_try/pd2_peta2_new_try", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_peta2_new_try_outside/pd2_peta2_new_try_outside", "environment")

				--first world meme
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_red/pd2_red", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_res/pd2_res", "environment")

				--meme street
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_run/run_inside", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_run/run_outside", "environment")

				--border crossing
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_mex_environments/pd2_env_mex_sunset", "environment")
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_mex_environments/pd2_mex_outdoor_night", "environment")

				--white house
				BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_vit/environments/pd2_env_vit_exterior", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_vit/environments/pd2_env_vit_interior", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_vit/environments/pd2_env_vit_interior_westwing", "environment")

				--da sekrit!!!
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_uno/environments/uno_tunnel", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "units/pd2_dlc_uno/environments/pd2_env_uno_dark", "environment")

				--san martin
				BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_bex/ext/pd2_env_bex_ext", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_bex/int/pd2_env_bex_int", "environment")
				--BeardLib:ReplaceScriptData(environment, "custom_xml", "environments/pd2_env_bex/int_vault/pd2_env_bex_int_vault", "environment")



			end	
	end)

	Hooks:Add("BeardLibPreProcessScriptData", "RainyDayCreateEnvironment", function(PackManager, path, raw_data)
		if managers.dyn_resource then
			local skies = {
				"sky_1313_cloudy_dark",
				"sky_night_storm"
				
			}
			for _, sky in ipairs(skies) do
				if not managers.dyn_resource:has_resource(Idstring("scene"), Idstring("core/environments/skies/" .. sky .. "/" .. sky), managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
					--log("not loaded")
					managers.dyn_resource:load(Idstring("scene"), Idstring("core/environments/skies/" .. sky .. "/" .. sky), managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
				end
			end
		end
	end)
end
