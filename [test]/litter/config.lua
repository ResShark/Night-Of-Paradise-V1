local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config              = {}
Config.OpenMenuSpawn= {x = 266.62, y = -1354.23, z = 24.53}

Config.Hash = {
	{hash = "ambulance", detection = 4.0, depth = -2.5, height = 0.5},
}

Config.Press = {
	open_menu = Keys["E"],
	take_bed = Keys["E"],
	do_action = Keys["E"],
	out_vehicle_bed = Keys["E"],
	release_bed = Keys["E"],
	in_vehicle_bed = Keys["E"],
	go_out_bed = Keys["E"],
}


Config.Language = {
	name_hospital = 'Hôpital',
	open_menu = 'Appuyez sur ~b~E',
	do_action = 'Appuyez sur ~INPUT_CONTEXT~ pour faire une action',
	take_bed = "Appuyez sur ~INPUT_CONTEXT~ pour prendre le lit",
	release_bed = "Appuyez sur ~INPUT_CONTEXT~ pour lacher le lit",
	in_vehicle_bed = "Appuyez sur ~INPUT_CONTEXT~ pour ranger le lit",
	out_vehicle_bed = "Appuyez sur ~INPUT_CONTEXT~ pour sortir le lit",
	go_out_bed = "Sortir du lit",
	delete_bed = "Supprimer Lit",
	lit_1 = "Lit sans matela",
	lit_2 = "Lit matela vert",
	lit_3 = "Lit matela bleu",
	anim = {
		spawn_command = "civiere",
		lie_back = "S'allonger sur le dos",
		sit_right = "S'asseoir à droite de la table",
		sit_left = "S'asseoir à gauche de la table",
		convulse = "Convulser",
		pls = "Être en pls",
	}
}