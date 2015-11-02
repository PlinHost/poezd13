///mob/var/virtual = 0
///mob/var/real_owner = null


/mob/living/proc/go_VR()
	if(key)
		var/obj/effect/landmark/vrstart = locate("landmark*CyberSpace")
		var/mob/living/cyber/avatar = new(vrstart.loc)
//		avatar.can_return = can_return
		avatar.real_owner = src
		avatar.key = key
		avatar.real_name = src.real_name
		avatar.name = src.real_name
		return avatar


/mob/living/cyber/proc/return_VR()

	if(!real_owner)
		return
	if(key)
		var/mob/M = real_owner
		M.key = key


/obj/machinery/vrpod
	name = "VR Pod"
	desc = "A pod for entering Virtual Reality."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "vr_pod_0"
	density = 1
	anchored = 1
	var/orient = "LEFT"

	relaymove(mob/user as mob)
		if (user.stat)
			return
		src.go_out()
		return

	proc/go_out()
		if (!( src.occupant ))
			return
		for(var/obj/O in src)
			O.loc = src.loc
			//Foreach goto(30)
		if (src.occupant.client)
			src.occupant.client.eye = src.occupant.client.mob
			src.occupant.client.perspective = MOB_PERSPECTIVE
		src.occupant.loc = src.loc
		src.occupant = null
		src.icon_state = "sleeper_0"
		return

	verb/eject()
		set src in oview(1)
		set category = "Object"
		set name = "Eject VR Pod"

		if (usr.stat != 0)
			return
		src.go_out()
		add_fingerprint(usr)
		return

	verb/move_inside()
		set name = "Enter VR Pod"
		set category = "Object"
		set src in oview(1)

		if(usr.stat != 0 || !(ishuman(usr) || ismonkey(usr)))
			return

		if(src.occupant)
			usr << "\blue <B>The VR Pod is already occupied!</B>"
			return

		for(var/mob/living/carbon/slime/M in range(1,usr))
			if(M.Victim == usr)
				usr << "You're too busy getting your life sucked out of you."
				return
		visible_message("[usr] starts climbing into the VR Pod.", 3)
		if(do_after(usr, 20))
			if(src.occupant)
				usr << "\blue <B>The VR Pod is already occupied!</B>"
				return
			usr.stop_pulling()
			usr.client.perspective = EYE_PERSPECTIVE
			usr.client.eye = src
			usr.loc = src
			src.occupant = usr
			src.icon_state = "sleeper_1"
			if(orient == "RIGHT")
				icon_state = "sleeper_1-r"

			for(var/obj/O in src)
				del(O)
			src.add_fingerprint(usr)
			usr << "\blue <b>You feel cool air surround you.</b>"
			sleep(1)
			usr << "\blue <b>Initialising controls...</b>"
			sleep(10)
			usr << "\blue <b>Initialisations complete. Launching controller...</b>"
/*			if(occupant.virtual)
				occupant.return_VR()
				del(occupant)
				src.occupant = null
				src.icon_state = "sleeper_0"
				return
			else*/
			occupant.go_VR()
			usr << "\red <b>Remember: You can leave VR either by dying here, or by clinbing into the VR-pod.</b>"

			return
		return