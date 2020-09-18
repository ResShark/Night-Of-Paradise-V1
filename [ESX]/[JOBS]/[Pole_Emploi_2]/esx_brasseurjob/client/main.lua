-----------------------------------------
-- Created and modify by L'ile Légale RP
-- SenSi and Kaminosekai
-----------------------------------------


local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local isInZone                  = false
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local JobBlips                	= {}
local publicBlip = false
ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function TeleportFadeEffect(entity, coords)

	Citizen.CreateThread(function()

		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end

		ESX.Game.Teleport(entity, coords, function()
			DoScreenFadeIn(800)
		end)

	end)
end

function OpenCloakroomMenu()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title    = _U('cloakroom'),
			align    = 'left',
			css 	 = 'vestiaire',
			elements = {
				{label = _U('vine_clothes_civil'), value = 'citizen_wear'},
				{label = _U('vine_clothes_vine'), value = 'vigne_wear'},
			},
		},
		function(data, menu)

			menu.close()

			if data.current.value == 'citizen_wear' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if data.current.value == 'vigne_wear' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
					else
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
					end
				end)
			end

			CurrentAction     = 'vigne_actions_menu'
			CurrentActionMsg  = _U('open_menu')
			CurrentActionData = {}
		end,
		function(data, menu)
			menu.close()
		end
	)

end

function OpenVigneActionsMenu()

	local elements = {
        {label = _U('cloakroom'), value = 'cloakroom'}
		--{label = _U('deposit_stock'), value = 'put_stock'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vigne_actions',
		{
			title    = 'Brasseur',
			align    = 'left',
			css 	 = 'vignerons',
			elements = elements
		},
		
		function(data, menu)
			if data.current.value == 'cloakroom' then
				OpenCloakroomMenu()
			end

			--if data.current.value == 'put_stock' then
				--OpenPutStocksMenu()
			--end

			--if data.current.value == 'get_stock' then
				--OpenGetStocksMenu()
			--end

			--if data.current.value == 'boss_actions' then
				--TriggerEvent('esx_society:openBossMenu', 'vigne', function(data, menu)
					--menu.close()
				--end, {wash = false})
			--end

		end,
		function(data, menu)

			menu.close()

			CurrentAction     = 'vigne_actions_menu'
			CurrentActionMsg  = _U('press_to_open')
			CurrentActionData = {}

		end
	)
end

function OpenVehicleSpawnerMenu()

	ESX.UI.Menu.CloseAll()

	if Config.EnableSocietyOwnedVehicles then

		local elements = {}

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

			for i=1, #vehicles, 1 do
				table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
			end

			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'vehicle_spawner',
				{
					title    = _U('veh_menu'),
					align    = 'left',
					css 	 = 'vignerons',
					elements = elements,
				},
				function(data, menu)

					menu.close()

					local vehicleProps = data.current.value

					ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
						ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
						local playerPed = GetPlayerPed(-1)
						TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
					end)

					TriggerServerEvent('esx_society:removeVehicleFromGarage', 'vigne', vehicleProps)

				end,
				function(data, menu)

					menu.close()

					CurrentAction     = 'vehicle_spawner_menu'
					CurrentActionMsg  = _U('spawn_veh')
					CurrentActionData = {}

				end
			)

		end, 'vigne')

	else
	
		local elements = {
			{label = 'Véhicule de Travail',  value = 'burrito3'},
		}
		
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('veh_menu'),
				align    = 'left',
				css 	 = 'vignerons',
				elements = elements,
			},
			function(data, menu)

				menu.close()

				local model = data.current.value
		
				ESX.Game.SpawnVehicle(model, Config.Zones.VehicleSpawnPoint.Pos, 56.326, function(vehicle)
					local playerPed = GetPlayerPed(-1)
					TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
				end)
			end,
			function(data, menu)

				menu.close()

				CurrentAction     = 'vehicle_spawner_menu'
				CurrentActionMsg  = _U('spawn_veh')
				CurrentActionData = {}

			end
		)
	end
end



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	blips()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	PlayerData.job2 = job2
	deleteBlips()
	blips()
end)

AddEventHandler('esx_brasseurjob:hasEnteredMarker', function(zone)
	if zone == 'HoublonFarm' and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer'  then
		CurrentAction     = 'raisin_harvest'
		CurrentActionMsg  = _U('press_collect')
		CurrentActionData = {zone= zone}
	end
		
	if zone == 'TraitementHoublon' and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer'  then
		CurrentAction     = 'vine_traitement'
		CurrentActionMsg  = _U('press_collect')
		CurrentActionData = {zone= zone}
	end		
		
	if zone == 'MiseBouteille' and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer'  then
		CurrentAction     = 'jus_traitement'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone = zone}
	end
		
	if zone == 'SellFarm' and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer'  then
		CurrentAction     = 'farm_resell'
		CurrentActionMsg  = _U('press_sell')
		CurrentActionData = {zone = zone}
	end

	if zone == 'BrasseurActions' and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then
		CurrentAction     = 'vigne_actions_menu'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}
	end
  
	if zone == 'VehicleSpawner' and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then
		CurrentAction     = 'vehicle_spawner_menu'
		CurrentActionMsg  = _U('spawn_veh')
		CurrentActionData = {}
	end
		
	if zone == 'VehicleDeleter' and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)
		
		if IsPedInAnyVehicle(playerPed,  false) then

			local vehicle, distance = ESX.Game.GetClosestVehicle({
				x = coords.x,
				y = coords.y,
				z = coords.z
			})

			if distance ~= -1 and distance <= 1.0 then

				CurrentAction     = 'delete_vehicle'
				CurrentActionMsg  = _U('store_veh')
				CurrentActionData = {vehicle = vehicle}

			end
		end
	end
