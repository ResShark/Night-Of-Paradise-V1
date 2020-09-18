Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 42

Config.Recipes = {
	-- Can be a normal ESX item
	["lockpick"] = { 
		{item = "bobbypin", quantity = 4 }, 
		{item = "rubberband", quantity = 1 },
	},
	--mitrailette

	["WEAPON_MICROSMG"] = { 
		{item = "iron", quantity = 4 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	["WEAPON_SMG"] = { 
		{item = "iron", quantity = 4 },
		{item = "copper", quantity = 2 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	["WEAPON_MACHINEPISTOL"] = { 
		{item = "iron", quantity = 4 },
		{item = "copper", quantity = 3 }, 
		--{item = "gunpowder", quantity = 6 },
	},

	["WEAPON_MINISMG"] = { 
		{item = "iron", quantity = 4 },
		{item = "copper", quantity = 4 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	["WEAPON_ASSAULTSMG"] = { 
		{item = "iron", quantity = 6 },
		{item = "copper", quantity = 3 }, 
		--{item = "gunpowder", quantity = 1 },
	},
	-- FUSIL D'ASSAULT
	['WEAPON_ASSAULTRIFLE'] = { 
		{item = "copper", quantity = 4 },
		{item = "iron", quantity = 10 }, 
		--{item = "gunpowder", quantity = 2 },
	},

	['WEAPON_BULLPUPRIFLE'] = {
		{item = "iron", quantity = 9 },
		{item = "copper", quantity = 3 },
		--{item = "gunpowder", quantity = 9 },
	},

	["WEAPON_ADVANCEDRIFLE"] = { 
		{item = "iron", quantity = 10 },
		{item = "copper", quantity = 8 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	["WEAPON_CARBINERIFLE"] = { 
		{item = "iron", quantity = 10 },
		{item = "copper", quantity = 9 }, 
		--{item = "gunpowder", quantity = 9 },
	},

	-- BATEUSE

	["WEAPON_GUSENBERG"] = { 
		{item = "iron", quantity = 20 },
		{item = "copper", quantity = 8 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	-- SNIPER

	["WEAPON_SNIPERRIFLE"] = { 
		{item = "iron", quantity = 25 },
		{item = "copper", quantity = 8 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	["WEAPON_HEAVYSNIPER"] = { 
		{item = "iron", quantity = 30 },
		{item = "copper", quantity = 8 }, 
		--{item = "gunpowder", quantity = 20 },
	},

	["WEAPON_MARKSMANRIFLE"] = { 
		{item = "iron", quantity = 10 },
		{item = "copper", quantity = 20 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	-- FUSIL A POMPE

	["WEAPON_PUMPSHOTGUN"] = { 
		{item = "iron", quantity = 19 },
		{item = "copper", quantity = 8 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	["WEAPON_HEAVYSHOTGUN"] = { 
		{item = "iron", quantity = 20 },
		{item = "copper", quantity = 7 }, 
		--{item = "gunpowder", quantity = 1 },
	},

	["WEAPON_DBSHOTGUN"] = { 
		{item = "iron", quantity = 10 },
		{item = "copper", quantity = 12 }, 
		--{item = "gunpowder", quantity = 17 },
	},









}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true,
	shopCoordinates = { x=829.52, y=2958.78, z=30.65 },
	shopName = "Crafting Station",
	--shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
