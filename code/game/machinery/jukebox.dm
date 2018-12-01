//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32
//5.31.18 -- even more jukebox spaces

datum/track
	var/title
	var/sound

datum/track/New(var/title_name, var/audio)
	title = title_name
	sound = audio

/obj/machinery/media/jukebox
	name = "space jukebox"
	icon = 'icons/obj/jukebox.dmi'
	icon_state = "jukebox2-nopower"
	var/state_base = "jukebox2"
	anchored = 1
	density = 1
	power_channel = EQUIP
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 100
	clicksound = 'sound/machines/buttonbeep.ogg'

	var/playing = 0
	var/volume = 20

	var/sound_id
	var/datum/sound_token/sound_token

	var/datum/track/current_track // there are gaps in file names cuz i just deleted those tracks which was the quickest option
	var/list/datum/track/tracks = list(
		new/datum/track("Song 1", 'sound/jukebox/barsong1.ogg'),
		new/datum/track("Song 5", 'sound/jukebox/barsong5.xm'),
		new/datum/track("lonely singing fish", 'sound/jukebox/barsong7.mod'),
		new/datum/track("Song 8", 'sound/jukebox/barsong8.mod'),
		new/datum/track("RLD Installer #6", 'sound/jukebox/barsong9.xm'),
		new/datum/track("Zool2", 'sound/jukebox/barsong10.mod'),
		new/datum/track("Grab My Dick", 'sound/jukebox/barsong12.xm'),
		new/datum/track("Lobby Music", 'sound/jukebox/barsong13.ogg'),
		new/datum/track("Danganronpa - Closing Argument", 'sound/jukebox/barsong14.ogg'),
		new/datum/track("Danganronpa - BOX 15", 'sound/jukebox/barsong15.ogg'),
		new/datum/track("Uplink OST - Mystique Pt. 2", 'sound/jukebox/barsong16.s3m'),
		new/datum/track("Uplink OST - Serenity", 'sound/jukebox/barsong17.s3m'),
		new/datum/track("Uplink OST - Symphonic", 'sound/jukebox/barsong18.mod'),
		new/datum/track("It is a mystery", 'sound/jukebox/barsong19.xm'),
		new/datum/track("farout05", 'sound/jukebox/barsong20.mod'),
		//new/datum/track("Necrophageon - Cast Adrift", 'sound/jukebox/barsong21.ogg'),
		new/datum/track("Turtle grains", 'sound/jukebox/barsong22.mod'),
		new/datum/track("det var en ulv", 'sound/jukebox/barsong23.mod'),
		new/datum/track("FF6j - Awakening", 'sound/jukebox/barsong24.it'),
		new/datum/track("river solo", 'sound/jukebox/barsong25.ogg'),
		new/datum/track("Song 26", 'sound/jukebox/barsong26.xm'),
		new/datum/track("DB_CHP16", 'sound/jukebox/barsong28.xm'),
		new/datum/track("space_debris", 'sound/jukebox/barsong29.mod'),
		new/datum/track("ELYSIUM", 'sound/jukebox/barsong30.MOD'),

	)

/obj/machinery/media/jukebox/New()
	..()
	update_icon()
	sound_id = "[type]_[sequential_id(type)]"

/obj/machinery/media/jukebox/Destroy()
	StopPlaying()
	. = ..()

/obj/machinery/media/jukebox/power_change()
	. = ..()
	if(!anchored)
		stat |= NOPOWER
	else
		stat &= ~NOPOWER

	if(stat & (NOPOWER|BROKEN) && playing)
		StopPlaying()

/obj/machinery/media/jukebox/update_icon()
	overlays.Cut()
	if(stat & (NOPOWER|BROKEN) || !anchored)
		if(stat & BROKEN)
			icon_state = "[state_base]-broken"
		else
			icon_state = "[state_base]-nopower"
		return
	icon_state = state_base
	if(playing)
		if(emagged)
			overlays += "[state_base]-emagged"
		else
			overlays += "[state_base]-running"

/obj/machinery/media/jukebox/interact(mob/user)
	if(!anchored)
		to_chat(usr, "<span class='warning'>You must secure \the [src] first.</span>")
		return

	if(stat & (NOPOWER|BROKEN))
		to_chat(usr, "\The [src] doesn't appear to function.")
		return

	tg_ui_interact(user)

