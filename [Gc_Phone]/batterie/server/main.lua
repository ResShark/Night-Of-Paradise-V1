ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Event Create batterie Bdd Joueurs --
RegisterServerEvent('batterie:createdb')
AddEventHandler('batterie:createdb', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	local checkdb = MySQL.Sync.fetchScalar("SELECT pourcentage FROM batterie_phone WHERE owner = @id", {['@id'] = xPlayer.identifier})

	if checkdb then
		TriggerClientEvent("batterie:setbatterie", source, checkdb)
	else
		MySQL.Async.execute('INSERT INTO batterie_phone (owner, pourcentage) VALUES (@owner, @pourcentage)',
		{
			['@owner']   = xPlayer.identifier,
			["@pourcentage"] = 100
		}, function (rowsChanged)
			
		end)
	end
end)
-- Fin Event Create batterie Bdd Joueurs --

-- Event Update décharge batterie Bdd Joueurs --
RegisterServerEvent('batterie:updatebatterie')
AddEventHandler('batterie:updatebatterie', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local batteriec = MySQL.Sync.fetchScalar("SELECT pourcentage FROM batterie_phone WHERE owner = @id", {['@id'] = xPlayer.identifier})
	batteriec = batteriec - 1
	TriggerClientEvent("batterie:setbatterie", source, batteriec)
	MySQL.Async.execute("UPDATE batterie_phone SET pourcentage = @pourcentage WHERE owner = @owner",
		{
			["@owner"] = xPlayer.identifier,
			["@pourcentage"] = batteriec
		}
	)
end)
-- Fin Event Update décharge batterie Bdd Joueurs --

-- Event Update Charge batterie Bdd Joueurs --
RegisterServerEvent('batterie:updatebatteriecarr')
AddEventHandler('batterie:updatebatteriecarr', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local batteriec = MySQL.Sync.fetchScalar("SELECT pourcentage FROM batterie_phone WHERE owner = @id", {['@id'] = xPlayer.identifier})
	batteriec = batteriec + 1
	TriggerClientEvent("batterie:setbatterie", source, batteriec)
	MySQL.Async.execute("UPDATE batterie_phone SET pourcentage = @pourcentage WHERE owner = @owner",
		{
			["@owner"] = xPlayer.identifier,
			["@pourcentage"] = batteriec
		}
	)
end)
-- Fin Event Update Charge batterie Bdd Joueurs --

-- Event Update temps de charge Bdd Joueurs --
RegisterServerEvent('batterie:updatebatteriet')
AddEventHandler('batterie:updatebatteriet', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local batteriec = MySQL.Sync.fetchScalar("SELECT pourcentage FROM batterie_phone WHERE owner = @id", {['@id'] = xPlayer.identifier})
	TriggerClientEvent("batterie:setbatterie", source, batteriec)
end)
-- Fin Event Update temps de charge Bdd Joueurs --