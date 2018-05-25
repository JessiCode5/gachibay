//Not a total ripoff of the crab code. Also HE
/mob/living/simple_animal/he
	name = "??"
	desc = "Everything you have ever wanted is a lie."
	icon_state = "he"
	icon_living = "he"
	icon_dead = "he_dead"
	mob_size = MOB_SMALL
	speak_emote = list("snorts")
	emote_hear = list("snorts")
	emote_see = list("sneezes")
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	stop_automated_movement = 1
	friendly = "pinches"
	mob_size = 5
	var/obj/item/inventory_head
	var/obj/item/inventory_mask
	possession_candidate = 1

/mob/living/simple_animal/he/Life()
	..()
	//CRAB movement
	if(!ckey && !stat)
		if(isturf(src.loc) && !resting && !buckled)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				Move(get_step(src,pick(4,8)))
				turns_since_move = 0
	regenerate_icons()
