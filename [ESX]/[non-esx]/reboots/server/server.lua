-----------------------------------------
-----------------------------------------
----    File : server.lua            ----
----    Author : gassastsina         ----
----    Side : server          		 ----
----    Description : Alerte tempête ----
-----------------------------------------
-----------------------------------------

----------------------------------------------ESX--------------------------------------------------------
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-----------------------------------------------main-------------------------------------------------------
function checkreboot()
	local date_local = os.date('%H:%M:%S', os.time())
	if date_local == '05:25:00' or date_local == '11:25:00' or date_local == '17:25:00' or date_local == '01:25:00' then
		--TriggerClientEvent('reboot:startRain', -1)
		--TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot automatiquement dans 35 minutes !")
        ESX.SavePlayers()
	elseif date_local == '05:36:00' or date_local == '11:36:00' or date_local == '17:36:00' or date_local == '01:36:00' then
		--TriggerClientEvent('reboot:startThunder', -1)
		--TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot automatiquement dans 25 minutes !")
        ESX.SavePlayers()
	elseif date_local == '05:40:00' or date_local == '11:40:00' or date_local == '17:40:00' or date_local == '01:40:00' then
		--TriggerClientEvent('reboot:startThunder', -1)
		--TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot automatiquement dans 20 minutes !")
        ESX.SavePlayers()
	elseif date_local == '05:45:00' or date_local == '11:45:00' or date_local == '17:45:00' or date_local == '01:40:00' then
		--TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot automatiquement dans 15 minutes !")
        ESX.SavePlayers()
	elseif date_local == '05:50:00' or date_local == '11:50:00' or date_local == '17:50:00' or date_local == '01:40:00' then
		--TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot automatiquement dans 10 minutes !")
        ESX.SavePlayers()
	elseif date_local == '05:55:00' or date_local == '11:55:00' or date_local == '17:55:00' or date_local == '01:40:00' then
		--TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot automatiquement dans 5 minutes ! Pensez à vous déconnecter !")
		--TriggerClientEvent('reboot:startAlarm', -1)
        ESX.SavePlayers()
	elseif date_local == '05:59:40' or date_local == '11:59:40' or date_local == '17:59:40' or date_local == '01:40:00' then
		ESX.SavePlayers()
	--elseif date_local == '05:59:40' then
	--	ExecuteCommand("start esx_douane")
	--    TriggerClientEvent('esx:showNotification', -1, "Lancement de la ~r~Semi-Whitelist")*
	--elseif date_local == '05:59:40' then
	--	ExecuteCommand("stop esx_douane")
    --    TriggerClientEvent('esx:showNotification', -1, "Arrêt de la ~r~Semi-Whitelist")
	end
end

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/reboot' then
        --TriggerClientEvent('reboot:startAlarm1', -1)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        
        TriggerClientEvent('reboot:startAlarm', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        Wait(100)
        TriggerClientEvent('reboot:startRain', -1)
        TriggerClientEvent('reboot:startThunder', -1)
        TriggerClientEvent('esx:showNotification', -1, "~r~Le serveur reboot MAINTENANT !!!")
        
        TriggerClientEvent('reboot:startAlarm', -1)
        --CancelEvent()
    end
end)

function restart_server()
	SetTimeout(1000, function()
		checkreboot()
		restart_server()
	end)
end
restart_server()

RegisterNetEvent('reboot:checkStatus')
AddEventHandler('reboot:checkStatus', function()
	local heure = os.date('%H', os.time())
	if heure == '05' or heure == '11' or heure == '17' or heure == '01' then
		local minute = tonumber(os.date('%M', os.time()))
		if minute >= 30 then
			--TriggerClientEvent('reboot:startThunder', source)
			if minute >= 35 then
				 --TriggerClientEvent('reboot:startAlarm', source)
			end
		else
			--TriggerClientEvent('reboot:startRain', -1)
		end
		Wait(45000)
		--TriggerClientEvent('esx:showNotification', -1, "Alerte tempête veuillez suivre les procedures respectivent")
	end
end)