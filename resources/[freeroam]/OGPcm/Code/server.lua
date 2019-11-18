--[[
By Atton_Risk for OGP 2019
https://github.com/AttonRisk
]]--

activeCar = 0

function wipeCars()
	if isElement(activeCar) then
		destroyElement(activeCar) -- Remove the old car unless there isn't an old one
	end
end

function returnCarID(value)
-- Checks if the data is actually legit then handles it accordingly
	if tonumber(value) then
		return tonumber(value)
	else
		local val = getVehicleModelFromName(value)
		if val then
			return val
		else
			return 0
		end
	end
end

function spawnCarToPlr(player,cn,id)
	-- Get all the details
	local px,py,pz = getElementPosition(player)
	local rx,ry,rz = getElementRotation(player)
	local vx,vy,vz = getElementVelocity(player)
	if id then
		-- if in car and driver
		if getPedOccupiedVehicleSeat(player) == 0 then -- Allows only the driver to do this
			destroyElement(getPedOccupiedVehicle(player))
			activeCar = createVehicle(returnCarID(id),px,py,pz,rx,ry,rz)
				if activeCar then
					warpPedIntoVehicle(player,activeCar);
					setElementVelocity(activeCar,vx,vy,vz)
				end
				else
					-- if not in car
					if not getPedOccupiedVehicle(player) then
						wipeCars()
						activeCar = createVehicle(returnCarID(id),px,py,pz,rx,ry,rz)
					if activeCar then
						warpPedIntoVehicle(player,activeCar);
						setElementVelocity(activeCar,vx,vy,vz)
					else
						outputChatBox("SV Usage /sv [vehicleName/ID]",player,255,0,0)
					end
				end
			end
		end
	end
addCommandHandler("sv",spawnCarToPlr)

-- admin lock can be added at some point if needed
function openGar(player,cn,id)
if id then
	if tonumber(id) then
			if isGarageOpen(id) then
				setGarageOpen(id, false)
			else
				setGarageOpen(id, true)
			end
		end
	end
end
addCommandHandler("gar",openGar)


