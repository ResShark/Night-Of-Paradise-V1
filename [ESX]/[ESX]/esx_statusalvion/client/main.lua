ESX = nil
local Status, isPaused = {}, false
local display = 0
local alcohol = 0 
local firstname = nil
local lastname = nil
local dateofbirth = nil
local job = nil
local health = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function GetStatusData(minimal)
    local status = {}

    for i=1, #Status, 1 do
        if minimal then
            table.insert(status, {
                name    = Status[i].name,
                val     = Status[i].val,
                percent = (Status[i].val / Config.StatusMax) * 100
            })
        else
            table.insert(status, {
                name    = Status[i].name,
                val     = Status[i].val,
                color   = Status[i].color,
                visible = Status[i].visible(Status[i]),
                max     = Status[i].max,
                percent = (Status[i].val / Config.StatusMax) * 100
            })
        end
    end

    return status
end

AddEventHandler('esx_status:registerStatus', function(name, default, color, visible, tickCallback)
    local status = CreateStatus(name, default, color, visible, tickCallback)
    table.insert(Status, status)
end)

AddEventHandler('esx_status:unregisterStatus', function(name)
    for k,v in ipairs(Status) do
        if v.name == name then
            table.remove(Status, k)
            break
        end
    end
end)

RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(status)
    local text = 0

    for i=1, #Status, 1 do
        for j=1, #status, 1 do
            if Status[i].name == status[j].name then
                Status[i].set(status[j].val)
            end
        end
    end

    Citizen.CreateThread(function()
        while true do
            for i=1, #Status, 1 do
                Status[i].onTick()
            end

            SendNUIMessage({
                update = true,
                alcohol = alcohol,
                firstname = firstname,
                lastname = lastname,
                dateofbirth = dateofbirth,
                job = job,
                health = health,
                status = GetStatusData()
            })

            TriggerEvent('esx_status:onTick', GetStatusData(true))
            Citizen.Wait(Config.TickTime)
        end
    end)
end)

RegisterNetEvent('esx_status:set')
AddEventHandler('esx_status:set', function(name, val)
    for i=1, #Status, 1 do
        if Status[i].name == name then
            Status[i].set(val)
            break
        end
    end

    SendNUIMessage({
        update = true,
        alcohol = alcohol,
        firstname = firstname,
        lastname = lastname,
        dateofbirth = dateofbirth,
        job = job,
        health = health,
        status = GetStatusData()
    })

    TriggerServerEvent('esx_status:update', GetStatusData(true))
end)

RegisterNetEvent('esx_status:add')
AddEventHandler('esx_status:add', function(name, val)
    for i=1, #Status, 1 do
        if Status[i].name == name then
            Status[i].add(val)
            break
        end
    end

    SendNUIMessage({
        update = true,
        alcohol = alcohol,
        firstname = firstname,
        lastname = lastname,
        dateofbirth = dateofbirth,
        job = job,
        health = health,
        status = GetStatusData()
    })

    TriggerServerEvent('esx_status:update', GetStatusData(true))
end)

RegisterNetEvent('esx_status:remove')
AddEventHandler('esx_status:remove', function(name, val)
    for i=1, #Status, 1 do
        if Status[i].name == name then
            Status[i].remove(val)
            break
        end
    end

    SendNUIMessage({
        update = true,
        alcohol = alcohol,
        firstname = firstname,
        lastname = lastname,
        dateofbirth = dateofbirth,
        job = job,
        health = health,
        status = GetStatusData()
    })

    TriggerServerEvent('esx_status:update', GetStatusData(true))
end)

AddEventHandler('esx_status:getStatus', function(name, cb)
    for i=1, #Status, 1 do
        if Status[i].name == name then
            cb(Status[i])
            return
        end
    end
end)

AddEventHandler('esx_status:setDisplay', function(val)
    SendNUIMessage({
        setDisplay = true,
        display    = val
    })
end)

-- Pause menu disable hud display
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300)

        if IsPauseMenuActive() and not isPaused then
            isPaused = true
            TriggerEvent('esx_status:setDisplay', 0.0)
        elseif not IsPauseMenuActive() and isPaused then
            isPaused = false 
            TriggerEvent('esx_status:setDisplay', 0.5)
        end
    end
