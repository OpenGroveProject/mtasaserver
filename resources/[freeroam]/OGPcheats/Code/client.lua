--[[
By Atton_Risk for OGP 2019
https://github.com/AttonRisk
2013, 2014, 2019
]]--

--[[===============================================================================================================================]]--	
	--Gui Stuff
    local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 552, 476
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	Agui = guiCreateWindow(left, top, windowWidth, windowHeight, "Open Grove Project Cheat GUI", false)
	guiWindowSetSizable(Agui, false)
	guiSetVisible(Agui, false)
--[[===============================================================================================================================]]--	
	-- More gui stuff
	healBtn = guiCreateButton(20, 35, 121, 61, "Health & Armor ", false, Agui)
	closeBtn = guiCreateButton(160, 315, 241, 111, "Close", false, Agui)
	turboBtn = guiCreateButton(150, 35, 121, 61, "Car Boost", false, Agui)
	respawnBtn = guiCreateButton(280, 35, 121, 61, "Respawn", false, Agui)
	noDamageBtn = guiCreateButton(150, 105, 121, 61, "Damage Proof", false, Agui)
	blowCarBtn = guiCreateButton(20, 105, 121, 61, "Blow Car", false, Agui)
	cloakBtn = guiCreateButton(280, 105, 121, 61, "Cloak", false, Agui)
	healPedBtn = guiCreateButton(20, 175, 121, 61, "Heal", false, Agui)
	engineBtn = guiCreateButton(410, 35, 121, 61, "Engine On/Off", false, Agui)
    fixCarBtn = guiCreateButton(410, 105, 121, 61, "Fix Car", false, Agui)
	getInfoBtn = guiCreateButton(150, 175, 121, 61, "Get Info", false, Agui)
	cloakCarBtn = guiCreateButton(280, 175, 121, 61, "Cloak Car", false, Agui)
	stickBtn = guiCreateButton(410, 175, 121, 61, "Sticky Wheel’s", false, Agui)
	flyingCarBtn = guiCreateButton(80, 245, 121, 61, "Flying Cars", false, Agui)
	hoverCarBtn = guiCreateButton(210, 245, 121, 61, "Hovercars", false, Agui)
	superJumpBtn = guiCreateButton(340, 245, 121, 61, "Super Jump", false, Agui)

	playb = guiCreateButton(420, 315, 101, 51, "Play/Stop", false, Agui)
--  The button below is switched off since it is not needed but may be used later
--	stopb = guiCreateButton(420, 375, 101, 51, "Stop", false, Agui)
	TBDEV = guiCreateEdit(10, 335, 113, 21, " MP3 URL", false, Agui)
	guiEditSetMaxLength(TBDEV, 32767)
--[[===============================================================================================================================]]--	
-- Backend stuff
	local rads = false
	local turboOnline = false
	local flyingcars,hovercars,extrajump = false,false,false 
--[[===============================================================================================================================]]--	

function flyingCars()
	if (not flyingcars) then
		setWorldSpecialPropertyEnabled("aircars", true) 
		flyingcars = true 
		outputChatBox("Flying cars Enabled!", 0, 255, 0) 
	else
		setWorldSpecialPropertyEnabled("aircars", false) 
		flyingcars = false 
		outputChatBox("Flying cars disabled!", 255, 0, 0) 
	end
end 
addEventHandler("onClientGUIClick",flyingCarBtn,flyingCars, false) 

function hoverCars()
	if (not hovercars) then
		setWorldSpecialPropertyEnabled("hovercars", true) 
		hovercars = true 
		outputChatBox("Hovercars Enabled!", 0, 255, 0) 
	else
		setWorldSpecialPropertyEnabled("hovercars", false) 
		hovercars = false 
		outputChatBox("Hovercars disabled!", 255, 0, 0) 
	end
end 
addEventHandler("onClientGUIClick",hoverCarBtn,hoverCars, false) 

