ESX                 = nil
Jobs                = {}
RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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

function GetSociety(name)
	for i=1, #RegisteredSocieties, 1 do
		if RegisteredSocieties[i].name == name then
			return RegisteredSocieties[i]
		end
	end
end

AddEventHandler('esx_society:getSociety', function(name, cb)
	cb(GetSociety(name))
end)

AddEventHandler('onMySQLReady', function()

	local result = MySQL.Sync.fetchAll('SELECT * FROM jobs', {})

	for i=1, #result, 1 do
		Jobs[result[i].name]        = result[i]
		Jobs[result[i].name].grades = {}
	end

	local result2 = MySQL.Sync.fetchAll('SELECT * FROM job_grades', {})

	for i=1, #result2, 1 do
		Jobs[result2[i].job_name].grades[tostring(result2[i].grade)] = result2[i]
	end

end)

AddEventHandler('esx_society:registerSociety', function(name, label, account, datastore, inventory, data)

  local found = false

  local society = {
    name      = name,
    label     = label,
    account   = account,
    datastore = datastore,
    inventory = inventory,
    data      = data,
  }

  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      found                  = true
      RegisteredSocieties[i] = society
      break
    end
  end

  if not found then
    table.insert(RegisteredSocieties, society)
  end

end)

AddEventHandler('esx_society:getSocieties', function(cb)
  cb(RegisteredSocieties)
end)

AddEventHandler('esx_society:getSocieties', function(cb)

	MySQL.Async.fetchAll(
		'SELECT * FROM addon_account WHERE name LIKE "%society_%"',
		{},
		function(results)

			local societies = {}

			for i=1, #results, 1 do

				local buff    = stringsplit(results[i].name, '_')
				local society = buff[2]

				table.insert(societies, {
					name  = society,
					label = results[i].label
				})

			end

			cb(societies)

		end
	)

end)

RegisterServerEvent('esx_society:withdrawMoney')
AddEventHandler('esx_society:withdrawMoney', function(society, amount)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)

		if amount > 0 and account.money >= amount then

			account.removeMoney(amount)
			xPlayer.addMoney(amount)

			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', ESX.Math.GroupDigits(amount)))

		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end

	end)

end)

RegisterServerEvent('esx_society:depositMoney')
AddEventHandler('esx_society:depositMoney', function(society, amount)

	local xPlayer = ESX.GetPlayerFromId(source)

	if amount > 0 and xPlayer.get('money') >= amount then

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)
			xPlayer.removeMoney(amount)
			account.addMoney(amount)
		end)

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', ESX.Math.GroupDigits(amount)))

	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	end

end)

--RegisterServerEvent('esx_society:washMoney')
--AddEventHandler('esx_society:washMoney', function(society, amount)

	--local xPlayer = ESX.GetPlayerFromId(source)
	--local account = xPlayer.getAccount('black_money')
	
		--if amount and amount > 0 and account.money >= amount then
		--local howlong	= 15
		--local xtime 	= 60 -- si 1 = alors le nombre ci-dessus sera en SECONDES. si 60 = en MINUTES
		--local minorsec	= ''
		--if xtime == 1 then
		-- minorsec = ' secondes'
		--elseif xtime == 60 then
		--minorsec = ' minutes'
		--end
		
		--xPlayer.removeAccountMoney('black_money', amount)
		--TriggerClientEvent('esx:showNotification', xPlayer.source, ('Tu as ~g~$' .. ESX.Math.GroupDigits(amount) .. '~s~ en attente de ~y~blanchiment d\'argent~s~ (' .. howlong .. minorsec .. ').'))
		--Citizen.Wait(1000 * xtime * howlong)
		--xPlayer.addMoney(amount)
		--TriggerClientEvent('esx:showNotification', xPlayer.source, ('~p~Bravo!!~s~ ~g~$' .. ESX.Math.GroupDigits(amount) .. '~s~ on été ~y~Blanchi~s~ et mis dans votre ~b~poche~s~'))

	--else
		--TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	--end

--end)

RegisterServerEvent('esx_society:putVehicleInGarage')
AddEventHandler('esx_society:putVehicleInGarage', function(society, vehicle)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. society, function(store)
		local garage = store.get('garage') or {}
		table.insert(garage, vehicle)
		store.set('garage', garage)
	end)

end)

