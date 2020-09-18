-----------------------------------------
-- Created and modify by L'ile Légale RP
-- SenSi and Kaminosekai
-----------------------------------------

ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local vine = 1
local jus = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'vigne', Config.MaxInService)
end

local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if xPlayer ~= nil and zone == "HoublonFarm" then
		--if zone == "RaisinFarm" then
			local itemQuantity = xPlayer.getInventoryItem('houblon').count
			if itemQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
				return
			else
				SetTimeout(1800, function()
					xPlayer.addInventoryItem('houblon', 1)
					Harvest(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('esx_brasseurjob:startHarvest')
AddEventHandler('esx_brasseurjob:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('raisin_taken'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('esx_brasseurjob:stopHarvest')
AddEventHandler('esx_brasseurjob:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~récolter')
		PlayersHarvesting[_source]=true
	end
end)


local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if xPlayer ~= nil and zone == "MiseBouteille" then

			local itemQuantity = xPlayer.getInventoryItem('thoublon').count
			
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else			
				SetTimeout(1800, function()
					xPlayer.removeInventoryItem('thoublon', 1)
					xPlayer.addInventoryItem('boubiere', 1)
				
					Transform(source, zone)
				end)
			end
		elseif zone == "TraitementHoublon" then
			local itemQuantity = xPlayer.getInventoryItem('houblon').count
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
				SetTimeout(1800, function()
					xPlayer.removeInventoryItem('houblon', 1)
					xPlayer.addInventoryItem('thoublon', 1)
		  
					Transform(source, zone)	  
				end)
			end
		end
	end
end

RegisterServerEvent('esx_brasseurjob:startTransform')
AddEventHandler('esx_brasseurjob:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone)
	end
end)

RegisterServerEvent('esx_brasseurjob:stopTransform')
AddEventHandler('esx_brasseurjob:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~traiter votre houblon')
		PlayersTransforming[_source]=true	
	end
end)

local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)

		if xPlayer ~= nil and zone == 'SellFarm' then
			
			if xPlayer.getInventoryItem('boubiere').count <= 0 then
				jus = 0
			else
				jus = 1
			end
		
			if jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('boubiere').count <= 0 and vine == 0then
				TriggerClientEvent('esx:showNotification', source, _U('no_jus_sale'))
				jus = 0
				return
			else
				if (jus == 1) then
					SetTimeout(1100, function()
						local argent = math.random(30,30)
						xPlayer.removeInventoryItem('boubiere', 1)
                        
                        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. argent)

						xPlayer.addMoney(argent)

						Sell(source,zone)
					end)
				end
				
			end
		end
	end
end

RegisterServerEvent('esx_brasseurjob:startSell')
AddEventHandler('esx_brasseurjob:startSell', function(zone)

	local _source = source
	
	if PlayersSelling[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSelling[_source]=false
	else
		PlayersSelling[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone)
	end

end)

RegisterServerEvent('esx_brasseurjob:stopSell')
AddEventHandler('esx_brasseurjob:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end

end)

ESX.RegisterServerCallback('esx_brasseurjob:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})
end)

