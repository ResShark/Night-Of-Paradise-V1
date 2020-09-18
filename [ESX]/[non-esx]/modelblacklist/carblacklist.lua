-- CONFIG --

-- Blacklisted vehicle models
carblacklist = {
	"RHINO",
	"dune4",
	"dune5",
	"phantom2",
	"technical2",
	"technical3",
	--"insurgent3",
	"apc",
	"tampa3",
	"dune3",
	"trailersmall2",
	"halftrack",
	"vigilante",
	"barrage",
	"chernobog",
	"thruster",
	"khanjali",
	"volatol",
	"caracara",
	"menacer",
	"oppressor2",
	"scramjet",
	"strikeforce",
	"bruiser",
	"bruiser2",
	"bruiser3",
	"cerberus",
	"cerberus2",
	"cerberus3",
	"deathbike2",
	"deathbike3",
	"CargoPlane",
	"jet",
	"hydra",
	"titan",
	"cargobob",
	"cargoplane"
}

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(carblacklist) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			sendForbiddenMessage("Ce véhicule est sur la liste noire!")
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end