RegisterServerEvent('esx_society:removeVehicleFromGarage')
AddEventHandler('esx_society:removeVehicleFromGarage', function(society, vehicle)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. society, function(store)
		
		local garage = store.get('garage') or {}

		for i=1, #garage, 1 do
			if garage[i].plate == vehicle.plate then
				table.remove(garage, i)
				break
			end
		end

		store.set('garage', garage)

	end)

end)

ESX.RegisterServerCallback('esx_society:getSocietyMoney', function(source, cb, societyName)

  local society = GetSociety(societyName)

  if society ~= nil then

    TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
      cb(account.money)
    end)

  else
    cb(0)
  end

end)

ESX.RegisterServerCallback('esx_society:getAccountMoney', function(source, cb, account)
	TriggerEvent('esx_addonaccount:getSharedAccount', account, function(account)
		cb(account.money)
	end)
end)

ESX.RegisterServerCallback('esx_society:getEmployees', function(source, cb, society)

	MySQL.Async.fetchAll(
		'SELECT * FROM users WHERE job = @job ORDER BY job_grade DESC',
		{
			['@job'] = society
		},
		function(result)

			local employees = {}

			for i=1, #result, 1 do

				table.insert(employees, {
					name        = result[i].name,
					identifier  = result[i].identifier,
					job = {
						name        = result[i].job,
						label       = Jobs[result[i].job].label,
						grade       = result[i].job_grade,
						grade_name  = Jobs[result[i].job].grades[tostring(result[i].job_grade)].name,
						grade_label = Jobs[result[i].job].grades[tostring(result[i].job_grade)].label,
					}
				})
			end

			cb(employees)

		end
	)

end)

ESX.RegisterServerCallback('esx_society:getEmployees2', function(source, cb, society)

  if Config.EnableESXIdentity then
    MySQL.Async.fetchAll(
      'SELECT * FROM users WHERE job2 = @job2 ORDER BY job2_grade DESC',
      { ['@job2'] = society },
      function (results)
        local employees = {}

        for i=1, #results, 1 do
          table.insert(employees, {
            name        = results[i].firstname .. ' ' .. results[i].lastname,
            identifier  = results[i].identifier,
            job2 = {
              name        = results[i].job2,
              label       = Jobs[results[i].job2].label,
              grade       = results[i].job2_grade,
              grade_name  = Jobs[results[i].job2].grades[tostring(results[i].job2_grade)].name,
              grade_label = Jobs[results[i].job2].grades[tostring(results[i].job2_grade)].label,
            }
          })
        end

        cb(employees)
      end
    )
  else
    MySQL.Async.fetchAll(
      'SELECT * FROM users WHERE job2 = @job2 ORDER BY job2_grade DESC',
      { ['@job2'] = society },
      function (result)
        local employees = {}

        for i=1, #result, 1 do
          table.insert(employees, {
            name        = result[i].name,
            identifier  = result[i].identifier,
            job2 = {
              name        = result[i].job2,
              label       = Jobs[result[i].job2].label,
              grade       = result[i].job2_grade,
              grade_name  = Jobs[result[i].job2].grades[tostring(result[i].job2_grade)].name,
              grade_label = Jobs[result[i].job2].grades[tostring(result[i].job2_grade)].label,
            }
          })
        end

        cb(employees)
      end
    )
  end
end)

ESX.RegisterServerCallback('esx_society:getEmployees3', function(source, cb, society)

  if Config.EnableESXIdentity then
    MySQL.Async.fetchAll(
      'SELECT * FROM users WHERE job3 = @job3 ORDER BY job3_grade DESC',
      { ['@job3'] = society },
      function (results)
        local employees = {}

        for i=1, #results, 1 do
          table.insert(employees, {
              name        = results[i].firstname .. ' ' .. results[i].lastname,
              identifier  = results[i].identifier,
			  job3 = {
              name        = results[i].job3,
              label       = Jobs[results[i].job3].label,
              grade       = results[i].job3_grade,
              grade_name  = Jobs[results[i].job3].grades[tostring(results[i].job3_grade)].name,
              grade_label = Jobs[results[i].job3].grades[tostring(results[i].job3_grade)].label,
            }
          })
        end

        cb(employees)
      end
    )
  else
    MySQL.Async.fetchAll(
      'SELECT * FROM users WHERE job3 = @job3 ORDER BY job3_grade DESC',
      { ['@job3'] = society },
      function (result)
        local employees = {}

        for i=1, #result, 1 do
          table.insert(employees, {
              name        = result[i].name,
              identifier  = result[i].identifier,
              job3 = {
              name        = result[i].job3,
              label       = Jobs[result[i].job3].label,
              grade       = result[i].job3_grade,
              grade_name  = Jobs[result[i].job3].grades[tostring(result[i].job3_grade)].name,
              grade_label = Jobs[result[i].job3].grades[tostring(result[i].job3_grade)].label,
            }
          })
        end

        cb(employees)
      end
    )
  end
end)

