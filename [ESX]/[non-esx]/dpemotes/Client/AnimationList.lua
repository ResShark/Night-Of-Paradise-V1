DP = {}

DP.Expressions = {
   ["Fâché"] = {"Expression", "mood_angry_1"},
   ["Ivre"] = {"Expression", "mood_drunk_1"},
   ["Muet"] = {"Expression", "pose_injured_1"},
   ["Électrocuté"] = {"Expression", "electrocuted_1"},
   ["Grincheux"] = {"Expression", "effort_1"},
   ["Grincheux2"] = {"Expression", "mood_drivefast_1"},
   ["Grincheux3"] = {"Expression", "pose_angry_1"},
   ["Content"] = {"Expression", "mood_happy_1"},
   ["Blessé"] = {"Expression", "mood_injured_1"},
   ["Joyeux"] = {"Expression", "mood_dancing_low_1"},
   ["Bouche Ouverte"] = {"Expression", "smoking_hold_1"},
   ["Yeux Ouvert"] = {"Expression", "pose_normal_1"},
   ["Un œil"] = {"Expression", "pose_aiming_1"},
   ["Choqué"] = {"Expression", "shocked_1"},
   ["Choqué2"] = {"Expression", "shocked_2"},
   ["Dormir"] = {"Expression", "mood_sleeping_1"},
   ["Dormir2"] = {"Expression", "dead_1"},
   ["Dormir3"] = {"Expression", "dead_2"},
   ["Suffisant"] = {"Expression", "mood_smug_1"},
   ["Spéculative"] = {"Expression", "mood_aiming_1"},
   ["Stressé"] = {"Expression", "mood_stressed_1"},
   ["Bouder"] = {"Expression", "mood_sulk_1"},
   ["Bizarre"] = {"Expression", "effort_2"},
   ["Bizarre2"] = {"Expression", "effort_3"},
}

DP.Walks = {
  ["Alien"] = {"move_m@alien"},
  ["Blindés"] = {"anim_group_move_ballistic"},
  ["Arrogant"] = {"move_f@arrogant@a"},
  ["Brave"] = {"move_m@brave"},
  ["Casual"] = {"move_m@casual@a"},
  ["Casual2"] = {"move_m@casual@b"},
  ["Casual3"] = {"move_m@casual@c"},
  ["Casual4"] = {"move_m@casual@d"},
  ["Casual5"] = {"move_m@casual@e"},
  ["Casual6"] = {"move_m@casual@f"},
  ["Chichi"] = {"move_f@chichi"},
  ["Confident"] = {"move_m@confident"},
  ["Bon flic"] = {"move_m@business@a"},
  ["Bon flic2"] = {"move_m@business@b"},
  ["Bon flic3"] = {"move_m@business@c"},
  ["Ivre"] = {"move_m@drunk@a"},
  ["Bourré"] = {"move_m@drunk@slightlydrunk"},
  ["Bourré2"] = {"move_m@buzzed"},
  ["Bourré3"] = {"move_m@drunk@verydrunk"},
  ["Femme"] = {"move_f@femme@"},
  ["Feu"] = {"move_characters@franklin@fire"},
  ["Feu2"] = {"move_characters@michael@fire"},
  ["Feu3"] = {"move_m@fire"},
  ["Fuir"] = {"move_f@flee@a"},
  ["Franklin"] = {"move_p_m_one"},
  ["Gangster"] = {"move_m@gangster@generic"},
  ["Gangster2"] = {"move_m@gangster@ng"},
  ["Gangster3"] = {"move_m@gangster@var_e"},
  ["Gangster4"] = {"move_m@gangster@var_f"},
  ["Gangster5"] = {"move_m@gangster@var_i"},
  ["Ambiencé"] = {"anim@move_m@grooving@"},
  ["Garde"] = {"move_m@prison_gaurd"},
  ["Menotté"] = {"move_m@prisoner_cuffed"},
  ["Talons"] = {"move_f@heels@c"},
  ["Talons2"] = {"move_f@heels@d"},
  ["Hipster"] = {"move_m@hipster@a"},
  ["Hobo"] = {"move_m@hobo@a"},
  ["Dépêcher"] = {"move_f@hurry@a"},
  ["Concierge"] = {"move_p_m_zero_janitor"},
  ["Concierge2"] = {"move_p_m_zero_slow"},
  ["Jogging"] = {"move_m@jog@"},
  ["Lemar"] = {"anim_group_move_lemar_alley"},
  ["Lester"] = {"move_heist_lester"},
  ["Lester2"] = {"move_lester_caneup"},
  ["Croqueuse d'hommes"] = {"move_f@maneater"},
  ["Michael"] = {"move_ped_bucket"},
  ["Fric"] = {"move_m@money"},
  ["Chic"] = {"move_m@posh@"},
  ["Chic2"] = {"move_f@posh@"},
  ["Rapide"] = {"move_m@quick"},
  ["Coureur"] = {"female_fast_runner"},
  ["Triste"] = {"move_m@sad@a"},
  ["Pétasse"] = {"move_m@sassy"},
  ["Pétasse2"] = {"move_f@sassy"},
  ["Effrayé"] = {"move_f@scared"},
  ["Sexy"] = {"move_f@sexy@a"},
  ["Sombre"] = {"move_m@shadyped@a"},
  ["Lent"] = {"move_characters@jimmy@slow@"},
  ["Swagger"] = {"move_m@swagger"},
  ["Difficile"] = {"move_m@tough_guy@"},
  ["Difficile2"] = {"move_f@tough_guy@"},
  ["Poubelle"] = {"clipset@move@trash_fast_turn"},
  ["Poubelle2"] = {"missfbi4prepp1_garbageman"},
  ["Trevor"] = {"move_p_m_two"},
  ["Large"] = {"move_m@bag"},
  -- I cant get these to work for some reason, if anyone knows a fix lmk
  --["Caution"] = {"move_m@caution"},
  --["Chubby"] = {"anim@move_m@chubby@a"},
  --["Crazy"] = {"move_m@crazy"},
  --["Joy"] = {"move_m@joy@a"},
  --["Power"] = {"move_m@power"},
  --["Sad2"] = {"anim@move_m@depression@a"},
  --["Sad3"] = {"move_m@depression@b"},
  --["Sad4"] = {"move_m@depression@d"},
  --["Wading"] = {"move_m@wading"},
}

