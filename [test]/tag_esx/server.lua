local tagonsuperadmin = {}
local tagonchecksuperadmin = {}
local superadminindex = 0 -- DONT TOUCH PLEASE!


local tagonadmin = {}
local tagoncheckadmin = {}
local adminindex = 0 -- DONT TOUCH PLEASE!


local tagonmod = {}
local tagoncheckmod = {}
local modindex = 0 -- DONT TOUCH PLEASE!


local tagonhelper = {}
local tagoncheckhelper = {}
local helperindex = 0 -- DONT TOUCH PLEASE!


RegisterServerEvent("Cheleber:SVstarttag")
AddEventHandler('Cheleber:SVstarttag', function(playerId)
    local grupos = getIdentity(source)
    if grupos.group == 'superadmin' then
	    dprint('Allowed Super Admin: ' .. playerId)
	    superadminindex = superadminindex + 1
	    tagonsuperadmin[superadminindex] = {
	        ['id'] = playerId,
	    }
	end
	local grupos = getIdentity(source)
    if grupos.group == 'admin' then
	    dprint('Allowed Admin: ' .. playerId)
	    adminindex = adminindex + 1
	    tagonadmin[adminindex] = {
	        ['id'] = playerId,
	    }
	end
	local grupos = getIdentity(source)
    if grupos.group == 'mod' then
	    dprint('Allowed Mod: ' .. playerId)
	    modindex = modindex + 1
	    tagonmod[modindex] = {
	        ['id'] = playerId,
	    }
	end
	local grupos = getIdentity(source)
    if grupos.group == 'helper' then
	    dprint('Allowed Helper: ' .. playerId)
	    helperindex = helperindex + 1
	    tagonhelper[helperindex] = {
	        ['id'] = playerId,
	    }
	end	  
	CheleberRestartTagSuperAdmin()
	CheleberRestartTagAdmin()
	CheleberRestartTagMod()
	CheleberRestartTagHelper()
end)
	
RegisterServerEvent("Cheleber:SVstarttagjoin")
AddEventHandler('Cheleber:SVstarttagjoin', function(playerId)
    local grupos = getIdentity(source)
    if grupos.group == 'superadmin' then
	    dprint('Allowed Super Admin: ' .. playerId)
	    superadminindex = superadminindex + 1
	    tagonchecksuperadmin[playerId] = true
	    tagonsuperadmin[superadminindex] = {
	        ['id'] = playerId,
	    }
	end
	local grupos = getIdentity(source)
    if grupos.group == 'admin' then
	    dprint('Allowed Admin: ' .. playerId)
	    adminindex = adminindex + 1
	    tagoncheckadmin[playerId] = true
	    tagonadmin[adminindex] = {
	        ['id'] = playerId,
	    }
	end
	local grupos = getIdentity(source)
    if grupos.group == 'mod' then
	    dprint('Allowed Mod: ' .. playerId)
	    modindex = modindex + 1
	    tagoncheckmod[playerId] = true
	    tagonmod[modindex] = {
	        ['id'] = playerId,
	    }
	end
	local grupos = getIdentity(source)
    if grupos.group == 'helper' then
	    dprint('Allowed Helper: ' .. playerId)
	    helperindex = helperindex + 1
	    tagoncheckhelper[playerId] = true
	    tagonhelper[helperindex] = {
	        ['id'] = playerId,
	    }
	end
	CheleberRestartTagSuperAdmin()
	CheleberRestartTagAdmin()
	CheleberRestartTagMod()
	CheleberRestartTagHelper()
end)


function CheleberRestartTagSuperAdmin()
    dprint('Restarting Super Admins...')
    for i = 1, #tagonsuperadmin,1 do
        if tagonchecksuperadmin[tagonsuperadmin[i].id] == true then	
    	    TriggerClientEvent("Cheleber:tagsuperadmin", -1, tagonsuperadmin[i].id, 'true')
	        dprint('SUPER ADMIN| Restarted ID: ' .. tagonsuperadmin[i].id)
        else
    	    TriggerClientEvent("Cheleber:tagsuperadmin", -1, tagonsuperadmin[i].id, 'false')
	        dprint('SUPER ADMIN| Restarted ID: ' .. tagonsuperadmin[i].id)
		end
	end
end


function CheleberRestartTagAdmin()
    dprint('Restarting Admins...')
    for i = 1, #tagonadmin,1 do
        if tagoncheckadmin[tagonadmin[i].id] == true then	
    	    TriggerClientEvent("Cheleber:tagadmin", -1, tagonadmin[i].id, 'true')
	        dprint('ADMIN| Restarted ID: ' .. tagonadmin[i].id)
        else
    	    TriggerClientEvent("Cheleber:tagadmin", -1, tagonadmin[i].id, 'false')
	        dprint('ADMIN| Restarted ID: ' .. tagonadmin[i].id)
		end
	end
end


function CheleberRestartTagMod()
    dprint('Restarting MODs...')
    for i = 1, #tagonmod,1 do
        if tagoncheckmod[tagonmod[i].id] == true then	
    	    TriggerClientEvent("Cheleber:tagmod", -1, tagonmod[i].id, 'true')
	        dprint('MOD| Restarted ID: ' .. tagonmod[i].id)
        else
    	    TriggerClientEvent("Cheleber:tagmod", -1, tagonmod[i].id, 'false')
	        dprint('MOD| Restarted ID: ' .. tagonmod[i].id)
		end
	end
end

