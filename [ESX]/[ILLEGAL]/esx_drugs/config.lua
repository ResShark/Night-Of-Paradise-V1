Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 8.0, y = 8.0, z = 3.0}
-- Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.ShowBlips   = false  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopsCoke  = 1
Config.RequiredCopsMeth  = 1
Config.RequiredCopsWeed  = 1
Config.RequiredCopsOpium = 0

Config.TimeToFarm    = 3 * 850
Config.TimeToProcess = 3 * 850
Config.TimeToSell    = 3 * 850

Config.Locale = 'fr'

Config.Zones = {
	CokeField =			{x = 530.20,	y = 1899.44,	z = 32.46,	name = _U('coke_field'),		sprite = 501,	color = 40},
	CokeProcessing =	{x = 1194.15,	y = 2721.90,	z = 37.62,	name = _U('coke_processing'),	sprite = 478,	color = 40},
	CokeDealer =		{x = -1034.71,	y = -1146.95,	z = 1.15,	name = _U('coke_dealer'),		sprite = 500,	color = 75},
	MethField =			{x = -17.06,	y = -1430.48,	z = 30.10,	name = _U('meth_field'),		sprite = 499,	color = 26},
	MethProcessing =	{x = 1389.30,	y = 3604.76,	z = 37.94,	name = _U('meth_processing'),	sprite = 499,	color = 26},
	MethDealer =		{x = -1116.91,	y = -502.86,	z = 34.80,	name = _U('meth_dealer'),		sprite = 500,	color = 75},
	WeedField =		    {x = 429.31,	y = 6472.03,	z = 34.86,	name = _U('weed_field'),		sprite = 496,	color = 52},
	WeedProcessing =	{x = 2432.38,	y = 4971.88,	z = 42.34,	name = _U('weed_processing'),	sprite = 496,	color = 52},
	WeedDealer =		{x = 244.73,	y = 374.23,		z = 105.73,	name = _U('weed_dealer'),		sprite = 500,	color = 75}
--	OpiumField =		{x = 1122.71,	y = -3194.5,	z = -41.39,	name = _U('opium_field'),		sprite = 51,	color = 60},
--	OpiumProcessing =	{x = -475.12,	y = 6288.06,	z = 12.67,	name = _U('opium_processing'),	sprite = 51,	color = 60},
--	OpiumDealer =		{x = -1001.42,	y = 4847.92,	z = 274.07,	name = _U('opium_dealer'),		sprite = 500,	color = 75}
}

---------------------------------
--- Copyright by ikNox#6088 ---
---------------------------------
