local TagSuperAdmin = 'nil' -- DONT TOUCH PLEASE 
local TagAdmin = 'nil' -- DONT TOUCH PLEASE 
local TagMod = 'nil'  -- DONT TOUCH PLEASE 
local TagHelper = 'nil' -- DONT TOUCH PLEASE
--DONT TOUCH PLEASE-------------DONT TOUCH PLEASE-------------DONT TOUCH PLEASE-------------DONT TOUCH PLEASE-------------

RegisterNetEvent('Cheleber:tagsuperadmin')
AddEventHandler('Cheleber:tagsuperadmin', function(id, tag) 
    if TagSuperAdmin == 'nil' then
	    if tag == 'true' then
		    TagSuperAdmin = id .. ''
	    end
	else
	    if tag == 'true' then
		    TagSuperAdmin = TagSuperAdmin ..'\n'.. id
	    end
    end
end) 


RegisterNetEvent('Cheleber:tagadmin')
AddEventHandler('Cheleber:tagadmin', function(id, tag) 
    if TagAdmin == 'nil' then
	    if tag == 'true' then
		    TagAdmin = id .. ''
	    end
	else
	    if tag == 'true' then
		    TagAdmin = TagAdmin ..'\n'.. id
	    end
    end
end) 


RegisterNetEvent('Cheleber:tagmod')
AddEventHandler('Cheleber:tagmod', function(id, tag) 
    if TagMod == 'nil' then
	    if tag == 'true' then
		    TagMod = id .. ''
	    end
	else
	    if tag == 'true' then
		    TagMod = TagMod ..'\n'.. id
	    end
    end
end) 


RegisterNetEvent('Cheleber:taghelper')
AddEventHandler('Cheleber:taghelper', function(id, tag) 
    if TagHelper == 'nil' then
	    if tag == 'true' then
		    TagHelper = id .. ''
	    end
	else
	    if tag == 'true' then
		    TagHelper = TagHelper ..'\n'.. id
	    end
    end
end) 

RegisterNetEvent('Cheleber:tagclean')
AddEventHandler('Cheleber:tagclean', function() 
    TagSuperAdmin = 'nil'
    TagAdmin = 'nil'
	TagMod = 'nil'
	TagHelper = 'nil'
	TriggerServerEvent('Cheleber:SVstarttag', GetPlayerServerId(PlayerId()))
end) 


Citizen.CreateThread(function()
	while true do
		-- Wait 5 seconds after player has loaded in and trigger the event.
		Citizen.Wait( 2500 )

		if NetworkIsSessionStarted() then
			TriggerServerEvent('Cheleber:SVstarttagjoin', GetPlayerServerId(PlayerId()))
			break
		end
	end
end)



