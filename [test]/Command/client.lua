RegisterNetEvent('showHelp');
RegisterNetEvent('showCommands');
RegisterNetEvent('showRules');


AddEventHandler('showHelp', function()
	ped = GetPlayerPed(-1);
	
	if ped then
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0--------AIDE--------");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Pour voir les régles du serveur faites /rules");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Pour voir les commandes du serveur faite /commands");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Pour signalez un joueur ou un bug faite /report (suivi de votre message)");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Pour toutes autres demande d'aide merci de rejoindre le discord");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Voici le lien discord : https://discord.gg/mn472dA");
	end
end)

AddEventHandler('showCommands', function()
	ped = GetPlayerPed(-1);
	
	if ped then
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0--------COMMANDES--------");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Pour parler en RP faite /tweet");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Pour parler en HRP faite /ooc");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Pour parler en annonyme faite /anontweet");
		
	end
end)

AddEventHandler('showRules', function()
	ped = GetPlayerPed(-1);
	
	if ped then
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0--------REGLES--------");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Ne pas freekill");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Ne pas carkill");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Interdiction d'utilisé toute forme de triche");
		TriggerEvent('chatMessage', "^3Server", {255, 0, 0}, "^0Retrouvez l'intéglaité des regles sur le discord");
	end
end)



