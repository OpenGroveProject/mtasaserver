hold =[[
------------------------------------------------------------------------------------------------
--Name: aCore ----------------------------------------------------------------------------------
--Dev: Atton Risk   ----------------------------------------------------------------------------
--Status: Development Finished and Public ------------------------------------------------------
--Year: 2013/2014/2019 -------------------------------------------------------------------------
--Usage: aCore for OGP only  -------------------------------------------------------------------
--Version: v1.4 --------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
]]

f,d,a = 112,219,244 

function getInfoData (plr)
	if plr then
		local ip = getPlayerIP(plr) 
		local na = getPlayerName(plr) 
		local se = getPlayerSerial(plr) 
		if ip and na and se then
			return ip, na, se 
		else
			return false 
		end
	end
end 

function respawn (plr)
	if plr then
		local x,y,z = getElementPosition(plr) 
			if x and y and z then
				if spawnPlayer(plr, x, y, z) then
					outputChatBox("You have been respawned!", plr, 0, 255,0) 
				else
			end
		end
	end
end 
addEvent("aCore.RespawnPlayer", true) 
addEventHandler("aCore.RespawnPlayer", getRootElement(), respawn) 

function GETINFO (plr)
	local ip = getPlayerIP(plr) 
	local na = getPlayerName(plr) 
	local se = getPlayerSerial(plr) 
	outputChatBox(tostring(na),plr,f,d,a) 
	outputChatBox(tostring(se),plr,f,d,a) 
	outputChatBox(tostring(ip),plr,f,d,a) 
end 
addEvent("aCore.getPlayerInfo", true) 
addEventHandler("aCore.getPlayerInfo", getRootElement(), GETINFO) 

function FIXCARf (plr)
local plrveh = getPedOccupiedVehicle (plr) 
	if (plrveh) then
		fixVehicle(plrveh) 
	else
		outputChatBox("Might be a good idea to get into a car!",plr,255,0,0) 
	end
end 
addEvent("aCore.fixPlayerCar", true) 
addEventHandler("aCore.fixPlayerCar", getRootElement(), FIXCARf) 

function toggleEngine(plr)
	local veh = getPedOccupiedVehicle(plr) 
	if (not veh) then
		return false 
	end
	if (getVehicleEngineState(veh)) then
		setVehicleEngineState(veh, false) 
		outputChatBox("Engine OFF!", plr, 255, 0, 0) 
		local engineStatus = false 
	else
		setVehicleEngineState(veh, true) 
		outputChatBox("Engine ON!",plr, 0, 255, 0) 
		local engineStatus = true 
	end
end 
addEvent("aCore.ssEngine", true) 
addEventHandler("aCore.ssEngine", getRootElement(), toggleEngine) 

function FullHealf ()
	setElementHealth ( source, 100 ) 
	setPedArmor ( source, 100 ) 
end
addEvent("aCore.healPlayer", true) 
addEventHandler("aCore.healPlayer", getRootElement(), FullHealf) 

function blowup ()
	local x,y,z = getElementPosition(source) 
	createExplosion(x,y,z,10) 
end
addEvent("aCore.blowUpPlayer", true) 
addEventHandler("aCore.blowUpPlayer", getRootElement(), blowup) 

function Cloakf(plr)
    if getElementAlpha(plr) == 255 then
	       setPlayerNametagShowing(plr,false) 
		   setElementAlpha(plr,0) 
		   outputChatBox("You are cloaked!",plr,0,255,0) 
		   setPlayerNametagShowing(plr,false) 
    else
	     setPlayerNametagShowing(plr,true) 
	     setElementAlpha ( plr, 255 ) 
		 outputChatBox("You are uncloaked!",plr,255,0,0) 
		 setPlayerNametagShowing(plr,true) 
	end
end 
addEvent("aCore.cloak", true) 
addEventHandler("aCore.cloak", getRootElement(), Cloakf) 

function Cloakcf(plr)
local DM = getPedOccupiedVehicle(plr)
	if (isPedInVehicle(plr)) then 
		if (not DM) then
	    return 
    end 
		if getElementAlpha(DM) == 255 then
		   setElementAlpha(DM,0) 
			outputChatBox("Your car is cloaked!",plr,0,255,0) 
    else
			setElementAlpha ( DM, 255 ) 
			outputChatBox("Your car is uncloaked!",plr,255,0,0) 
		end
	end
end 
addEvent("aCore.cloakCar", true) 
addEventHandler("aCore.cloakCar", getRootElement(), Cloakcf) 


function DMGf (plr)
local DM = getPedOccupiedVehicle(plr) 
	if (isPedInVehicle(plr)) then 
		if (not DM) then
		return 
		end 
		if isVehicleDamageProof(DM) == false then
			setVehicleDamageProof(DM,true) 
			outputChatBox("Damage Proof On!",plr,0,255,0) 
		else
			setVehicleDamageProof(DM,false) 
			outputChatBox("Damage Proof Off!",plr,255,0,0) 
		end
	end
end 
addEvent("aCore.damageProof", true) 
addEventHandler("aCore.damageProof", getRootElement(), DMGf) 

function BLOWf (plr)
local BM = getPedOccupiedVehicle (plr) 
	if (BM) then
		if getPedOccupiedVehicleSeat(plr) == 0 then
			blowVehicle(BM) 
			outputChatBox("Boom Bitch!",plr,255,0,0) 
		else
			outputChatBox("You are not in a car or in the wrong seat!",plr,255,0,0) 
		end
	end
end
addEvent("aCore.blowUpCar", true) 
addEventHandler("aCore.blowUpCar", getRootElement(), BLOWf) 


function Gmf (thePlayer)
    if getElementData(thePlayer,"invincible") then
        setElementData(thePlayer,"invincible",false) 
        outputChatBox("Godmode inactive!",thePlayer,255,0,0) 
    else
        setElementData(thePlayer,"invincible",true) 
        outputChatBox("Godmode active!",thePlayer,0,255,0) 
    end 
end
addEvent("aCore.godmode", true) 
addEventHandler("aCore.godmode", getRootElement(), Gmf) 

function killaPlayer (plr)
	if plr then
		if killPed(plr) then
			outputChatBox("You are dead not big surprise!", plr ,0 ,255,0) 
		else
			-- Place Holder
		end
	end
end 
addEvent("aCore.killPlayer", true) 
addEventHandler("aCore.killPlayer", getRootElement(), killaPlayer) 

local ids = {
	{id=32},
	{id=31},
	{id=34},
	{id=38},
	{id=41},
}

function fullKit (plr)
	for a,b in pairs(ids) do
		setPedArmor ( plr, 100 ) 
		giveWeapon(plr, b["id"]) 
	end
end 
addEvent("aCore.fullKit", true) 
addEventHandler("aCore.fullKit", getRootElement(), fullKit) 


