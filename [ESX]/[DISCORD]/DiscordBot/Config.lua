DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/693869804792053902/nXYwlbAM9El8cA6DUdvV0G30MktsJqq_2-D3lS66DsJ16KgcaRIcHaQrdxsS8RNBi5BM'
DiscordWebhookStart = 'https://discordapp.com/api/webhooks/693869804792053902/nXYwlbAM9El8cA6DUdvV0G30MktsJqq_2-D3lS66DsJ16KgcaRIcHaQrdxsS8RNBi5BM'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/693869629809885194/xx26y0Cuc2d9uoiSJOXfU-KAoV_qojTwJ4cYfvE_e7QsZ9hnRblwFE5qbyqoqpPeQM7Q'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/693869804792053902/nXYwlbAM9El8cA6DUdvV0G30MktsJqq_2-D3lS66DsJ16KgcaRIcHaQrdxsS8RNBi5BM'
DiscordWebhookCheat = 'https://discordapp.com/api/webhooks/668515370163896341/DZ7Oxo0AF9SnW8whV0gqDsmMywgwqz7bdAbWR4qd6bac9yh8WL9vowX9kqxZFx6AmGD6'

SystemAvatar = 'https://imgur.com/pwGA6mk'

UserAvatar = 'https://imgur.com/pwGA6mk'

SystemName = "L\'Oeil de Paradise"


--[[ Special Commands formattin
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/tweet', '**[TWITTER]:**'},
				   {'/news', '**[ANNONCE PUBLICITAIRE]:**'},
				   {'/report', '**[REPORT]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/ano', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					  {'/anontweet', 'https://discordapp.com/api/webhooks/668515134163124224/OdHRHOGAzrjwB0UrZOt4Y78drFfRJH8t0Q1YEMaoutL6S6CmfLQXd6x58t1L7TREFsNY'}
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

