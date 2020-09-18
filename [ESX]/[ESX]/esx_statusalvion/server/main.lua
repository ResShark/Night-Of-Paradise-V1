ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	local players = ESX.GetPlayers()

	for _,playerId in ipairs(players) do
		local xPlayer = ESX.GetPlayerFromId(playerId)

		MySQL.Async.fetchAll('SELECT status FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			local data = {}

			if result[1].status then
				data = json.decode(result[1].status)
			end

			xPlayer.set('status', data)
			TriggerClientEvent('esx_status:load', playerId, data)
		end)
	end
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	MySQL.Async.fetchAll('SELECT status FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local data = {}

		if result[1].status then
			data = json.decode(result[1].status)
		end

		xPlayer.set('status', data)
		TriggerClientEvent('esx_status:load', playerId, data)
	end)
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local status = xPlayer.get('status')

	MySQL.Async.execute('UPDATE users SET status = @status WHERE identifier = @identifier', {
		['@status']     = json.encode(status),
		['@identifier'] = xPlayer.identifier
	})
end)

AddEventHandler('esx_status:getStatus', function(playerId, statusName, cb)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local status  = xPlayer.get('status')

	for i=1, #status, 1 do
		if status[i].name == statusName then
			cb(status[i])
			break
		end
	end
end)

RegisterServerEvent('esx_status:update')
AddEventHandler('esx_status:update', function(status)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		xPlayer.set('status', status)
	end
end)

RegisterServerEvent('esx_status:showid')
AddEventHandler('esx_status:showid', function(player, type)
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @user_id", {
        ['@user_id'] = identifier,
    }, function (result)
		if (result ~= nil) then
			if player ~= 0 then
				TriggerClientEvent("esx_status:showid", player, _source, result[1].firstname, result[1].lastname, result[1].dateofbirth, result[1].sex, result[1].phone_number, result[1].height, type)
				TriggerClientEvent("esx_status:showid", _source, _source, result[1].firstname, result[1].lastname, result[1].dateofbirth, result[1].sex, result[1].phone_number, result[1].height, type)
			else
				TriggerClientEvent("esx_status:showid", _source, _source, result[1].firstname, result[1].lastname, result[1].dateofbirth, result[1].sex, result[1].phone_number, result[1].height, type)
			end
		end
	end)
end)

function SaveData()
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local status  = xPlayer.get('status')

		MySQL.Async.execute('UPDATE users SET status = @status WHERE identifier = @identifier', {
			['@status']     = json.encode(status),
			['@identifier'] = xPlayer.identifier
		})
	end

	SetTimeout(10 * 60 * 1000, SaveData)
end

SaveData()