/obj/machinery/media/jukebox/ui_status(mob/user, datum/ui_state/state)
	if(!anchored || inoperable())
		return UI_CLOSE
	return ..()

/obj/machinery/media/jukebox/tg_ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = 0, datum/tgui/master_ui = null, datum/ui_state/state = tg_default_state)
	ui = tgui_process.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "jukebox", "The Gachi Musical Machine", 340, 440, master_ui, state)
		ui.open()

/obj/machinery/media/jukebox/ui_data()
	var/list/juke_tracks = new
	for(var/datum/track/T in tracks)
		juke_tracks.Add(T.title)

	var/list/data = list(
		"current_track" = current_track != null ? current_track.title : "No track selected",
		"playing" = playing,
		"tracks" = juke_tracks,
		"volume" = volume
	)

	return data

/obj/machinery/media/jukebox/ui_act(action, params)
	if(..())
		return TRUE
	switch(action)
		if("change_track")
			for(var/datum/track/T in tracks)
				if(T.title == params["title"])
					current_track = T
					StartPlaying()
					break
			. = TRUE
		if("stop")
			StopPlaying()
			. = TRUE
		if("play")
			if(emagged)
				emag_play()
			else if(!current_track)
				to_chat(usr, "No track selected.")
			else
				StartPlaying()
			. = TRUE
		if("volume")
			AdjustVolume(text2num(params["level"]))
			. = TRUE

/obj/machinery/media/jukebox/proc/emag_play()
	playsound(loc, 'sound/items/AirHorn.ogg', 100, 1)
	for(var/mob/living/carbon/M in ohearers(6, src))
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(istype(H.l_ear, /obj/item/clothing/ears/earmuffs) || istype(H.r_ear, /obj/item/clothing/ears/earmuffs))
				continue
		M.sleeping = 0
		M.stuttering += 20
		M.ear_deaf += 30
		M.Weaken(3)
		if(prob(30))
			M.Stun(10)
			M.Paralyse(4)
		else
			M.make_jittery(400)
	spawn(15)
		explode()

/obj/machinery/media/jukebox/attack_ai(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/media/jukebox/attack_hand(var/mob/user as mob)
	interact(user)

/obj/machinery/media/jukebox/proc/explode()
	walk_to(src,0)
	src.visible_message("<span class='danger'>\the [src] blows apart!</span>", 1)

	explosion(src.loc, 0, 0, 1, rand(1,2), 1)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()

	new /obj/effect/decal/cleanable/blood/oil(src.loc)
	qdel(src)

/obj/machinery/media/jukebox/attackby(obj/item/W as obj, mob/user as mob)
	src.add_fingerprint(user)

	if(istype(W, /obj/item/weapon/wrench))
		if(playing)
			StopPlaying()
		user.visible_message("<span class='warning'>[user] has [anchored ? "un" : ""]secured \the [src].</span>", "<span class='notice'>You [anchored ? "un" : ""]secure \the [src].</span>")
		anchored = !anchored
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		power_change()
		update_icon()
		return
	return ..()

/obj/machinery/media/jukebox/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		StopPlaying()
		visible_message("<span class='danger'>\The [src] makes a fizzling sound.</span>")
		update_icon()
		return 1

/obj/machinery/media/jukebox/proc/StopPlaying()
	playing = 0
	update_use_power(1)
	update_icon()
	qdel_null(sound_token)


/obj/machinery/media/jukebox/proc/StartPlaying()
	StopPlaying()
	if(!current_track)
		return

	// Jukeboxes cheat massively and actually don't share id. This is only done because it's music rather than ambient noise.
	// It also has the "ignore_vis" flag so it can be heard through walls and zlevels
	sound_token = sound_player.PlayLoopingSound(src, sound_id, current_track.sound, volume = volume, range = 14, falloff = 3, prefer_mute = TRUE, ignore_vis = TRUE)

	playing = 1
	update_use_power(2)
	update_icon()

/obj/machinery/media/jukebox/proc/AdjustVolume(var/new_volume)
	volume = Clamp(new_volume, 0, 50)
	if(sound_token)
		sound_token.SetVolume(volume)
