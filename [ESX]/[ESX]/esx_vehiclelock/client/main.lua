ESX = nil

local isRunningWorkaround = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(0)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 4 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed, true)

	local vehicle = nil

	if IsPedInAnyVehicle(playerPed,  false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 71)
	end

	ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local locked = GetVehicleDoorLockStatus(vehicle)
			if locked == 1 or locked == 0 then -- if unlocked
				SetVehicleDoorsLocked(vehicle, 2)
				PlayVehicleDoorCloseSound(vehicle, 1)
				SetVehicleLights(vehicle, 2)
                Wait(200)
                SetVehicleLights(vehicle, 0)
                Wait(200)
                SetVehicleLights(vehicle, 2)
                Wait(400)
                SetVehicleLights(vehicle, 0)	
				TriggerEvent('chat:addMessage', { args = { _U('message_title'), _U('message_locked') } })
			elseif locked == 2 then -- if locked
				SetVehicleDoorsLocked(vehicle, 1)
				PlayVehicleDoorOpenSound(vehicle, 0)
				SetVehicleLights(vehicle, 2)
                Wait(200)
                SetVehicleLights(vehicle, 0)
                Wait(200)
                SetVehicleLights(vehicle, 2)
                Wait(400)
                SetVehicleLights(vehicle, 0)
				
				TriggerEvent('chat:addMessage', { args = { _U('message_title'), _U('message_unlocked') } })
			end
		end
	end, GetVehicleNumberPlateText(vehicle))
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 303) and IsInputDisabled(0) then
			ToggleVehicleLock()
			Citizen.Wait(300)
	
		-- D-pad down on controllers works, too!
		elseif IsControlJustReleased(0, 173) and not IsInputDisabled(0) then
			ToggleVehicleLock()
			Citizen.Wait(300)
		end
	end
end)