end)

AddEventHandler('esx_brasseurjob:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	if (zone == 'RaisinFarm') and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then
		TriggerServerEvent('esx_brasseurjob:stopHarvest')
	end  
	if (zone == 'TraitementVin' or zone == 'TraitementJus') and PlayerData.job2 ~= nil and PlayerData.job.name == 'brewer' then
		TriggerServerEvent('esx_brasseurjob:stopTransform')
	end
	if (zone == 'SellFarm') and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then
		TriggerServerEvent('esx_brasseurjob:stopSell')
	end
	CurrentAction = nil
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

---Create Blips
function blips()
    if PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then

		for k,v in pairs(Config.Zones)do
			if v.Type == 1 or v.Type == 29 then
				local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip, 237)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 1.5)
				SetBlipColour (blip, 60)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end
end

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)


-- Enter / Exit marker events
--Citizen.CreateThread(function()
	--while true do
		--Wait(0)

		--if PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then

		--	local coords      = GetEntityCoords(GetPlayerPed(-1))
		--	local isInMarker  = false
		--	local currentZone = nil
		--	for k,v in pairs(Config.Zones) do
		--	if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
			--		isInMarker  = true
		--			currentZone = k
		--		end
		--	end

		--	if isInMarker and not HasAlreadyEnteredMarker then
		--		HasAlreadyEnteredMarker = true
		--		LastZone                = currentZone
		--		TriggerEvent('esx_brasseurjob:hasEnteredMarker', currentZone)
		--	end

		--	if not isInMarker and HasAlreadyEnteredMarker then
			--	HasAlreadyEnteredMarker = false
			--	TriggerEvent('esx_brasseurjob:hasExitedMarker', LastZone)
		--	end
	---	end
--	end
--end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' then

			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			--if isInMarker and not hasAlreadyEnteredMarker then
				--hasAlreadyEnteredMarker = true
				--lastZone				= currentZone
				--TriggerServerEvent('esx_brasseurjob:GetUserInventory', currentZone)
			--end

			if isInMarker and not hasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_brasseurjob:hasEnteredMarker',  currentZone)
			end

			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				TriggerEvent('esx_brasseurjob:hasExitedMarker', lastZone)
			end

		end
	end
end)

-- Key Controls
--Citizen.CreateThread(function()
--	while true do

	--	Citizen.Wait(0)

		--if CurrentAction ~= nil then

		--	SetTextComponentFormat('STRING')
		--	AddTextComponentString(CurrentActionMsg)
		--	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			--if IsControlPressed(0,  Keys['E']) and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' and (GetGameTimer() - GUI.Time) > 300 then

				
			--	elseif CurrentAction == 'vigne_actions_menu' then
			--		OpenVigneActionsMenu()
			--	end
			--	if CurrentAction == 'vehicle_spawner_menu' then
			--		OpenVehicleSpawnerMenu()
			--	end
			--	if CurrentAction == 'delete_vehicle' then

				--	if Config.EnableSocietyOwnedVehicles then
				--		local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
				--		TriggerServerEvent('esx_society:putVehicleInGarage', 'vigne', vehicleProps)
				--	end

				--	ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				--end

				--CurrentAction = nil
				--GUI.Time      = GetGameTimer()

			--end
		--end

		--if IsControlPressed(0,  Keys['F6']) and Config.EnablePlayerManagement and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' and (GetGameTimer() - GUI.Time) > 150 then
			--OpenMobileVigneActionsMenu()
			--GUI.Time = GetGameTimer()
		--end
	--end)
--end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlPressed(0,  Keys['E']) and PlayerData.job2 ~= nil and PlayerData.job2.name == 'brewer' and (GetGameTimer() - GUI.Time) > 300 then
				isInZone = true -- unless we set this boolean to false, we will always freeze the user
				if CurrentAction == 'exitMarker' then
					isInZone = false -- do not freeze user
					TriggerEvent('esx_brasseurjob:freezePlayer', false)
					TriggerEvent('esx_brasseurjob:hasExitedMarker', lastZone)
					Citizen.Wait(1000)
				elseif CurrentAction == 'raisin_harvest' then
					TriggerServerEvent('esx_brasseurjob:startHarvest', CurrentActionData.zone)
				elseif CurrentAction == 'jus_traitement' then
					TriggerServerEvent('esx_brasseurjob:startTransform', CurrentActionData.zone)
				elseif CurrentAction == 'vine_traitement' then
					TriggerServerEvent('esx_brasseurjob:startTransform', CurrentActionData.zone)
				elseif CurrentAction == 'farm_resell' then
					TriggerServerEvent('esx_brasseurjob:startSell', CurrentActionData.zone)
				else
					isInZone = false -- not a esx_drugs zone
				end
				
				if isInZone then
					TriggerEvent('esx_brasseurjob:freezePlayer', true)
				end
				
				CurrentAction = nil
				GUI.Time      = GetGameTimer()
			end
		end
	end
end)

RegisterNetEvent('esx_brasseurjob:freezePlayer')
AddEventHandler('esx_brasseurjob:freezePlayer', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), freeze)
end)