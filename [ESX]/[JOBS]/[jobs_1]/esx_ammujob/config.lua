Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 21
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 0, g = 255, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'en'

Config.AmmuStations = {

  Ammu = {

    Blip = {
      Pos     = { x = 20.87, y = -1107.72, z = 29.79 },
      Sprite  = 159,
      Display = 8,
      Scale   = 1.4,
      Colour  = 11,
    },

    AuthorizedWeapons = {
-- Define prices of the weapons.
		{name  = "gadget_parachute", 		price = 0 },
        {name  = "WEAPON_FLASHLIGHT", 		price = 0 },
	    {name  = "WEAPON_HAMMER", 			price = 0 },
		{name  = "WEAPON_CROWBAR", 			price = 0 },
		{name  = "WEAPON_HATCHET", 			price = 0 },
        {name  = "WEAPON_BAT", 				price = 0 },
		{name  = "WEAPON_KNUCKLE", 			price = 0 },
		{name  = "WEAPON_KNIFE", 			price = 0 },
		{name  = "WEAPON_SWITCHBLADE", 		price = 0 },
		{name  = "WEAPON_GOLFCLUB", 		price = 0 },
		{name  = "WEAPON_MACHETE", 			price = 0 },
		{name  = "WEAPON_PISTOL", 			price = 0 },
		{name  = "WEAPON_SNSPISTOL", 		price = 0 },
		{name  = "WEAPON_COMBATPISTOL", 	price = 0 },
		{name  = "WEAPON_HEAVYPISTOL", 		price = 0 },
		{name  = "WEAPON_PISTOL50", 		price = 0 }
    },

	  AuthorizedVehicles = {
		  { name = 'osiris',  label = 'Osiris' },
		  { name = 'patriot',    label = 'Patriot' },
		  { name = '9f',      label = '9F' },
		  { name = 'vacca',   label = 'Vacca' },
	  },

    Armories = {
      { x = 16.85, y = -1110.37, z = 28.79 },
    },

    Cloakrooms = {
   --   { x = 1172.7686767575, y = 2636.0771484375, z = 36.78857421875},
    },
  
  
    Vehicles = {
      {
        Spawner    = { x = -809.12, y = 190.31, z = 72.48 },
        SpawnPoint = { x = -824.14, y = 181.44, z = 71.68 },
        Heading    = 150.36,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 113.30500793457, y = -3109.3337402344, z = 6.0060696601868 },
        SpawnPoint = { x = 112.94457244873, y = -3102.5942382813, z = 6.0050659179688 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = -810.89, y = 187.79, z = 72.48 },
      
    },

    BossActions = {
      { x = 13.02, y = -1101.48, z = 28.79 },
    },

  },

}