function extraJump()
	if (not extrajump) then
		setWorldSpecialPropertyEnabled("extrajump", true) 
		setGravity(0.002) 
		extrajump = true 
		outputChatBox("'Roo' Enabled!", 0, 255, 0) 
	else
		setWorldSpecialPropertyEnabled("extrajump", false) 
		setGravity(0.008) 
		extrajump = false 
		outputChatBox("'Roo' disabled!", 255, 0, 0) 
	end
end 
addEventHandler("onClientGUIClick",superJumpBtn,extraJump, false) 

function Aguif()
	if (guiGetVisible(Agui)) then
		guiSetVisible(Agui, false) 
		showCursor(false) 
	else
		guiSetVisible(Agui, true) 
		showCursor(true) 
	end
end 
bindKey ("F2","down", Aguif) 
--[[===============================================================================================================================]]--	

function cloakCar ()
	triggerServerEvent("OGP.cloakCar", localPlayer, localPlayer) 
	Aguif()
end
addEventHandler("onClientGUIClick",cloakCarBtn,cloakCar, false) 

function getInfo ()
	triggerServerEvent("OGP.getPlayerInfo", localPlayer, localPlayer) 
end
addEventHandler("onClientGUIClick",getInfoBtn,getInfo, false) 

function fixCar ()
	triggerServerEvent("OGP.fixPlayerCar", localPlayer, localPlayer) 
	Aguif() 
end
addEventHandler("onClientGUIClick",fixCarBtn,fixCar, false) 

function engineSwitch ()
	triggerServerEvent("OGP.switchEngine", localPlayer, localPlayer) 
end	
addEventHandler("onClientGUIClick",engineBtn,engineSwitch, false) 
	
function healThePlayer ()
	triggerServerEvent("OGP.healPlayer", localPlayer, localPlayer) 
	Aguif() 
end
addEventHandler("onClientGUIClick", healPedBtn, healThePlayer, false) 

function closeGUI()
		guiSetVisible(Agui, false) 
		showCursor(false) 
end
addEventHandler("onClientGUIClick", closeBtn, closeGUI, false) 

function respawnClient()
	triggerServerEvent("OGP.RespawnPlayer", localPlayer, localPlayer) 
	Aguif() 
end
addEventHandler("onClientGUIClick", respawnBtn, respawnClient, false) 

function turboSwitch ()
	if(turboOnline) then
		outputChatBox("Turbo Offline!",255,0,0) 
		turboOnline = false
	
	else
		outputChatBox("Turbo Online Adjust with /boost!",0,255,0) 
		turboOnline = true
	end
	Aguif() 
end 
addEventHandler("onClientGUIClick", turboBtn, turboSwitch, false) 

function cloakSwitch ()
	triggerServerEvent("OGP.cloak", localPlayer, localPlayer) 
	Aguif () 
end
addEventHandler("onClientGUIClick", cloakBtn, cloakSwitch, false) 

function damageProofSwitch ()
	-- This might be op
    triggerServerEvent("OGP.damageProof", localPlayer, localPlayer) 
	Aguif() 
end
addEventHandler("onClientGUIClick", noDamageBtn, damageProofSwitch, false) 

function fullKit ()
	triggerServerEvent("OGP.giveClientFullKit", localPlayer, localPlayer) 
	Aguif() 
end
addEventHandler("onClientGUIClick", healBtn, fullKit, false) 

function blowUpCarSwitch ()
    triggerServerEvent("OGP.clientExplodeCar", localPlayer, localPlayer) 
	Aguif() 
end
addEventHandler("onClientGUIClick", blowCarBtn, blowUpCarSwitch, false) 

 

function radioSwitch ()
	local link = guiGetText(TBDEV) 
		if (not rads) then
			music = playSound(link) 
			if music then
				rads = true 
				outputChatBox("Music ON",0,255,0) 
		else
				stopSound(music) 
				rads = false 
				outputChatBox("Music OFF",255,0,0) 
		end
	end		
