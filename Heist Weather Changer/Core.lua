if not ModCore then
	log("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end

RainOnAllHeistsCore = RainOnAllHeistsCore or class(ModCore)

function RainOnAllHeistsCore:init()
	--Calling the base function for init from ModCore
	--self_tbl, config path, auto load modules, auto post init modules
	self.super.init(self, ModPath .. "config.xml", true, true)

	--table for night heists
	--either this or a huge fucking if check which looks gross
	--thanks sc
	RainOnAllHeistsCore.night_maps = {
		"kosugi", --shadow raid
		"dark", --murky station
		"fish", --yacht heist
		"gallery", --art gallery
		"framing_frame_1", --framing frame
		"framing_frame_2",  
		"framing_frame_3",
		"nightclub", --nightclub
		"hox_3", --hox revenge
		"election_day_2", --election day 2
		"firestarter_1", --bet you cant guess
		"firestarter_2",
		"firestarter_2_res",
		"alex_2", --rats 2/3
		"alex_3",
		"alex_2_res",
		"alex_3_res",
		"watchdogs_1_night", --watchdoge
		"watchdogs_2",
		"welcome_to_the_jungle_1_night", --big oil
		"escape_overpass_night", --escape overpass
		"kenaz", --ggc
		"bph", --hell's island
		"dah" --diamond heist
	}

	--table for heists we just want to disable everything on for one reason or another
	RainOnAllHeistsCore.fuck_this_shit = {
		"glace", --green bridge (duh)
		"wwh", --alaskan deal (duh)
		"sah", --shacklethorne (duh)
		"brb", --brooklyn bank (duh)
		"tag", --breakin' feds (indoor only)
		"nmh",  --no mercy (indoor only)
		"hox_2", --hox brekaout 2 (indoor only)
		"arena", --alesso (indoor only)
		"chill", --new safehouse because holy FUCK oom crashes
		"chill_combat", --ditto, but the raid
		"nail", --lab rats
		"haunted", --safehouse nightmare
		"red2" --first world bank (indoor only, the 5 seconds outside doesnt count)
	}
end


if not _G.RainOnAllHeists then
	local success, err = pcall(function() RainOnAllHeistsCore:new() end)
	if not success then
		log("[ERROR] An error occured on the initialization of Heist Weather Changer. " .. tostring(err))
	end
end


--global variables for rng
--we want seperate rolls for each, otherwise it will result in always both on/off scenarios
--load the current level, this will be used later
local NightRNGesus = math.random(0,100)
local RainRNGesus = math.random(0,100)
local SnowRNGesus = math.random(0,100)
local map = Global.load_level and Global.level_data.level_id
local map_is_night = false
night = false
rain = false
snow = false

--check if map is night
for _,nt in pairs(RainOnAllHeistsCore.night_maps) do
	if map == nt then
		map_is_night = true
	end
end

--rng roll and check for options. set global to true if rngesus loves you
if ROAH.Options:GetValue("enable_skybox") then
	if NightRNGesus <= (ROAH.Options:GetValue("chance_night") or 0) then
		night = true
	--if the night chance is ANYTHING that isn't 0, and the heist is normally night, force night
	elseif ROAH.Options:GetValue("chance_night") > 0 and map_is_night then
		night = true
	end
end

if ROAH.Options:GetValue("enable_rain") then
	if RainRNGesus <= (ROAH.Options:GetValue("chance_rain") or 0) then
		rain = true
	end
end

if ROAH.Options:GetValue("enable_snow") then
	if SnowRNGesus <= (ROAH.Options:GetValue("chance_snow") or 0) or map == "mad" then
		snow = true
	end
end

--check to make sure both are not on
if rain and snow then
	--if the chance for rain was higher...
	if RainRNGesus > SnowRNGesus then
		rain = true
		snow = false
	--if the chance for snow was higher or they are equal (unlikely) then just default to snow
	else
		rain = false
		snow = true
	end
end

--disable all weather effects always if level is in the table above
--this is to prevent near guaranteed crashes or pointless memory usage/weird effects (if the heist is only indoors, there's obviously no weather)
for _,bs in pairs(RainOnAllHeistsCore.fuck_this_shit) do
	if map == bs then
		rain = false
		snow = false
	end
end