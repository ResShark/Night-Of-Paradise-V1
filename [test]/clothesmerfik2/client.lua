ESX                     = nil

local lastMask   = {}
local lastHelmet = {}
local lastGlass = {}

local nakedMask   = false
local nakedHelmet = false
local nakedGlass  = false



Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('vetement:haut')
AddEventHandler('vetement:haut', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	
if skin.sex == 0 then
		local clothesSkin = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 15, ['torso_2'] = 0,
		['arms'] = 15, ['arms_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
else
		local clothesSkin = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 15, ['torso_2'] = 0,
		['arms'] = 15, ['arms_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
end
	end)
end)
RegisterNetEvent('vetement:bas')
AddEventHandler('vetement:bas', function()
	TriggerEvent('skinchanger:getSkin', function(skin)

if skin.sex == 0 then
		local clothesSkin = {
		['pants_1'] = 21, ['pants_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
else
		local clothesSkin = {
		['pants_1'] = 15, ['pants_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
end
	end)
end)

RegisterNetEvent('vetement:chaussures')
AddEventHandler('vetement:chaussures', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	
if skin.sex == 0 then
		local clothesSkin = {
		['shoes_1'] = 34, ['shoes_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
else
		local clothesSkin = {
		['shoes_1'] = 35, ['shoes_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
end
	end)
end)

RegisterNetEvent('vetement:sac')
AddEventHandler('vetement:sac', function()
	TriggerEvent('skinchanger:getSkin', function(skin)

if skin.sex == 0 then
		local clothesSkin = {
		['bags_1'] = 0, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
else
		local clothesSkin = {
		['bags_1'] = 0, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
end
	end)
end)


function OpenActionMenuInteraction(target)

	ESX.UI.Menu.CloseAll()
	local elements = {}

	table.insert(elements, {label = ('Remettre ses vêtement'), value = 'ubie'})
	table.insert(elements, {label = ('Enlever son haut'), value = 'tul'})
	table.insert(elements, {label = ('Enlever son pantalon'), value = 'spo'})
	table.insert(elements, {label = ('Enlever ses chaussures'), value = 'but'})
	table.insert(elements, {label = ('Enlever son sac'), value = 'sac'})

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'action_menu',
	{
		title    = ('Vêtements'),
		align    = 'top-left',
		elements = elements
	},
		function(data, menu)
			
			if data.current.value == 'ubie' then			
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
			end)
			elseif data.current.value == 'tul' then
			TriggerEvent('vetement:haut')
			elseif data.current.value == 'spo' then
			TriggerEvent('vetement:bas')
			elseif data.current.value == 'but' then
			TriggerEvent('vetement:chaussures')
			elseif data.current.value == "sac" then
			TriggerEvent('vetement:sac')
		end
		end,
	function(data, menu)
        menu.close()
	end)
end

function OpenAccessoryMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'set_unset_accessory',
	{
		title = 'Accessoire',
		align = 'top-left',
		elements = {
			{label = 'Chapeau', value = 'helmet'},
			{label = 'Masque', value = 'mask'},
			{label = 'Lunette', value = 'glass'},
		}
	}, function(data, menu)		
		if data.current.value == 'helmet' then
			Helmet()
		elseif data.current.value == 'mask' then	
			Mask()
		elseif data.current.value == 'glass' then
			Glass()	
		end
	end, function(data, menu)
		menu.close()
	end)
end

function Mask()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local postac2 = skin
		local newPostac2 = {}
		if not nakedMask then			
		
			lastMask = {
				aMask 	 = skin['mask_1'], 
				aMaskCol = skin['mask_2']
			}
			
			if lastMask.aMask == -1 then
				ESX.ShowNotification('~r~Tu ne posséde pas de masque!')
				return
			else
			
				newPostac2['mask_1'] = -1
				newPostac2['mask_2'] = 0				
			
				local lib, anim = 'misscommon@std_take_off_masks', 'take_off_mask_ps'
				ESX.Streaming.RequestAnimDict(lib, function()
					TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
				end)
				
				Citizen.Wait(750)
				ClearPedTasks(PlayerPedId())
			end
			nakedMask = true
		else
			if lastMask.aMask == -1 then
				ESX.ShowNotification('~r~Tu ne posséde pas de masque!')
			else
				newPostac2['mask_1'] = lastMask.aMask
				newPostac2['mask_2'] = lastMask.aMaskCol
				
				local lib, anim = 'misscommon@van_put_on_masks', 'put_on_mask_rds'
				ESX.Streaming.RequestAnimDict(lib, function()
					TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
				end)
				
				Citizen.Wait(1350)
				ClearPedTasks(PlayerPedId())
			end
			nakedMask = false
		end
		TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
	end)
end

function Helmet()	
	TriggerEvent('skinchanger:getSkin', function(skin)
		local postac2 = skin
		local newPostac2 = {}
		if not nakedHelmet then			
		
			lastHelmet = {
				aHelmet = skin['helmet_1'], 
				aHelCol = skin['helmet_2']
			}
			
			if lastHelmet.aHelmet == -1 then
				ESX.ShowNotification('~r~Tu ne posséde pas de chapeau!')
				return
			else
				newPostac2['helmet_1'] = -1
				newPostac2['helmet_2'] = 0
				
				local lib, anim = 'veh@bike@common@front@base', 'take_off_helmet_stand'
				ESX.Streaming.RequestAnimDict(lib, function()
					TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
				end)
				
				Citizen.Wait(1150)
				ClearPedTasks(PlayerPedId())
			end
			nakedHelmet = true
		else
			if lastHelmet.aHelmet == -1 then
				ESX.ShowNotification('~r~Tu ne posséde pas de chapeau!')
			else
				newPostac2['helmet_1'] = lastHelmet.aHelmet
				newPostac2['helmet_2'] = lastHelmet.aHelCol
				
				local lib, anim = 'missheistdockssetup1hardhat@', 'put_on_hat'
				ESX.Streaming.RequestAnimDict(lib, function()
					TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
				end)
				
				Citizen.Wait(1450)
				
			end
			nakedHelmet = false
		end
		TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
	end)
end

function Glass()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local postac2 = skin
		local newPostac2 = {}
		if not nakedGlass then			
		
			lastGlass = {
				aGlass 	 = skin['glasses_1'], 
				aGlassCol = skin['glasses_2']
			}
			
			if lastMask.aMask == -1 then
				ESX.ShowNotification('~r~Tu ne posséde pas de lunette !')
				return
			else
			
				newPostac2['glasses_1'] = -1
				newPostac2['glasses_2'] = 0				
			
				local lib, anim = 'clothingspecs', 'try_glasses_positive_a'
				ESX.Streaming.RequestAnimDict(lib, function()
					TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
				end)
				
				Citizen.Wait(750)
				ClearPedTasks(PlayerPedId())
			end
			nakedGlass = true
		else
			if lastMask.aGlass == -1 then
				ESX.ShowNotification('~r~Tu ne posséde pas de masque!')
			else
				newPostac2['glasses_1'] = lastGlass.aGlass
				newPostac2['glasses_2'] = lastGlass.aGlassCol
				
				local lib, anim = 'clothingspecs', 'try_glasses_positive_a'
				ESX.Streaming.RequestAnimDict(lib, function()
					TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
				end)
				
				Citizen.Wait(1350)
				ClearPedTasks(PlayerPedId())
			end
			nakedGlass = false
		end
		TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
	end)
end


RegisterNetEvent('NB:openMenuVetements')
AddEventHandler('NB:openMenuVetements', function()
  	OpenActionMenuInteraction()
end)

--RegisterNetEvent('NB:openMenuAccessoires')
--AddEventHandler('NB:openMenuAccessoires', function()
  	--OpenAccessoryMenu()
--end)


