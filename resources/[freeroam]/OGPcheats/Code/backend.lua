hold =[[
------------------------------------------------------------------------------------------------
--Name: aCore ----------------------------------------------------------------------------------
--Dev: Atton Risk   ----------------------------------------------------------------------------
--Year: 2013/2014/2019 -------------------------------------------------------------------------
--Usage: aCore for OGP only  -------------------------------------------------------------------
--Version: v1.5 --------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
]]


function clientRespawn ()
	if client then
		local x,y,z = getElementPosition(client) 
			if x and y and z then
				if spawnPlayer(client, x, y, z) then
					outputChatBox("You have been respawned!", client, 0, 255,0) 
				else
			end
		end
	end
end 
addEvent("OGP.RespawnPlayer", true) 
addEventHandler("OGP.RespawnPlayer", getRootElement(), clientRespawn) 

function outputClientInfo ()
	local GIRED,GIGREEN,GIBLUE = 112,219,244 
	local clientIp, clientName, clientSerial = getPlayerIP(client), getPlayerName(client), getPlayerSerial(client)
	outputChatBox(tostring(clientIp),client,GIRED,GIGREEN,GIBLUE)
	outputChatBox(tostring(clientName),client,GIRED,GIGREEN,GIBLUE) 
	outputChatBox(tostring(clientSerial),client,GIRED,GIGREEN,GIBLUE) 
end 
addEvent("OGP.getPlayerInfo", true) 
addEventHandler("OGP.getPlayerInfo", getRootElement(), outputClientInfo) 

function fixClientCar ()
	local clientclientVeh = getPedOccupiedVehicle (client) 
	if (clientclientVeh) then
		fixVehicle(clientclientVeh) 
	else
		outputChatBox("Might be a good idea to get into a car!",client,255,0,0) 
	end
end 
addEvent("OGP.fixPlayerCar", true) 
addEventHandler("OGP.fixPlayerCar", getRootElement(), fixClientCar) 

function toggleClientEngine()
	local clientVeh = getPedOccupiedVehicle(client) 
	if (not clientVeh) then
		return false 
	end
	if getPedOccupiedVehicleSeat(client) == 0 then	
		if (getVehicleEngineState(clientVeh)) then
			setVehicleEngineState(clientVeh, false) 
			outputChatBox("Engine OFF!", client, 255, 0, 0) 
			local engineStatus = false 
		else
			if not getVehicleEngineState(clientVeh) then
				setVehicleEngineState(clientVeh, true) 
				outputChatBox("Engine ON!",client, 0, 255, 0) 
				local engineStatus = true 
			end
		end
	end
end 
addEvent("OGP.switchEngine", true) 
addEventHandler("OGP.switchEngine", getRootElement(), toggleClientEngine) 

function healClient ()
	setElementHealth ( client, 100 ) 
	setPedArmor ( client, 100 ) 
end
addEvent("OGP.healPlayer", true) 
addEventHandler("OGP.healPlayer", getRootElement(), healClient) 

function clientExplode ()
	local x,y,z = getElementPosition(client) 
	createExplosion(x,y,z,10) 
end
addEvent("OGP.clientExplodePlayer", true) 
addEventHandler("OGP.clientExplodePlayer", getRootElement(), clientExplode) 

function cloakClient()
    if getElementAlpha(client) == 255 then
	       setPlayerNametagShowing(client,false) 
		   setElementAlpha(client,0) 
		   outputChatBox("You are cloaked!",client,0,255,0) 
		   setPlayerNametagShowing(client,false) 
    else
	     setPlayerNametagShowing(client,true) 
	     setElementAlpha ( client, 255 ) 
		 outputChatBox("You are uncloaked!",client,255,0,0) 
		 setPlayerNametagShowing(client,true) 
	end
end 
addEvent("OGP.cloak", true) 
addEventHandler("OGP.cloak", getRootElement(), cloakClient) 

function cloakClientCar()
	local clientCar = getPedOccupiedVehicle(client)
	if (isPedInVehicle(client)) then 
		if (not clientCar) then
	    return 
    end 
	if getPedOccupiedVehicleSeat(client) == 0 then
			if getElementAlpha(clientCar) == 255 then
				setElementAlpha(clientCar,0) 
				outputChatBox("Your car is cloaked!",client,0,255,0) 
			else
				setElementAlpha (clientCar, 255) 
				outputChatBox("Your car is uncloaked!",client,255,0,0) 
			end
		end
	end
end 
addEvent("OGP.cloakCar", true) 
addEventHandler("OGP.cloakCar", getRootElement(), cloakClientCar) 


function dmgProofClientCar ()
	local clientCar = getPedOccupiedVehicle(client) 
	if (isPedInVehicle(client)) then 
		if getPedOccupiedVehicleSeat(client) == 0 then
			if (not clientCar) then
				return 
			end 
			if isVehicleDamageProof(clientCar) == false then
				setVehicleDamageProof(clientCar,true) 
				outputChatBox("Damage Proof On!",client,0,255,0) 
			else
				setVehicleDamageProof(clientCar,false) 
				outputChatBox("Damage Proof Off!",client,255,0,0)
			end
		end
	end
end 
addEvent("OGP.damageProof", true) 
addEventHandler("OGP.damageProof", getRootElement(), dmgProofClientCar) 

function blowClientCar ()
	local clientCar = getPedOccupiedVehicle (client) 
	if (clientCar) then
		if getPedOccupiedVehicleSeat(client) == 0 then
			blowVehicle(clientCar) 
			outputChatBox("Boom Bitch!",client,255,0,0) 
		else
			outputChatBox("You are not in a car or in the wrong seat!",client,255,0,0) 
		end
	end
end
addEvent("OGP.clientExplodeCar", true) 
addEventHandler("OGP.clientExplodeCar", getRootElement(), blowClientCar) 


function setClientGodMode ()
    if getElementData(client,"invincible") then
        setElementData(client,"invincible",false) 
        outputChatBox("Godmode inactive!",client,255,0,0) 
    else
        setElementData(client,"invincible",true) 
        outputChatBox("Godmode active!",client,0,255,0) 
    end 
end
addEvent("OGP.godmode", true) 
addEventHandler("OGP.godmode", getRootElement(), setClientGodMode) 

function killClient ()
	if client then
		if killPed(client) then
			outputChatBox("You are dead not big surprise!",client,0,255,0) 
		end
	end
end 
addEvent("OGP.killPlayer", true) 
addEventHandler("OGP.killPlayer", getRootElement(), killClient) 

-- Knife, Brassknuckle, Dildo, Parachute
local ids = {
	{id=4},
	{id=1},
	{id=10},
	{id=46},
}

function giveClientFullKit ()
	setPedArmor ( client, 100 ) 
	for index,id in pairs(ids) do
		giveWeapon(client, id["id"]) 
	end
end 
addEvent("OGP.giveClientFullKit", true) 
addEventHandler("OGP.giveClientFullKit", getRootElement(), giveClientFullKit) 