function CheleberRestartTagHelper()
    dprint('Restarting Helpers...')
    for i = 1, #tagonhelper,1 do
        if tagoncheckhelper[tagonhelper[i].id] == true then	
    	    TriggerClientEvent("Cheleber:taghelper", -1, tagonhelper[i].id, 'true')
	        dprint('HELPER| Restarted ID: ' .. tagonhelper[i].id)
        else
    	    TriggerClientEvent("Cheleber:taghelper", -1, tagonhelper[i].id, 'false')
	        dprint('HELPER| Restarted ID: ' .. tagonhelper[i].id)
		end
	end
end

function CheleberCleanTagTable()
    dprint("Cleaning...")
    superadminindex = 0
	adminindex = 0
	modindex = 0
	helperindex = 0
	if ModoDebug then
	    for i = 1, #tagonsuperadmin,1 do
		    dprint("SUPER ADMIN| Cleaned ID: "  .. tagonsuperadmin[i].id)
	    end
		for i = 1, #tagonadmin,1 do
		    dprint("ADMIN| Cleaned ID: "  .. tagonadmin[i].id)
	    end
		for i = 1, #tagonmod,1 do
		    dprint("MOD| Cleaned ID: "  .. tagonmod[i].id)
	    end
		for i = 1, #tagonhelper,1 do
		    dprint(" HELPER| Cleaned ID: "  .. tagonhelper[i].id)
	    end
	end
	for k in pairs (tagonsuperadmin) do
        tagonsuperadmin [k] = nil
    end
	for k in pairs (tagonadmin) do
        tagonadmin [k] = nil
    end
	for k in pairs (tagonmod) do
        tagonmod [k] = nil
    end
	for k in pairs (tagonhelper) do
        tagonhelper [k] = nil
    end
	TriggerClientEvent("Cheleber:tagclean", -1)
end


AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	
	if cm[1] == "/tag" then
		CancelEvent()
		local grupos = getIdentity(source)
        if grupos.group == 'superadmin' then
	        if tagonchecksuperadmin[source] == true  then
			    tagonchecksuperadmin[source] = false
		        superadminindex = 0
			    for k in pairs (tagonsuperadmin) do
        		    tagonsuperadmin [k] = nil
    		    end
			    TriggerClientEvent("Cheleber:tagclean", -1)
				TriggerClientEvent('chatMessage', source, "Tag OFF!")
		    else
			    tagonchecksuperadmin[source] = true
			    superadminindex = 0
			    for k in pairs (tagonsuperadmin) do
        		    tagonsuperadmin [k] = nil
    		    end
			    TriggerClientEvent("Cheleber:tagclean", -1)
			    TriggerClientEvent('chatMessage', source, "Tag ON!")
			end
		end
		local grupos = getIdentity(source)
        if grupos.group == 'admin' then
	        if tagoncheckadmin[source] == true  then
			    tagoncheckadmin[source] = false
		        adminindex = 0
			    for k in pairs (tagonadmin) do
        		    tagonadmin [k] = nil
    		    end
			    TriggerClientEvent("Cheleber:tagclean", -1)
				TriggerClientEvent('chatMessage', source, "Tag OFF!")
		    else
			    tagoncheckadmin[source] = true
			    adminindex = 0
			    for k in pairs (tagonadmin) do
        		    tagonadmin [k] = nil
    		    end
			    TriggerClientEvent("Cheleber:tagclean", -1)
			    TriggerClientEvent('chatMessage', source, "Tag ON!")
			end
		end
		local grupos = getIdentity(source)
        if grupos.group == 'mod' then
	        if tagoncheckmod[source] == true  then
			    tagoncheckmod[source] = false
		        modindex = 0
			    for k in pairs (tagonmod) do
        		    tagonmod [k] = nil
    		    end
			    TriggerClientEvent("Cheleber:tagclean", -1)
				TriggerClientEvent('chatMessage', source, "Tag OFF!")
		    else
			    tagoncheckmod[source] = true
			    modindex = 0
			    for k in pairs (tagonmod) do
        		    tagonmod [k] = nil
    		    end
			    TriggerClientEvent("Cheleber:tagclean", -1)
			    TriggerClientEvent('chatMessage', source, "Tag ON!")
			end
		end
		local grupos = getIdentity(source)
        if grupos.group == 'helper' then
	        if tagoncheckhelper[source] == true  then
			    tagoncheckhelper[source] = false
		        helperindex = 0
			    for k in pairs (tagonhelper) do
        		    tagonhelper [k] = nil
    		    end
			    TriggerClientEvent("Cheleber:tagclean", -1)
				TriggerClientEvent('chatMessage', source, "Tag OFF!")
		    else
			    tagoncheckhelper[source] = true
			    helperindex = 0
			    for k in pairs (tagonhelper) do
        		    tagonhelper [k] = nil
    		    end
			    TriggerClientEvent("Cheleber:tagclean", -1)
			    TriggerClientEvent('chatMessage', source, "Tag ON!")
			end
		end
	end	
end)


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

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			name = identity['name'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			group = identity['group']
		}
	else
		return nil
	end
end

function dprint(msg)
	if ModoDebug then
		print(msg)
	end
end

---THIS CLEAN THE TABLE EVERY MINUTE, YOU CAN CHANGE THIS THIME, OPTIONAL. 
function cleantagstable()
	SetTimeout(60000, CheleberCleanTagTable)  
	SetTimeout(60000, cleantagstable) 
end

cleantagstable()