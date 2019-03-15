/mob/living
	see_in_dark = 2
	see_invisible = SEE_INVISIBLE_LIVING

	//Health and life related vars
	var/maxHealth = 100 //Maximum health that should be possible.
	var/health = 100 	//A mob's health
	var/shunned_mod = 1 // DARKHOLME'S DUNGEON: The SHUNNENING!!!

	//DD Addition, https://www.youtube.com/watch?v=2orM_G1dWFM

	var/titsize // 0 = none, 1 = small, 2 = medium, 3 = large.
	//var/tsizeflavortexts = (var/tsizeflavortext0, var/tsizeflavortext1, var/tsizeflavortext2, var/tsizeflavortext3)
	var/tsizeflavortext0 = "no"
	var/list/tsizeflavortext1 = list("This bitch is as bare as a board!\n","She's flat, like old Fanta\n","Her chest looks like a xylophone\n","Haha, she doesn't have big boobs, lol!\n","It looks like a party baloon deflated on her chest\n", "She's got defective airbags\n")
	var/list/tsizeflavortext2 = list("She's packing a pair of mundane mammaries\n", "She's got mediocre mounds\n", "She has humble humps\n","She has average breasts\n")
	var/list/tsizeflavortext3 = list("They're equipped with large tits\n","This lady's got huge breasts!\n", "Her seas are sailed by some big belugas\n", "Her zoo's got a new pair of massive mammoths\n")

	var/hud_updateflag = 0

	//Damage related vars, NOTE: THESE SHOULD ONLY BE MODIFIED BY PROCS // what a joke
	//var/bruteloss = 0 //Brutal damage caused by brute force (punching, being clubbed by a toolbox ect... this also accounts for pressure damage)
	//var/oxyloss = 0   //Oxygen depravation damage (no air in lungs)
	//var/toxloss = 0   //Toxic damage caused by being poisoned or radiated
	//var/fireloss = 0  //Burn damage caused by being way too hot, too cold or burnt.
	//var/halloss = 0   //Hallucination damage. 'Fake' damage obtained through hallucinating or the holodeck. Sleeping should cause it to wear off.

	var/lisp = 0
	var/staminaloss = 0
	var/tongueless = 0

	var/hallucination = 0 //Directly affects how long a mob will hallucinate for
	var/list/atom/hallucinations = list() //A list of hallucinated people that try to attack the mob. See /obj/effect/fake_attacker in hallucinations.dm

	var/last_special = 0 //Used by the resist verb, likely used to prevent players from bypassing next_move by logging in/out.

	var/t_phoron = null
	var/t_oxygen = null
	var/t_sl_gas = null
	var/t_n2 = null

	var/now_pushing = null
	var/mob_bump_flag = 0
	var/mob_swap_flags = 0
	var/mob_push_flags = 0
	var/mob_always_swap = 0

	var/mob/living/cameraFollow = null
	var/list/datum/action/actions = list()

	var/update_slimes = 1
	var/on_fire = 0 //The "Are we on fire?" var
	var/fire_stacks

	var/failed_last_breath = 0 //This is used to determine if the mob failed a breath. If they did fail a brath, they will attempt to breathe each tick, otherwise just once per 4 ticks.
	var/possession_candidate // Can be possessed by ghosts if unplayed.

	var/eye_blind = null	//Carbon
	var/eye_blurry = null	//Carbon
	var/ear_damage = null	//Carbon
	var/stuttering = null	//Carbon
	var/slurring = null		//Carbon

	var/job = null//Living

	var/doing_something = 0	//Like pulling teeth?

	var/obj/screen/cells = null

	var/list/in_vision_cones = list()

	var/footstep = 0

	//This has gameplay relevance, this is no longer just fluff.
	var/religion = LEGAL_RELIGION
