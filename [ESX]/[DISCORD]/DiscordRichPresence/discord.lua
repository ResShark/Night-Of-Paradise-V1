Citizen.CreateThread(function()
    while true do
        local player = GetPlayerPed(-1)
        
        Citizen.Wait(5*1000) -- checks every 5 seconds (to limit resource usage)
        
        SetDiscordAppId(655516363598594058) -- client id (655498304263553065)

        SetRichPresence( GetPlayerName(source) .. " is on " .. GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(player))) )) -- main text (string)

        SetDiscordRichPresenceAsset("night") -- large logo key ("logo")
        SetDiscordRichPresenceAssetText(GetPlayerName(source)) -- Large logo "hover" text (string)

        SetDiscordRichPresenceAssetSmall("night") -- small logo key (string)
        SetDiscordRichPresenceAssetSmallText("Health: "..(GetEntityHealth(player)-100)) -- small logo "hover" text (string)

    end
end)

--[[
    EVAL STRING FOR VIDEO 

    /eval SetEntityHealth(GetPlayerPed(-1),100)
    
--]]