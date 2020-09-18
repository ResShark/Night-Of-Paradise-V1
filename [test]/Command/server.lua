AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/help" then
		CancelEvent();
		TriggerClientEvent('showHelp', source);
	elseif msg == "/commands" then
		CancelEvent();
		TriggerClientEvent('showCommands', source);
	elseif msg == "/rules" then
		CancelEvent();
		TriggerClientEvent('showRules', source);
--	elseif msg == "/test" then              -- you can add more in this just copy and paste
--		CancelEvent();
--		TriggerClientEvent('showInfo', source);
	end
end)
