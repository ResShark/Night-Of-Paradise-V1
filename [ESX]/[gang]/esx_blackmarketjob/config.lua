Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 239, g = 224, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

--Config.CircleZones = {
    --DrugDealer = {coords = vector3(329.95, -2036.40, 20.96), name = _U('map_blip'), color = 46, sprite = 84, radius = 110.0},
--}

Config.BlackStations = {
  Black = {

    AuthorizedWeapons = {
      --{ name = 'WEAPON_COMBATPISTOL',     price = 4000 },
      --{ name = 'WEAPON_ASSAULTSMG',       price = 15000 },
      --{ name = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
      -- { name = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      -- { name = 'WEAPON_STUNGUN',          price = 250 },
      --{ name = 'WEAPON_FLASHLIGHT',       price = 50 },
      --{ name = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      -- { name = 'WEAPON_FLAREGUN',         price = 3000 },
     -- { name = 'GADGET_PARACHUTE',        price = 2000 },
      -- { name = 'WEAPON_SNIPERRIFLE',      price = 50000 },
      -- { name = 'WEAPON_FIREWORK',         price = 5000 },
      -- { name = 'WEAPON_BZGAS',            price = 8000 },
      -- { name = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      --{ name = 'WEAPON_APPISTOL',         price = 12000 },
     -- { name = 'WEAPON_CARBINERIFLE',     price = 25000 },
      -- { name = 'WEAPON_HEAVYSNIPER',      price = 100000 },
     -- { name = 'WEAPON_FLARE',            price = 8000 },
     -- { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	  --{ name = 'WEAPON_REVOLVER',         price = 6000 },
	 -- { name = 'WEAPON_POOLCUE',          price = 100 },
	  -- { name = 'WEAPON_GUSENBERG',        price = 17500 },
	  
    },

	  AuthorizedVehicles = {
		  { name = 'CLS53',      label = 'Merco' },
		  { name = 'rrst',  label = 'Range-Rover' },
	  },

    Cloakrooms = {
      { x = 991.38, y = 2889.97, z = 31.12 }, -- fait
    },

    Armories = {
      { x = 987.18, y = 2924.40, z = 31.12 }, -- fait
    },

    Vehicles = {
      {
        Spawner    = { x = -771.15, y = 5930.92, z = 20.77 }, -- fait
        SpawnPoint = { x = -764.52, y = 5930.16, z = 20.39 }, -- fait
        Heading    = 284.937, -- fait
      }
    },

    VehicleDeleters = {
      { x = -769.41, y = 5925.00, z = 20.61 }, -- fait
    },

    BossActions = {
      { x = 975.92, y = 2912.07, z = 31.10 } -- fait
    },

  },

}