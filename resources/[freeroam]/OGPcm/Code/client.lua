--[[
By Atton_Risk for OGP 2019
https://github.com/AttonRisk
]]--
-- Some are removed but can be used as ramps
rampTable = {
	--1245,
	1503,
	13593,
	--13641,
	13645,
	1632,
	1633,
	1634,
	1655,
	--2931,
	3080
}
-- Math clusterfuck
function getPositionInfrontOfElement ( element , meters )
    if not element or not isElement ( element ) then
        return false
    end
    if not meters then
       meters = 3
    end
    local posX , posY , posZ = getElementPosition ( element )
    local _ , _ , rotation = getElementRotation ( element )
    posX = posX - math.sin ( math.rad ( rotation ) ) * meters
    posY = posY + math.cos ( math.rad ( rotation ) ) * meters
    return posX , posY , posZ
end

-- The ramp itself and the timer
local oldRamp, rampTimer = 0

function wipeRamp()
	if isElement(oldRamp) then
		destroyElement(oldRamp)
	end
end

function spawnRamp(cn,rampID)
	if getPedOccupiedVehicle(localPlayer) then
		if getPedOccupiedVehicleSeat(localPlayer) == 0 then
			if rampID then
				killTimer(rampTimer)
				wipeRamp()
				if tonumber(rampID) then
					rampID = tonumber(rampID)
					if not (rampID > 8) then
						if not (1 > rampID) then
							local x,y,z = getPositionInfrontOfElement(localPlayer,14)
							local rx,ry,rz = getElementRotation(localPlayer)
							oldRamp = createObject(rampTable[rampID],x,y,z,rx,ry,rz)
							rampTimer = setTimer(wipeRamp,1000*30,0)					
						end
					end
				end
			end
		else
			outputChatBox("Use a vaild ramp or consider using a vehicle!",255,0,0)
		end
	end
end
addCommandHandler("ramp",spawnRamp)