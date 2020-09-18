local connected = false

AddEventHandler("playerSpawned", function()
	if not connected then
		TriggerServerEvent("Rocade:playerConnected")
		connected = true
	end
end)