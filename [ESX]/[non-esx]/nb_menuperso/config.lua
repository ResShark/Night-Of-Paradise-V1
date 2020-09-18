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
Config								= {}

--------------------------------------------------------------------------------------------
-- Config
--------------------------------------------------------------------------------------------
-- GENERAL
Config.general = {
	manettes = true,
}
-- GPS RAPIDE
Config.poleemploi = {
	x = -259.08557128906,
	y = -974.677734375,
	z = 31.220008850098,
}
Config.comico = {
	x = 430.91763305664,
	y = -980.24694824218,
	z = 31.710563659668,
}
Config.hopital = {
	x = 1150.1,
	y = -1508.12,
	z = 34.6926,
}
Config.concessionnaire = {
	x = -1128.258,
	y = -1707.619,
	z = 3.438,
}
Config.foodtruck = {
	x = -1194.7763671875,
	y = -900.59460449219,
	z = 12.99515914917,
}
Config.mecano = {
	x = -1188.34765625,
	y = -1704.0714111328,
	z = 4.4494481086731,
}
Config.sheriff = {
	x = 1853.42,
	y = 3689.48,
	z = 33.267,
}
Config.armurier = {
	x = 819.46,
	y = -2151.89,
	z = 29.61,
}
Config.banker = {
	x = 260.130,
	y = 204.308,
	z = 109.287,
}

Config.brinks = {
	x = 243.419,
	y = 230.293,
	z = 106.286,
}

Config.bus = {
	x = 434.826,
	y = -647.408,
	z = 28.735,
}

Config.chasse = {
	x = -1492.2,
	y = 4971.5,
	z = 64.2,
}

Config.donateurshop = {
	x = -3120.512,
	y = 1751.851,
	z = 33.450,
}

Config.journaliste = {
	x = 498.639,
	y = 5476.638,
	z = 757.813,
}

Config.motoshop = {
	x = -33.777,
	y = -1102.021,
	z = 25.422,
}

-- Ouvrir le menu perso
Config.menuperso = {
	clavier = Keys["F5"],
	manette1 = Keys["F5"],
	manette2 = Keys["F5"],
}
-- Ouvrir le menu job
Config.menujob = {
	clavier = Keys["F6"],
	manette1 = Keys[""],
	manette2 = Keys[""],
}
-- TP sur le Marker
Config.TPMarker = {
	clavier1 = Keys["LEFTSHIFT"],
	clavier2 = Keys["E"],
	manette1 = Keys["LEFTSHIFT"],
	manette2 = Keys["E"],
}
-- Lever les mains
Config.handsUP = {
	clavier = Keys["X"],
	manette1 = Keys["X"],
	manette2 = Keys["X"],
}
-- Pointer du doight
Config.pointing = {
	clavier = Keys["B"],
	manette = Keys["B"],
}
-- S'acroupir
Config.crouch = {
	clavier = Keys["LEFTCTRL"],
	manette = Keys["LEFTCTRL"],
}