if not ModCore then
	log("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end

RainOnAllHeistsCore = RainOnAllHeistsCore or class(ModCore)

function RainOnAllHeistsCore:init()
	--Calling the base function for init from ModCore
	--self_tbl, config path, auto load modules, auto post init modules
	self.super.init(self, ModPath .. "config.xml", true, true)
end

if not _G.RainOnAllHeists then
	local success, err = pcall(function() RainOnAllHeistsCore:new() end)
	if not success then
		log("[ERROR] An error occured on the initialization of Heist Weather Changer. " .. tostring(err))
	end
end


--global variables for rng
--we want seperate rolls for each, otherwise it will result in always both on/off scenarios
--another variable for coats which is not controlled by rng
local NightRNGesus = math.random(0,100)
local RainRNGesus = math.random(0,100)
local SnowRNGesus = math.random(0,100)
night = false
rain = false
snow = false
coats = false

--rng roll and check for options. set global to true if rngesus loves you
if ROAH.Options:GetValue("enable_skybox") then
	if NightRNGesus <= (ROAH.Options:GetValue("chance_night") or 0) then
		night = true
	end
end

if ROAH.Options:GetValue("enable_rain") then
	if RainRNGesus <= (ROAH.Options:GetValue("chance_rain") or 0) then
		rain = true
	end
end

if ROAH.Options:GetValue("enable_snow") then
	if RainRNGesus <= (ROAH.Options:GetValue("chance_snow") or 0) then
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

--disable all weather effects always if level is green bridge, alaska, brooklyn bank, shacklethorne, no mercy, or the new safehouse (memory issues)
local map = Global.load_level and Global.level_data.level_id
if map == "glace" or map == "wwh" or map == "chill" or map == "chill_combat" or map == "brb" or map == "sah" or map == "nmh" then
	rain = false
	snow = false
end

if ROAH.Options:GetValue("enable_coats") then
	--if no weather effect and coats only in weather option, turn coats off. otherwise turn them on. however we'll turn coats on for brooklyn bank
	if not rain and not snow and map ~= "brb" and ROAH.Options:GetValue("enable_coats_on_rain") then
		coats = false
	else
		coats = true
	end
end