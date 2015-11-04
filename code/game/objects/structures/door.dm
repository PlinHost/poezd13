/obj/structure/door
	name = "wooden door"
	icon = 'icons/obj/doors/Door_wooden.dmi'
	icon_state = "door1"

	density = 1
	anchored = 1
	opacity = 1

	var/state = 0 //closed, 1 == open
	var/isSwitchingStates = 0
	var/locked = 0
	var/health = 100

	New(location)
		..()
		update_nearby_tiles(need_rebuild=1)

	Destroy()
		update_nearby_tiles()
		..()

	attack_ai(mob/user as mob) //those aren't machinery, they're just big fucking slabs of a mineral
		if(isAI(user)) //so the AI can't open it
			return
		else if(isrobot(user)) //but cyborgs can
			if(get_dist(user,src) <= 1) //not remotely though
				return TryToSwitchState(user)

	attack_paw(mob/user as mob)
		return TryToSwitchState(user)

	attack_hand(mob/user as mob)
		return TryToSwitchState(user)

	CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
		if(air_group) return 0
		if(istype(mover, /obj/effect/beam))
			return !opacity
		return !density

	proc/TryToSwitchState(atom/user)
		if(isSwitchingStates) return
		if(locked)
			flick("door_deny",src)
			return
		if(ismob(user))
			var/mob/M = user
			if(world.time - user.last_bumped <= 60) return //NOTE do we really need that?
			if(M.client)
				if(iscarbon(M))
					var/mob/living/carbon/C = M
					if(!C.handcuffed)
						SwitchState()
				else
					SwitchState()
		else if(istype(user, /obj/mecha))
			SwitchState()

	proc/SwitchState()
		if(state)
			Close()
		else
			Open()

	proc/Open()
		isSwitchingStates = 1
		playsound(loc, 'sound/effects/doorcreaky.ogg', 100, 1)
		flick("doorc0",src)
		sleep(10)
		density = 0
		opacity = 0
		state = 1
		update_icon()
		isSwitchingStates = 0

	proc/Close()
		isSwitchingStates = 1
		playsound(loc, 'sound/effects/doorcreaky.ogg', 100, 1)
		flick("doorc1",src)
		sleep(10)
		density = 1
		opacity = 1
		state = 0
		update_icon()
		isSwitchingStates = 0

	update_icon()
		if(state)
			icon_state = "door0"
		else
			icon_state = "door1"

	attackby(obj/item/weapon/W as obj, mob/user as mob)
		if(istype(W,/obj/item/weapon)) //not sure, can't not just weapons get passed to this proc?
			if(istype(W, /obj/item/weapon/key))
				if(!state)
					locked = !locked
					user.visible_message("<span class='notice'>[user.name] [locked ? "locks" : "unlocks"] the [name] with [W.name].</span>")
					src.visible_message("<span class='notice'>The [name] softly clicks.</span>")
					return
			var/damage
			if(W.sharp && (W.force >= 10))
				damage = rand(W.force-5, W.force+5)
				health -= damage
			user.visible_message("<span class='attack'>[user.name] hits the [name] with [W.name]!</span>")
			if(damage)
				src.visible_message("<span class='warning'>A loud crack comes from the [name]!</span>","","<span class='warning'>You hear some wood cracking.</span>")
				CheckHealth()
		else
			attack_hand(user)
		return

	proc/CheckHealth()
		if(health <= 0)
			Dismantle(1)

	proc/Dismantle()
		for(var/i = 1, i <= 5, i++)
			new/obj/item/stack/sheet/wood(get_turf(src))
		qdel(src)



/obj/item/weapon/key
	name = "some old key"
	desc = "A long time ago such keys were used to open doors. Years before the ID-locks were invented."
	icon = 'icons/obj/doors/Door_wooden.dmi'
	icon_state = "key"
	flags = FPRINT | TABLEPASS| CONDUCT
	force = 1.0
	w_class = 1.0
	throwforce = 2.0
	throw_speed = 3
	throw_range = 5
	m_amt = 50
	attack_verb = list("hit", "attacked")