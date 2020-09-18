--Made by Jijamik, feel free to modify

RegisterNetEvent('meteo:actu')
AddEventHandler('meteo:actu', function(data)
	ClearWeatherTypePersist()
	SetWeatherTypeOverTime("Meteo", 80.00)
	SetWind(1.0)
	SetWindSpeed("VitesseVent");
	SetWindDirection("DirVent")
    if "Meteo" == "XMAS" then
        SetForceVehicleTrails(true)
        SetForcePedFootstepsTracks(true)
    else
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
    end
end)

AddEventHandler('onClientMapStart', function()
	TriggerServerEvent('meteo:sync')
end)

TriggerServerEvent('meteo:sync')