ESX.RegisterServerCallback('esx_society:getJob', function(source, cb, society)

	local job    = json.decode(json.encode(Jobs[society]))
	local grades = {}

	for k,v in pairs(job.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job.grades = grades

	cb(job)

end)

ESX.RegisterServerCallback('esx_society:getJob2', function(source, cb, society)

  local job2    = json.decode(json.encode(Jobs[society]))
  local grades = {}

  for k,v in pairs(job2.grades) do
    table.insert(grades, v)
  end

  table.sort(grades, function(a, b)
    return a.grade < b.grade
  end)

  job2.grades = grades

  cb(job2)

end)

ESX.RegisterServerCallback('esx_society:getJob3', function(source, cb, society)

  local job3    = json.decode(json.encode(Jobs[society]))
  local grades = {}

  for k,v in pairs(job3.grades) do
    table.insert(grades, v)
  end

  table.sort(grades, function(a, b)
    return a.grade < b.grade
  end)

  job3.grades = grades

  cb(job3)

end)

ESX.RegisterServerCallback('esx_society:setJob', function(source, cb, identifier, job, grade, type)

	local xPlayer = ESX.GetPlayerFromIdentifier(identifier)

	if type == 'hire' then
  	TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_hired', job))
	elseif type == 'promote' then
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_promoted'))
	elseif type == 'fire' then
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_fired', xPlayer.getJob().label))
	end

	if xPlayer ~= nil then
		xPlayer.setJob(job, grade)
	end

	MySQL.Async.execute(
		'UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier',
		{
			['@job']        = job,
			['@job_grade']  = grade,
			['@identifier'] = identifier
		},
		function(rowsChanged)
			cb()
		end
	)

end)

ESX.RegisterServerCallback('esx_society:setJob2', function(source, cb, identifier, job2, grade2, type)

	local xPlayer = ESX.GetPlayerFromIdentifier(identifier)

	if xPlayer ~= nil then
		xPlayer.setJob2(job2, grade2)
		
		if type == 'hire' then
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_hired', job2))
		elseif type == 'promote' then
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_promoted'))
		elseif type == 'fire' then
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_fired', xPlayer.getJob2().label))
		end
	end

	MySQL.Async.execute(
		'UPDATE users SET job2 = @job2, job2_grade = @job2_grade WHERE identifier = @identifier',
		{
			['@job2']        = job2,
			['@job2_grade']  = grade2,
			['@identifier'] = identifier
		},
		function(rowsChanged)
			cb()
		end
	)

end)

ESX.RegisterServerCallback('esx_society:setJob3', function(source, cb, identifier, job3, grade3, type)

	local xPlayer = ESX.GetPlayerFromIdentifier(identifier)

	if xPlayer ~= nil then
		xPlayer.setJob3(job3, grade3)
		
		if type == 'hire' then
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_hired', job3))
		elseif type == 'promote' then
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_promoted'))
		elseif type == 'fire' then
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_fired', xPlayer.getJob3().label))
		end
	end

	MySQL.Async.execute(
		'UPDATE users SET job3 = @job3, job3_grade = @job3_grade WHERE identifier = @identifier',
		{
			['@job3']        = job3,
			['@job3_grade']  = grade3,
			['@identifier'] = identifier
		},
		function(rowsChanged)
			cb()
		end
	)

end)

ESX.RegisterServerCallback('esx_society:setJobSalary', function(source, cb, job, grade, salary)

	MySQL.Async.execute(
		'UPDATE job_grades SET salary = @salary WHERE job_name = @job_name AND grade = @grade',
		{
			['@salary']   = salary,
			['@job_name'] = job,
			['@grade']    = grade
		},
		function(rowsChanged)

			Jobs[job].grades[tostring(grade)].salary = salary

			local xPlayers = ESX.GetPlayers()

			for i=1, #xPlayers, 1 do

				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

				if xPlayer.job.name == job and xPlayer.job.grade == grade then
					xPlayer.setJob(job, grade)
				end

			end

			cb()
		end
	)

end)

ESX.RegisterServerCallback('esx_society:setJobSalary2', function(source, cb, job2, grade2, salary)

  MySQL.Async.execute(
    'UPDATE job2_grades SET salary = @salary WHERE job2_name = @job2_name AND grade2 = @grade',
    {
      ['@salary']   = salary,
      ['@job2_name'] = job2,
      ['@grade']    = grade2
    },
    function(rowsChanged)

      Jobs[job2].grades[tostring(grade2)].salary = salary

      local xPlayers = ESX.GetPlayers()

      for i=1, #xPlayers, 1 do

        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job2.name == job2 and xPlayer.job2.grade == grade2 then
          xPlayer.setJob2(job2, grade2)
        end

      end

      cb()
    end
  )

end)

ESX.RegisterServerCallback('esx_society:setJobSalary3', function(source, cb, job3, grade3, salary)

  MySQL.Async.execute(
    'UPDATE job3_grades SET salary = @salary WHERE job3_name = @job3_name AND grade3 = @grade',
    {
      ['@salary']   = salary,
      ['@job3_name'] = job3,
      ['@grade']    = grade3
    },
    function(rowsChanged)

      Jobs[job3].grades[tostring(grade3)].salary = salary

      local xPlayers = ESX.GetPlayers()

      for i=1, #xPlayers, 1 do

        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job3.name == job3 and xPlayer.job3.grade == grade3 then
          xPlayer.setJob3(job3, grade3)
        end

      end

      cb()
    end
  )

end)

ESX.RegisterServerCallback('esx_society:getOnlinePlayers', function(source, cb)

	local xPlayers = ESX.GetPlayers()
	local players  = {}

	for i=1, #xPlayers, 1 do

		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		table.insert(players, {
			source     = xPlayer.source,
			identifier = xPlayer.identifier,
			name       = xPlayer.name,
			job        = xPlayer.job
		})

	end

	cb(players)

end)

ESX.RegisterServerCallback('esx_society:getOnlinePlayers2', function(source, cb)

  local xPlayers = ESX.GetPlayers()
  local players  = {}

  for i=1, #xPlayers, 1 do

    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

    table.insert(players, {
      source     = xPlayer.source,
      identifier = xPlayer.identifier,
      name       = xPlayer.name,
      job2       = xPlayer.job2
    })

  end

  cb(players)

end)

ESX.RegisterServerCallback('esx_society:getOnlinePlayers3', function(source, cb)

  local xPlayers = ESX.GetPlayers()
  local players  = {}

  for i=1, #xPlayers, 1 do

    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

    table.insert(players, {
      source     = xPlayer.source,
      identifier = xPlayer.identifier,
      name       = xPlayer.name,
      job3       = xPlayer.job3
    })

  end

  cb(players)

end)

ESX.RegisterServerCallback('esx_society:getVehiclesInGarage', function(source, cb, society)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. society, function(store)
		local garage = store.get('garage') or {}
		cb(garage)
	end)

end)