end)

-- Loaded event
Citizen.CreateThread(function()
    TriggerEvent('esx_status:loaded')
end)

-- Update server
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.UpdateInterval)

        TriggerServerEvent('esx_status:update', GetStatusData(true))
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            if IsControlJustReleased(1, 20) then
                if display == 0 then
                        SendNUIMessage({
                            display = true
                        })
                        display = display+1
                        SetNuiFocus(true, true)
                    else 
                        SendNUIMessage({
                            display = false
                        })
                        display = 0
                        SetNuiFocus(false, false)
                end
            end
        end
end)

RegisterNetEvent("esx_status:addalcohol")
AddEventHandler("esx_status:addalcohol", function(value)
    alcohol = alcohol+value

    while alcohol > 0 do
        alcohol = alcohol-1
        print(alcohol)
        Citizen.Wait(1000)
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
            health = GetEntityHealth(PlayerPedId())
    end
end)

RegisterNUICallback('focusOff', function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNetEvent("esx_status:open")
AddEventHandler("esx_status:open", function()
    SendNUIMessage({
        display = true
    })
    SetNuiFocus(true, true)
end)        

RegisterNUICallback('idcard', function(data)
    local player, distance = ESX.Game.GetClosestPlayer()
    if (data.type == "idcard") then
        TriggerServerEvent("esx_status:showid", GetPlayerServerId(player), "idcard")
    elseif (data.type == "businesscard") then
        TriggerServerEvent("esx_status:showid", GetPlayerServerId(player), "businesscard")
    elseif (data.type == "license") then
        TriggerServerEvent("esx_status:showid", GetPlayerServerId(player), "license")
    elseif (data.type == "driverlicense") then
        TriggerServerEvent("esx_status:showid", GetPlayerServerId(player), "driverlicense")
    end
end)

RegisterNetEvent("esx_status:showid")
AddEventHandler("esx_status:showid", function(player, firstname, lastname, dateofbirth, sex, phonenumber, height, type)
    local id1 = PlayerId()
    local id2 = GetPlayerFromServerId(player)
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(id1)), GetEntityCoords(GetPlayerPed(id2)), true) < 3 then
    local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(player)))
    if type == "idcard" then
        if (sex == "m") then
            ESX.ShowAdvancedNotification("Identity card", firstname .. " " .. lastname, "Date of birth: " .. dateofbirth .. "\nGender: ~b~Male~w~\nHeight: " .. height .. "cm", mugshotStr, 4)
        elseif (sex == "f") then
            ESX.ShowAdvancedNotification("Identity card", firstname .. " " .. lastname, "Date of birth: " .. dateofbirth .. "\nGender: ~q~Female~w~\nHeight: " .. height .. "cm", mugshotStr, 4)
        end
    elseif type == "businesscard" then
        ESX.ShowAdvancedNotification("Business card", firstname .. " " .. lastname, "Phone number: ~b~" .. phonenumber, mugshotStr, 4)
    elseif type == "license" then
        ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
            if hasWeaponLicense then
                ESX.ShowAdvancedNotification("Licenses", firstname .. " " .. lastname, "Weapon license: ~g~YES" , mugshotStr, 4)
            else
                ESX.ShowAdvancedNotification("Licenses", firstname .. " " .. lastname, "Weapon license: ~r~NO" , mugshotStr, 4)
            end
        end, GetPlayerServerId(PlayerId()), 'weapon')
    elseif type == "driverlicense" then
        ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriverLicense)
            if hasDriverLicense then
                ESX.ShowAdvancedNotification("Licenses", firstname .. " " .. lastname, "Driver license: ~g~YES" , mugshotStr, 4)
            else
                ESX.ShowAdvancedNotification("Licenses", firstname .. " " .. lastname, "Driver license: ~r~NO" , mugshotStr, 4)
            end
        end, GetPlayerServerId(PlayerId()), 'driver')
    end
    UnregisterPedheadshot(mugshot)
    end
end)