end 
addEventHandler("onClientGUIClick", playb, radioSwitch, false) 

switch = {}
function stickySwitch (player)
local veh = getPedOccupiedVehicle(getLocalPlayer()) 
	if veh then
		if not switch[player] then
			addEventHandler("onClientRender",getRootElement(),stickyWheels) 
			outputChatBox("Sticky Wheels Engaged",0,255,0) 
			switch[player] = true 
		else
			if switch[player] then	
			removeEventHandler("onClientRender",getRootElement(),stickyWheels) 
			outputChatBox("Sticky Wheels Disengaged",255,0,0) 
			setVehicleGravity(veh,0,0,-1) 
			switch[player] = nil 
			end
		end
	else
		outputChatBox("Get in a car to use sticky wheels!",255,0,0) 
	end
end

addEventHandler("onClientGUIClick", stickBtn, stickySwitch, false) 

function killExit ()
	cancelEvent() 
end 


--[[===============================================================================================================================]]--	
--Sticky System had a lot of help with this
function getPositionUnderTheElement(element)
    local matrix = getElementMatrix (element) 
    local offX = 0 * matrix[1][1] + 0 * matrix[2][1] - 1 * matrix[3][1] + matrix[4][1] 
    local offY = 0 * matrix[1][2] + 0 * matrix[2][2] - 1 * matrix[3][2] + matrix[4][2] 
    local offZ = 0 * matrix[1][3] + 0 * matrix[2][3] - 1 * matrix[3][3] + matrix[4][3] 
    return offX,offY,offZ 
end 

function stickyWheels()
    local veh = getPedOccupiedVehicle(getLocalPlayer()) 
		if veh then
	local x,y,z = getElementPosition(veh) 
    local ux,uy,uz = getPositionUnderTheElement(veh) 
		if (veh) then
			if (x and y and z) then
				if (ux and uy and uz) then
				setVehicleGravity(veh,ux - x,uy - y,uz - z) 
				return true 
			else
				return false 
				end
			end
		end
	end
end 


--[[===============================================================================================================================]]--	
-- This is the rocket system made by Rozza 2012 / 2013 used on NBG until the server was pulled

isRocketEnabled = false 
boost = 1.01 
	
function gogoRocket()
	if (getPedOccupiedVehicle(localPlayer)) then
		if (getVehicleController(getPedOccupiedVehicle(localPlayer)) == localPlayer) then
			if (isVehicleOnGround(getPedOccupiedVehicle(localPlayer)) or isElementInWater(getPedOccupiedVehicle(localPlayer))) then
				if (getAnalogControlState("accelerate") == 1) then
					local velX, velY, velZ = getElementVelocity(getPedOccupiedVehicle(localPlayer)) 
					local a = setElementVelocity(getPedOccupiedVehicle(localPlayer), velX * boost, velY * boost, velZ) 
				end
			end
		end
	end
end 

function changeBoost(_, val)
    if not val then
		outputChatBox("Enter a boost value between 1 and 3!",255,0,0)
	else
		local val = tonumber(val)
		if val then
		if not (val > 3) then
					if(val > 0) then
						boost = 1.00 + val * 0.006
						outputChatBox("Boost: " .. boost,0,255,0)
					else
				end
			end
		end	
	end
end
addCommandHandler("boost", changeBoost)

function startRocket()
	if turboOnline then
		addEventHandler("onClientRender", root, gogoRocket) 
		isRocketEnabled = true 
	end
end 

function killRocket()
	if (isRocketEnabled) then
		removeEventHandler("onClientRender", root, gogoRocket) 
		isRocketEnabled = false 
	end
end 

function bindStuff()
	bindKey("lshift", "down", startRocket) 
	bindKey("lshift", "up", killRocket) 
end 
bindStuff() 

--[[===============================================================================================================================]]--	