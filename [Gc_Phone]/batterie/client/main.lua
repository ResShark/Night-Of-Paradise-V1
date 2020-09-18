ESX                           = nil

local batterie = 50

local bloquetouche = 289 -- Touche: "=", lorsque le téléphone n'a pas de batterie, il bloque cette Touche

local destination = {
	{x = -42.74,   	y = -1754.99,  z = 28.45},
	{x = -704.93,  	y = -908.78,   z = 17.21},
	{x = 438.38,   	y = -987.64,   z = 29.68},
	{x = 34.37,    	y = -1343.37,  z = 28.49},
	{x = -267.90,  	y = -964.27,   z = 30.22},
	{x = 348.85,   	y = -578.88,   z = 27.79},
	{x = -705.01,   y = -908.77,   z = 18.21},
	{x = 1135.33,   y = -980.27,   z = 45.41},
	{x = -1485.99,  y = -380.28,   z = 39.16},
	{x = -1079.87,  y = -255.46,   z = 36.76},
	{x = 1164.94,   y = -317.65,   z = 68.20},	
	{x = -1822.61,  y = 798.47,    z = 137.08},
	{x = -2967.94,  y = 389.07,    z = 14.04},
	{x = -3043.78,  y = 584.05,    z = 6.90},
	{x = -3246.93,  y = 1001.48,   z = 11.83},
	{x = 373.28,    y = 329.89,    z = 102.56},
	{x = 241.82,    y = 215.95,    z = 105.28},
	{x = 2553.51,   y = 390.88,    z = 107.62},
	{x = 2679.12,   y = 3290.14,   z = 54.24},
	{x = 1167.72,   y = 2709.33,   z = 37.15},
	{x = 548.16,    y = 2668.76,   z = 41.15},
	{x = 1959.78,   y = 3743.107,  z = 31.34},
	{x = 1391.38,   y = 3604.54,   z = 33.98},
	{x = 1701.33,   y = 4919.23,   z = 41.06},
	{x = 1731.06,   y = 6419.22,   z = 34.03},
	{x = 1855.12,   y = 3688.86,   z = 33.28},
	{x = 4.42,      y = 6509.39,   z = 30.87},
	{x = -115.19,   y = 6472.40,   z = 30.62},
	{x = 808.31,    y = -2154.60,  z = 28.61},
	{x = 4.42,      y = 6509.39,   z = 30.87},
	{x = -51.47,    y = -1102.38,  z = 25.42},
	{x = -137.87,   y = -640.25,   z = 167.82},
	{x = -203.73,   y = -1339.02,   z = 33.89},
	{x = -1190.57,   y = -1725.42,   z = 3.58},
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
	TriggerServerEvent("batterie:updatebatteriet")
end)

-- Bloque la touche --
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if batterie > 1 then
			Citizen.Wait(100000)
			TriggerServerEvent("batterie:updatebatterie")
		else
			DisableControlAction(0, bloquetouche, true) -- Bloqué telephone
		end
	end
end)
-- Fin Bloque la touche --

-- Display Marker --
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		for _,v in pairs(destination) do
			local ped = GetPlayerPed(-1)
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, x, y, z, 1)
			if distance <= 10 then
				Drawing.draw3DText(v.x, v.y, v.z, "[~g~Zone de charge~w~] ~n~Branche ~b~ton smartphone~w~ ~y~ici~w~", 4, 0.15, 0.05, 255, 255, 255, 255)
				DrawMarker(-1, v.x, v.y, v.z + 0.2, 0, 0, 0, 0, 0, 0, 0.5,0.5,0.5, 0, 232, 255, 155, 0, 0, 0, 0, 0, 0, 0)
			end
			if batterie < 99 and distance <= 1.3 then
				ESX.ShowNotification("[~g~Zone de charge~w~]~n~Chargement du téléphone. Patienté: ~g~"..batterie.."%~w~")
				TriggerServerEvent("batterie:updatebatteriet")
				Citizen.Wait(2000)
				TriggerServerEvent("batterie:updatebatteriecarr")
			end
		end

		if (IsControlJustReleased(1, bloquetouche)) then
			local couleurbatterie = "~w~"
			if batterie >= 60 then
				couleurbatterie = "~g~"
			elseif batterie < 60 and batterie > 20 then
				couleurbatterie = "~y~"
			elseif batterie <= 20 then
				couleurbatterie = "~r~"
			end
			ESX.ShowNotification("[~g~Etat de la Batterie~w~]~n~Votre téléphone à "..couleurbatterie..""..batterie.."%~w~~n~ de batterie")
		end
	end
end)
-- Fin Display Marker --

-- Check de la Batterie --
RegisterNetEvent('batterie:setbatterie')
AddEventHandler('batterie:setbatterie', function(check)
	
	batterie = check

end)
-- Fin Check de la Batterie --

-- Event Create Bdd --
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer

	TriggerServerEvent("batterie:createdb")
end)
-- Fin Event Create Bdd --

-- Fonction Draw Text 3D --
Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*14
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+1, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
-- Fin Fonction Draw Text 3D --

Citizen.CreateThread(function()
	
	for i=1, #destination, 1 do
		
		local blip = AddBlipForCoord(destination[i].x, destination[i].y, destination[i].z)

		SetBlipSprite (blip, 365)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 57)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Chargeur pour téléphone')
		EndTextCommandSetBlipName(blip)
	end

end)