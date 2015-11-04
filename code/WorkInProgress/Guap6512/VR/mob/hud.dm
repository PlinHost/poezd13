/datum/hud/proc/cyber_hud()

	src.adding = list()
//	src.other = list()

	var/obj/screen/using

	using = new /obj/screen() //Soft Blue Layer
//	using.dir = SOUTH
	using.icon = 'icons/mob/screen1_full.dmi'
	using.icon_state = "cyber_hud"
	using.screen_loc = "1,1"
	using.layer = 23
	adding += using


	mymob.client.screen = list()

	mymob.client.screen += src.adding// + src.other