Citizen.CreateThread(function ()
    while true do
        for id = 0, 256 do
            if GetPlayerPed( id ) ~= GetPlayerPed( -1 ) and SeeSelfTag == false then
                ped = GetPlayerPed( id )
                blip = GetBlipFromEntity( ped ) 
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))

                if(ignorePlayerNameDistance) then
					for i,l in ipairs(stringsplit(TagSuperAdmin, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(id)) then
		                        DrawTextsa3DTag(x2, y2, z2 + displayTAGHeight, "FONDA EN SERVICE")
							end
						end
			        end
					for i,l in ipairs(stringsplit(TagAdmin, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(id)) then
		                        DrawTextadmin3DTag(x2, y2, z2 + displayTAGHeight, "ADMIN EN SERVICE")
							end
						end
			        end
					for i,l in ipairs(stringsplit(TagMod, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(id)) then
		                        DrawTextmod3DTag(x2, y2, z2 + displayTAGHeight, "MODO EN SERVICE")
							end
						end
			        end
					for i,l in ipairs(stringsplit(TagHelper, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(id)) then
		                        DrawTexthelp3DTag(x2, y2, z2 + displayTAGHeight, "HELPEUR EN SERVICE")
							end
						end
			        end
				end

                if ((distance < playerNamesDist)) then
                    if not (ignorePlayerNameDistance) then
					    for i,l in ipairs(stringsplit(TagSuperAdmin, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(id)) then
		                            DrawTextsa3DTag(x2, y2, z2 + displayTAGHeight, "FONDA EN SERVICE")
							    end
						    end
			            end
						for i,l in ipairs(stringsplit(TagAdmin, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(id)) then
		                            DrawTextadmin3DTag(x2, y2, z2 + displayTAGHeight, "ADMIN EN SERVICE")
							    end
						    end
			            end
						for i,l in ipairs(stringsplit(TagMod, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(id)) then
		                            DrawTextmod3DTag(x2, y2, z2 + displayTAGHeight, "MODO EN SERVICE")
							    end
						    end
			            end
						for i,l in ipairs(stringsplit(TagHelper, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(id)) then
		                            DrawTexthelp3DTag(x2, y2, z2 + displayTAGHeight, "HELPEUR EN SERVICE")
							    end
						    end
			            end
			        end
                end  
            end
			if SeeSelfTag == true then
                ped = GetPlayerPed( id )
                blip = GetBlipFromEntity( ped ) 
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))

                if(ignorePlayerNameDistance) then
					for i,l in ipairs(stringsplit(TagSuperAdmin, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(id)) then
		                        DrawTextsa3DTag(x2, y2, z2 + displayTAGHeight, "FONDA EN SERVICE")
							end
						end
			        end
				
				    for i,l in ipairs(stringsplit(TagAdmin, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(id)) then
		                        DrawTextadmin3DTag(x2, y2, z2 + displayTAGHeight, "ADMIN EN SERVICE")
							end
						end
			        end
				
				    for i,l in ipairs(stringsplit(TagMod, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(id)) then
		                        DrawTextmod3DTag(x2, y2, z2 + displayTAGHeight, "MODO EN SERVICE")
							end
						end
			        end
				
				    for i,l in ipairs(stringsplit(TagHelper, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(id)) then
		                        DrawTexthelp3DTag(x2, y2, z2 + displayTAGHeight, "HELPEUR EN SERVICE")
							end
						end
			        end
				end

                if ((distance < playerNamesDist)) then
                    if not (ignorePlayerNameDistance) then
					    for i,l in ipairs(stringsplit(TagSuperAdmin, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(id)) then
		                            DrawTextsa3DTag(x2, y2, z2 + displayTAGHeight, "FONDA EN SERVICE")
							    end
						    end
			            end
						for i,l in ipairs(stringsplit(TagAdmin, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(id)) then
		                            DrawTextadmin3DTag(x2, y2, z2 + displayTAGHeight, "ADMIN EN SERVICE")
							    end
						    end
			            end
						for i,l in ipairs(stringsplit(TagMod, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(id)) then
		                            DrawTextmod3DTag(x2, y2, z2 + displayTAGHeight, "MODO EN SERVICE")
							    end
						    end
			            end
						for i,l in ipairs(stringsplit(TagHelper, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(id)) then
		                            DrawTexthelp3DTag(x2, y2, z2 + displayTAGHeight, "HELPEUR EN SERVICE")
							    end
						    end
			            end
			        end
                end  
            end
        end
        Citizen.Wait(0)
    end
end)



function DrawTextsa3DTag(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.7*scale, 1.2*scale)
        SetTextFont(2)
        SetTextProportional(1)
        SetTextColour(225, 0, 0, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
	    World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end


function DrawTextadmin3DTag(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.7*scale, 1.2*scale)
        SetTextFont(2)
        SetTextProportional(1)
        SetTextColour(5, 12, 107, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
	    World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

function DrawTextmod3DTag(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.7*scale, 1.2*scale)
        SetTextFont(2)
        SetTextProportional(1)
        SetTextColour(5, 81, 2, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
	    World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end


function DrawTexthelp3DTag(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.7*scale, 1.2*scale)
        SetTextFont(2)
        SetTextProportional(1)
        SetTextColour(200, 158, 46, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
	    World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