DP.Shared = {
   --[emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions}
   -- you dont have to specify targetemoteanem, if you do dont it will just play the same animation on both.
   -- targetemote is used for animations that have a corresponding animation to the other player.
   ["Poignée de main"] = {"mp_ped_interaction", "handshake_guy_a", "Poignée de main", "Poignée de main2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
       SyncOffsetFront = 0.9
   }},
   ["Poignée de main2"] = {"mp_ped_interaction", "handshake_guy_b", "Poignée de main 2", "Poignée de main", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["Câlin"] = {"mp_ped_interaction", "kisses_guy_a", "Câlin", "Câlin2", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.05,
   }},
   ["Câlin2"] = {"mp_ped_interaction", "kisses_guy_b", "Câlin 2", "Câlin", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.13
   }},
   ["bro"] = {"mp_ped_interaction", "hugs_guy_a", "Bro", "bro2", AnimationOptions =
   {
        SyncOffsetFront = 1.14
   }},
   ["bro2"] = {"mp_ped_interaction", "hugs_guy_b", "Bro 2", "bro", AnimationOptions =
   {
        SyncOffsetFront = 1.14
   }},
   ["Donner"] = {"mp_common", "givetake1_a", "Donner", "Donner2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["Donner2"] = {"mp_common", "givetake1_b", "Donner 2", "Donner", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Baseball", "lancer de baseball"},
   ["lancer de baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "lancer de baseball", "baseball"},
   ["Hold-up"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Hold-up", "Hold-up effrayé", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["Hold-up effrayé"] = {"missminuteman_1ig_2", "handsup_base", "Hold-up effrayé", "Hold-up", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["Frappé"] = {"melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Frappé", "Se faire frappé"},
   ["Se faire frappé"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Se faire frappé", "Frappé"},
   ["Mettre un coup de boule"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Mettre un coup de boule", "Prendre un coup de boule"},
   ["Prendre un coup de boule"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Prendre un coup de boule", "Mettre un coup de boule"},
   ["Gifle2"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Gifle 2", "Prendre une gifle2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["Gifle"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Gifle", "Prendre une gifle", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["Prendre une gifle"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Prendre une gifle", "Gifle"},
   ["Prendre une gifle2"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Prendre une gifle 2", "Gifle2"},
}

DP.Dances = {
   ["dansef"] = {"anim@amb@nightclub@dancers@solomun_entourage@", "mi_dance_facedj_17_v1_female^1", "Danse F", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dansef2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Danse F2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dansef3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Danse F3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dansef4"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Danse F4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dansef5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Danse F5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dansef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Danse F6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse lente2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Danse Lente 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse lente3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Danse Lente 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse lente4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Danse Lente 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Danse", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Danse 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Danse 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Danse 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse du haut"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Danse Supérieur", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danse du haut2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Danse du haut 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danse timide"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Danse Timide", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse timide2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Danse Timide 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse lente"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Danse Lente", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse idiote9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Danse Idiote 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse6"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Danse 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Danse 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse8"] = {"missfbi3_sniping", "dance_m_default", "Danse 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse idiote"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Danse Idiote", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse idiote2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Danse Idiote 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse idiote3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Danse Idiote 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse idiote4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Danse Idiote 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse idiote5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Danse Idiote 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse idiote6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Danse Idiote 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Danse 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danse idiote8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Danse Idiote 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["danse idiote7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Danse Idiote 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["danse5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Danse 5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["danse baton lumineux"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Danse Baton Lumineux", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danse baton lumineux2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Danse Baton Lumineux 2", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["danse baton lumineux 3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Danse Baton Lumineux 3", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["danse cheval"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Danse Cheval", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danse chaval2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Danse Cheval 2", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["danse cheval3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Danse Cheval 3", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
}

DP.Emotes = {
   ["boire"] = {"mp_player_inteat@pnq", "loop", "Boire", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["Bête"] = {"anim@mp_fm_event@intro", "beast_transform", "Bête", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000,
   }},
   ["chill"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Chill", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["surunnuageF"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Sur un nuageF", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["surunnuageM"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Sur un nuageM", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["coucheT"] = {"missfbi3_sniping", "prone_dave", "Couché au téléphone", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["avancer"] = {"misscarsteal3pullover", "pull_over_right", "Avancer", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["inactif"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Inactif", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactif8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Inactif 8"},
   ["inactif9"] = {"friends@fra@ig_1", "base_idle", "Inactif 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["iactif10"] = {"mp_move@prostitute@m@french", "idle", "Inactif 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["inactif11"] = {"random@countrysiderobbery", "idle_a", "Inactif 11", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactif2"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Inactif 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactif3"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Inactif 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactif4"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Inactif 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactif5"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Inactif 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inatif6"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Inactif 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactif7"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Inactif 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendre3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Attendre 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactifbourre"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Inactif Bourré", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactifbourre2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Inactif Bourré 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["inactifbourre3"] = {"missarmenian2", "standing_idle_loop_drunk", "Inactif Bourré 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitar"},
   ["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Synth"},
   ["soutenir"] = {"misscarsteal4@actor", "actor_berating_loop", "Soutenir", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["soutenir2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Soutenir 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["appuiemur"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "S'appuyer sur le mur", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bisous"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Bisous"},
   ["bisous2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Bisous 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000

   }},
   ["reverence"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Révérence"},
   ["quoi"] = {"misscommon@response", "bring_it_on", "Y'a quoi ?", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["vienbro"] = {"mini@triathlon", "want_some_of_this", "Viens à moi bro", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["flic2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Flic 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["flic3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Flic 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["brascroise"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Bras Croisé", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["brascroise2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Bras Croisé 2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["brascroise3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Bras Croisé 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["brascroise4"] = {"random@street_race", "_car_b_lookout", "Bras Croisé 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["brascroise5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Bras Croisé 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["brascroise8"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Bras Croisé 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["brascroise6"] = {"random@shop_gunstore", "_idle", "Bras Croisé 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["brascroise7"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Bras Croisé 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["brascroise9"] = {"rcmnigel1a_band_groupies", "base_m2", "Bras Croisé 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["damn"] = {"gestures@m@standing@casual", "gesture_damn", "Damn", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["damn2"] = {"anim@am_hold_up@male", "shoplift_mid", "Damn 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["pointer"] = {"gestures@f@standing@casual", "gesture_hand_down", "Pointé", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["serendre"] = {"random@arrests@busted", "idle_a", "Se Rendre", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["fail2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Fail 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["fail"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Fail", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["fail3"] = {"missminuteman_1ig_2", "tasered_2", "Fail 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["fail4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Fail 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["tomber"] = {"random@drunk_driver_1", "drunk_fall_over", "Tomber"},
   ["tomber2"] = {"mp_suicide", "pistol", "Tomber 2"},
   ["tomber3"] = {"mp_suicide", "pill", "Tomber 3"},
   ["tomber4"] = {"friends@frf@ig_2", "knockout_plyr", "Tomber 4"},
   ["tomber5"] = {"anim@gangops@hostage@", "victim_fail", "Tomber 5"},
   ["endormi"] = {"mp_sleep", "sleep_loop", "S'endormir", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["combatmoi"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Combat Moi"},
   ["combatmoi2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Combat Moi 2"},
   ["doigt"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Doigt", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["doigt2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Doigt 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["shake"] = {"mp_ped_interaction", "handshake_guy_a", "Shake", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["shake2"] = {"mp_ped_interaction", "handshake_guy_b", "Shake 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["attendre4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Attendre 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendre5"] = {"missclothing", "idle_storeclerk", "Attendre 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendre6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Attendre 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendre7"] = {"rcmnigel1cnmt_1c", "base", "Attendre 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendre8"] = {"rcmjosh1", "idle", "Attendre 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendre9"] = {"rcmjosh2", "josh_2_intp1_base", "Attendre 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendre10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Attendre 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendre11"] = {"misshair_shop@hair_dressers", "keeper_base", "Attendre 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tenirsac"] = {"move_m@hiking", "idle", "Tenir son sac", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["calin"] = {"mp_ped_interaction", "kisses_guy_a", "Câlin"},
   ["calin2"] = {"mp_ped_interaction", "kisses_guy_b", "Câlin 2"},
   ["calin3"] = {"mp_ped_interaction", "hugs_guy_a", "Câlin 3"},
   ["inspecte"] = {"random@train_tracks", "idle_e", "Inspecter"},
   ["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Jazzhands", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 6000,
   }},
   ["jogging2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Jogging 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jogging3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Jogging 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jogging4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Jogging 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jogging5"] = {"move_m@joy@a", "walk", "Jogging 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sautsport"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Faire du sport", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["agenoux2"] = {"rcmextreme3", "idle", "S' agenouiller 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "S' agenouiller 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["fporte"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Frapper à la porte", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["fporte2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Frapper à la porte 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["craquer"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Craquer ses doigts", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["striptease"] = {"mp_safehouse", "lap_dance_girl", "Strip Tease"},
   ["attendremur2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Attendre contre un mur 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendremur3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Attendre contre un mur 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendremur4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Attendre contre un mur 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendremur5"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Attendre contre un mur 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cul"] = {"random@street_race", "_car_a_flirt_girl", "Montré son cul", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendrebar"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "Attendre sur une barre 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendrebar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "Attendre sur une barre 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendrebar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "Attendre sur une barre 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["attendrecmur"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Attendre sur un mur", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendrecmur2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Attendre sur un mur 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendretable"] = {"timetable@mime@01_gc", "idle_a", "Attendre contre une table", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendrecomur"] = {"misscarstealfinale", "packer_idle_1_trevor", "Attendre contre un mur ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendretable2"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Attendre contre une table 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attendretable3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Attendre contre une table 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   --["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "Leanside 5", AnimationOptions =
   --{
       --EmoteLoop = true,
       --EmoteMoving = false,
   --}},
   ["moi"] = {"gestures@f@standing@casual", "gesture_me_hard", "Moi", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["mecano"] = {"mini@repair", "fixing_a_ped", "Mecano", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mecano2"] = {"amb@world_human_vehicle_mechanic@male@base", "idle_a", "Mecano 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mecano3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mecano 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mecano4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mecano 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "Medecin 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mediter"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Méditer", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["mediter2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Méditer 2", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["mediter3"] = {"rcmepsilonism3", "base_loop", "Méditer 3", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["non"] = {"anim@heists@ornate_bank@chat_manager", "fail", "Non", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["non2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "Non 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["graternez"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Se curer le nez", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["question"] = {"gestures@m@standing@casual", "gesture_no_way", "Pas question", AnimationOptions =
   {
       EmoteDuration = 1500,
       EmoteMoving = true,
   }},
   ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["souffle"] = {"re@construction", "out_of_breath", "À bout de souffle", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ramasser"] = {"random@domestic", "pickup_low", "Ramasser"},
   ["pousser"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Pousser", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["pousser2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Pousser 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["point"] = {"gestures@f@standing@casual", "gesture_point", "Appuyer sur un bouton", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pompes"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Faire des pompes", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["decompte"] = {"random@street_race", "grid_girl_race_start", "Compte à rebours", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Point Right", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salut"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salut militaire", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salut2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salut militaire 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salut3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salut militaire 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peur"] = {"random@domestic", "f_distressed_loop", "Effrayé", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peur2"] = {"random@homelandsecurity", "knees_loop_girl", "Effrayé 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["vachier"] = {"misscommon@response", "screw_you", "Va chier", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["epoussierer"] = {"move_m@_idles@shake_off", "shakeoff_1", "Retirer la saleté", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3500,
   }},
   ["blessure"] = {"random@dealgonewrong", "idle_a", "Blessure", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dormir"] = {"timetable@tracy@sleep@", "idle_c", "Dormir", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["saispas"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Hausser les épaules", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["saispas2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Hausser les épaules 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["assis"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "S'asseoir", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assis2"] = {"rcm_barry3", "barry_3_sit_loop", "S'asseoir 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assis3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "S'asseoir 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assis4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "S'asseoir 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assis5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "S'asseoir 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assis6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "S'asseoir 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assis7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "S'asseoir 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assis8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "Sasseoir 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assis9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "S'asseoir 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assisallonge"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "S'asseoir à moitié allongé", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assistriste"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "S'asseoir triste", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["victime"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "S'asseoir en victime", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["victime2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "S'asseoir en victime 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["victime3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "S'asseoir en victime 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["assisbourre"] = {"timetable@amanda@drunk@base", "base", "S'asseoir bourré", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["chaise2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "S'asseoir sur une chaise 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["chaise3"] = {"timetable@reunited@ig_10", "base_amanda", "S'asseoir sur une chaise 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["chaise4"] = {"timetable@ron@ig_3_couch", "base", "S'asseoir sur une chaise 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["chaise5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "S'asseoir sur une chaise 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["chaise6"] = {"timetable@maid@couch@", "base", "S'asseoir sur une chaise 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["chaisecote"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "S'asseoir de côté sur une chaise", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["abdos"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Faire des abdos", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["applaudirfort"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Appaludissement énervé", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["applaudirlent3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Applaudir lentement 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["applaudir"] = {"amb@world_human_cheering@male_a", "base", "Applaudir", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["applaudirlent"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Applaudir lentement", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["applaudirlent2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Applaudir lentement 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sentir"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Sentir son doigt", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["menace"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Menacer avec une arme", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cuite"] = {"misscarsteal4@actor", "stumble", "Etre dans les vapes", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["electrocute"] = {"stungun@standing", "damage", "Electrocuté", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["bronze"] = {"amb@world_human_sunbathe@male@back@base", "base", "Bronzer", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["bronze2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Bronzer 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["t"] = {"missfam5_yoga", "a2_pose", "Pose T", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["t2"] = {"mp_sleep", "bind_pose_180", "Pose T 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["reflechir5"] = {"mp_cp_welcome_tutthink", "b_think", "Reflechir 5", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["reflechir"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Reflechir", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["reflechir3"] = {"timetable@tracy@ig_8@base", "base", "Reflechir 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["reflechir2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Reflechir 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ok3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Pouce ok 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["ok2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Pouce ok 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ok"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Pouce ok", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clavier"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Ecrire au clavier", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clavier2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Ecrire au clavier 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clavier3"] = {"mp_prison_break", "hack_loop", "Ecrire au clavier 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clavier4"] = {"mp_fbi_heist", "loop", "Ecrire au clavier 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["chaleur"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Se réchauffer", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coucou4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Faire coucou 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["coucou2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Faire coucou 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coucou3"] = {"friends@fra@ig_1", "over_here_idle_a", "Faire coucou 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coucou"] = {"friends@frj@ig_1", "wave_a", "Faire coucou", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coucou5"] = {"friends@frj@ig_1", "wave_b", "Faire coucou 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coucou6"] = {"friends@frj@ig_1", "wave_c", "Faire coucou 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coucou7"] = {"friends@frj@ig_1", "wave_d", "Faire coucou 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coucou8"] = {"friends@frj@ig_1", "wave_e", "Faire coucou 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coucou9"] = {"gestures@m@standing@casual", "gesture_hello", "Faire coucou 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["siffler"] = {"taxi_hail", "hail_taxi", "Siffler", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["siffler2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Siffler 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["danseventre"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Danse du ventre", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stop"] = {"random@hitch_lift", "idle_f", "Faire du stop", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "LOL", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "LOL 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Statue 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Statue 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gang"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Signe de Gang", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gang2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Signe de Gang 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["evanouir"] = {"missarmenian2", "drunk_loop", "S'évanouir", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["evanouir2"] = {"missarmenian2", "corpse_search_exit_ped", "S'évanouir 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["evanouir3"] = {"anim@gangops@morgue@table@", "body_search", "S'évanouir 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["evanouir4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "S'évanouir 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["evanouir5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "S'évanouir 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["caresse"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Bon toutou", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ramper"] = {"move_injured_ground", "front_loop", "Ramper", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ninja"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Faire le ninja"},
   ["salto"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Salto"},
   ["glisse"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Glissade"},
   ["glisse2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Glissade 2"},
   ["glisse3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Glissade 3"},
   ["homerun"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Faire un Home Run"},
   ["connard"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Etre un connard", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["connard2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Etre un connard 2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["reverence"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Révérence", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["reverence"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Révérence 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clé"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Ouvrir/Fermer son véhicule", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["golf"] = {"rcmnigel1d", "swing_a_mark", "Jouer au golf"},
   ["manger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Manger", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["holster"] = {"move_m@intimidation@cop@unarmed", "idle", "Main sur le holster", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attente"] = {"random@shop_tattoo", "_idle_a", "Attente", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attente2"] = {"missbigscore2aig_3", "wait_for_van_c", "Attente 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attente12"] = {"rcmjosh1", "idle", "Attente 12", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["attente13"] = {"rcmnigel1a", "base", "Attente 13", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lapdance 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Lapdance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Lapdance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["giffle"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Giffle", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["coupdeboule"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Coup de boule"},
   ["dansepoisson"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Danse du poisson", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["paix"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Paix", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["paix2"] = {"anim@mp_player_intupperpeace", "idle_a", "Paix 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["massagecardiaque"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Massage cardiaque", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["massage cardiaque2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Massage cardiaque 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["securite"] = {"missfbi1", "ledge_loop", "Bloquer les gens", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["avion"] = {"missfbi1", "ledge_loop", "Faire l'avion", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coupoeil"] = {"random@paparazzi@peek", "left_peek_a", "Coup d'oeil", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tousser"] = {"timetable@gardener@smoking_joint", "idle_cough", "Tousser", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["etirer"] = {"mini@triathlon", "idle_e", "S'étirer", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["etirer2"] = {"mini@triathlon", "idle_f", "S'étirer 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["etirer3"] = {"mini@triathlon", "idle_d", "S'étirer 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["etirer4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "S'étirer 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["celebrer"] = {"rcmfanatic1celebrate", "celebrate", "Célébrer", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["frapper"] = {"rcmextreme2", "loop_punching", "Frapper", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["superheros"] = {"rcmbarry", "base", "Super-héros", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["superheros2"] = {"rcmbarry", "base", "Super-héros 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["forcesprit"] = {"rcmbarry", "mind_control_b_loop", "Contrôle de l'esprit", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["forcesprit2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Contrôle de l'esprit 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["essayage"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Essayage", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["essayage2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Essayage 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["essayage3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Essayage 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["nerveux2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Nerveux 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nerveux"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Nerveux", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nerveux3"] = {"rcmme_tracey1", "nervous_loop", "Nerveux 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["demenotter"] = {"mp_arresting", "a_uncuff", "Démenotter", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["menacearme"] = {"random@atmrobberygen", "b_atm_mugging", "Menace", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tirer"] = {"random@mugging4", "struggle_loop_b_thief", "Tirer", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["oiseau"] = {"random@peyote@bird", "wakeup", "Oiseau"},
   ["poulet"] = {"random@peyote@chicken", "wakeup", "Poulet", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["waf"] = {"random@peyote@dog", "wakeup", "Abboyer"},
   ["lapin"] = {"random@peyote@rabbit", "wakeup", "Lapin"},
   ["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spider-Man", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "BOI", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 3000,
   }},
   ["31"] = {"missmic4", "michael_tux_fidget", "Sur son 31", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 4000,
   }},
   ["mainsenlair"] = {"missminuteman_1ig_2", "handsup_base", "Mains en l'air", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["pipi"] = {"misscarsteal2peeing", "peeing_loop", "Pipi", AnimationOptions =
   {
       EmoteStuck = true,
       PtfxAsset = "scr_amb_chop",
       PtfxName = "ent_anim_dog_peeing",
       PtfxNoProp = true,
       PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
       PtfxWait = 3000,
   }},

-----------------------------------------------------------------------------------------------------------
------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
-----------------------------------------------------------------------------------------------------------

   ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
   ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
   ["fouillepoubelle"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Fouiller dans la poubelle"},
   ["dormirdehors"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Dormir dehors"},
   ["encourager"] = {"Scenario", "WORLD_HUMAN_CHEERING", "encourager"},
   ["tractions"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Faire des tractions"},
   ["note2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Prendre des notes 2"},
   ["flic"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Flic"},
   ["circulation"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Flic de circulation"},
   ["snapchoc"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Filmer un truc choquant"},
   ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Flex"},
   ["garde"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Garde"},
   ["marteau"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Marteau"},
   ["flirt"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Flirt"},
   ["impatient"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Impatient"},
   ["poseconcierge"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Pose concierge"},
   ["echauffement"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Echauffement"},
   ["agenouiller"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "S'agenouiller"},
   ["soufflefeuilles"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Souffler les feuilles"},
   ["seposer"] = {"Scenario", "WORLD_HUMAN_LEANING", "Se poser"},
   ["seposersurbarre"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Se poser sur une barre"},
   ["surveiller"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Surveiller"},
   ["soubrette"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Soubrette"},
   ["medecin"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Medecin"},
   ["musicien"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Musicien"},
   ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Notepad 2"},
   ["parkmetre"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Parkmetre"},
   ["fete"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Fête"},
   ["telephone"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Téléphone"},
   ["qualitepute"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Pute de qualité"},
   ["badgammepute"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Pute bas de gamme"},
   ["jouereau"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Jouer au bord de l'eau"},
   ["filmer"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Filmer"},
   -- Sitchair is a litte special, since you want the player to be seated correctly.
   -- So we set it as "ScenarioObject" and do TaskStartScenarioAtPosition() instead of "AtPlace"
   ["assischaise"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "S'asseoir sur une chaise"},
   ["fumer"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Fumer"},
   ["fumerweed"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Fumer de la weed"},
   ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Statue"},
   ["bronze3"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Bronzer 3"},
   ["bronzedos"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Bronzer le dos"},
   ["souder"] = {"Scenario", "WORLD_HUMAN_WELDING", "Souder"},
   ["comptoir"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Etre au comptoir"},
   ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
   -- CASINO DLC EMOTES (STREAMED)
   ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karate"},
   ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karate 2"},
   ["menacedemort"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Menace de mort"},
   ["menacedemort2"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Menace de mort 2"},
   ["boumesprit"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Explosion de l'esprit", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boumesprit2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Explosion de l'esprit 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boxe"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxe", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boxe2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxe 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["capue"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Ca pue", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["reflechir4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Réfléchir 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cravate"] = {"clothingtie", "try_tie_positive_a", "Remettre sa cravate", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000
   }},
}

DP.PropEmotes = {
   ["Parapluie"] = {"amb@world_human_drinking@coffee@male@base", "base", "Parapluie", AnimationOptions =
   {
       Prop = "p_amb_brolly_01",
       PropBone = 57005,
       PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
       --
       EmoteLoop = true,
       EmoteMoving = true,
   }},

-----------------------------------------------------------------------------------------------------
------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
-----------------------------------------------------------------------------------------------------

   ["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Notepad", AnimationOptions =
   {
       Prop = 'prop_notepad_01',
       PropBone = 18905,
       PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
       SecondProp = 'prop_pencil_01',
       SecondPropBone = 58866,
       SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
       -- EmoteLoop is used for emotes that should loop, its as simple as that.
       -- Then EmoteMoving is used for emotes that should only play on the upperbody.
       -- The code then checks both values and sets the MovementType to the correct one
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["boite"] = {"anim@heists@box_carry@", "idle", "Boîte", AnimationOptions =
   {
       Prop = "hei_prop_heist_box",
       PropBone = 60309,
       PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Rose", AnimationOptions =
   {
       Prop = "prop_single_rose",
       PropBone = 18905,
       PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fumer2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Fumer 2", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fumer3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Fumer 3", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fumer4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Fumer 4", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bong", AnimationOptions =
   {
       Prop = 'hei_heist_sh_bong_01',
       PropBone = 18905,
       PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
   }},
   ["mallette"] = {"missheistdocksprep1hold_cellphone", "static", "Mallette", AnimationOptions =
   {
       Prop = "prop_ld_suitcase_01",
       PropBone = 57005,
       PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mallette2"] = {"missheistdocksprep1hold_cellphone", "static", "Mallette 2", AnimationOptions =
   {
       Prop = "prop_security_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["photogav"] = {"mp_character_creation@customise@male_a", "loop", "Photo détenu", AnimationOptions =
   {
       Prop = 'prop_police_id_board',
       PropBone = 58868,
       PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cafe"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Café", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions =
   {
       Prop = 'prop_drink_whisky',
       PropBone = 28422,
       PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["biere"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bière", AnimationOptions =
   {
       Prop = 'prop_amb_beer_bottle',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gobelet"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Gobelet", AnimationOptions =
   {
       Prop = 'prop_plastic_cup_02',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
   {
       Prop = 'prop_amb_donut',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
   {
       Prop = 'prop_cs_burger_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
   {
       Prop = 'prop_sandwich_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda", AnimationOptions =
   {
       Prop = 'prop_ecola_can',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["barreproteine"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Barre protéinée", AnimationOptions =
   {
       Prop = 'prop_choc_ego',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
   }},
   ["vin"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Vin", AnimationOptions =
   {
       Prop = 'prop_drink_redwine',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute", AnimationOptions =
   {
       Prop = 'prop_champ_flute',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne", AnimationOptions =
   {
       Prop = 'prop_drink_champ',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["cigare"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigare", AnimationOptions =
   {
       Prop = 'prop_cigar_02',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cigare2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigare 2", AnimationOptions =
   {
       Prop = 'prop_cigar_01',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["guitare"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitare2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Guitare 2", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectrique"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare électrique", AnimationOptions =
   {
       Prop = 'prop_el_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectrique2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare électrique 2", AnimationOptions =
   {
       Prop = 'prop_el_guitar_03',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["livre"] = {"cellphone@", "cellphone_text_read_base", "Livre", AnimationOptions =
   {
       Prop = 'prop_novel_01',
       PropBone = 6286,
       PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet", AnimationOptions =
   {
       Prop = 'prop_snow_flower_02',
       PropBone = 24817,
       PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["nounours"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Nounours", AnimationOptions =
   {
       Prop = 'v_ilev_mr_rasberryclean',
       PropBone = 24817,
       PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["sacados"] = {"move_p_m_zero_rucksack", "idle", "Sac à dos", AnimationOptions =
   {
       Prop = 'p_michael_backpack_s',
       PropBone = 24818,
       PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["note"] = {"missfam4", "base", "Prendre notes", AnimationOptions =
   {
       Prop = 'p_amb_clipboard_01',
       PropBone = 36029,
       PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["carte"] = {"amb@world_human_tourist_map@male@base", "base", "Carte", AnimationOptions =
   {
       Prop = 'prop_tourist_map_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["mendier"] = {"amb@world_human_bum_freeway@male@base", "base", "Mendier", AnimationOptions =
   {
       Prop = 'prop_beggers_sign_03',
       PropBone = 58868,
       PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pluiebillets"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Pluie de billets", AnimationOptions =
   {
       Prop = 'prop_anim_cash_pile_01',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_xs_celebration",
       PtfxName = "scr_xs_money_rain",
       PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['makeitrain'],
       PtfxWait = 500,
   }},
   ["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Caméra", AnimationOptions =
   {
       Prop = 'prop_pap_camera_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
       PtfxAsset = "scr_bike_business",
       PtfxName = "scr_bike_cfid_camera_flash",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
       PtfxWait = 200,
   }},
   ["arrosechampagne"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Eclabousser de champagne", AnimationOptions =
   {
       Prop = 'ba_prop_battle_champ_open',
       PropBone = 28422,
       PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_ba_club",
       PtfxName = "scr_ba_club_champagne_spray",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['spraychamp'],
       PtfxWait = 500,
   }},
   ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions =
   {
       Prop = 'p_cs_joint_02',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cigarette"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigarette", AnimationOptions =
   {
       Prop = 'prop_amb_ciggy_01',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["brief3"] = {"missheistdocksprep1hold_cellphone", "static", "Brief 3", AnimationOptions =
   {
       Prop = "prop_ld_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
}