function WashMoneyCRON(d, h, m)
	print('WASHING SOCIETIES MONEY')
	MySQL.Async.fetchAll(
		'SELECT * FROM society_moneywash WHERE `payed` = 0',
		{},
		function(result)

			local xPlayers = ESX.GetPlayers()

			for i=1, #result, 1 do

				local foundPlayer = false
				local xPlayer     = nil

				for j=1, #xPlayers, 1 do
					local xPlayer2 = ESX.GetPlayerFromId(xPlayers[j])
					if xPlayer2.identifier == result[i].identifier then
						foundPlayer = true
						xPlayer     = xPlayer2
					end
				end

				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. result[i].society, function(account)
					account.addMoney(result[i].amount)
				end)

				if foundPlayer then
					TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_laundered') .. result[i].amount)
				end

				MySQL.Async.execute(
					'UPDATE society_moneywash SET `payed` = 1 WHERE id = @id',
					{
						['@id'] = result[i].id
					}
				)

			end
			
			print('SOCIETIES MONEY WASHED')

		end
	)

end

RegisterServerEvent('esx_society:getStockItem')
AddEventHandler('esx_society:getStockItem', function(itemName, count,society)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'.. society ..'', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_society:getStockItems', function(source, cb,society)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society'.. society ..'', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('esx_society:putStockItems')
AddEventHandler('esx_society:putStockItems', function(itemName, count,society)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'.. society ..'', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_society:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)
