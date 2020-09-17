Config                        = {}
Config.Locale = 'fr'
Config.green 				  = 56108
Config.grey 				  = 8421504
Config.red 					  = 16711680
Config.orange 				  = 16744192
Config.blue 				  = 2061822
Config.purple 				  = 11750815
Config.webhook                = "https://discordapp.com/api/webhooks/693869804792053902/nXYwlbAM9El8cA6DUdvV0G30MktsJqq_2-D3lS66DsJ16KgcaRIcHaQrdxsS8RNBi5BM"
Config.webhookadmin           = "https://discordapp.com/api/webhooks/693869804792053902/nXYwlbAM9El8cA6DUdvV0G30MktsJqq_2-D3lS66DsJ16KgcaRIcHaQrdxsS8RNBi5BM"


settings = {
	LogKills = false, -- Log when a player kill an other player.
	LogEnterPoliceVehicle = false, -- Log when an player enter in a police vehicle.
	LogEnterBlackListedVehicle = true, -- Log when a player enter in a blacklisted vehicle.
	LogPedJacking = false, -- Log when a player is jacking a car
	LogChatServer = true, -- Log when a player is talking in the chat , /command works too.
	LogLoginServer = false, -- Log when a player is connecting/disconnecting to the server.
	LogItemTransfer = false, -- Log when a player is giving an item.
	LogWeaponTransfer = true, -- Log when a player is giving a weapon.
	LogMoneyTransfer = true, -- Log when a player is giving money
	LogMoneyBankTransfert = false, -- Log when a player is giving money from bankaccount
	LogAdminMoneyTransfer = true, -- Log Admin Give Money
}



blacklistedModels = {
	"APC",
	"BARRACKS",
	"BARRACKS2",
	"RHINO",
	"CRUSADER",
	"CARGOBOB",
	"SAVAGE",
	"TITAN",
	"LAZER",
	"LAZER",
}
