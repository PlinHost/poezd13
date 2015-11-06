/obj/item/weapon/saber
	name = "saber"
	icon_state = "saber"
	item_state = "saber"
	flags = FPRINT | TABLEPASS
	force = 25
	sharp = 1
	edge = 1
	throwforce = 1
	w_class = 3
	attack_verb = list("attacked", "slashed", "sliced", "torn", "ripped", "diced", "cut")

	suicide_act(mob/user)
		viewers(user) << "\red <b>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</b>"
		return(BRUTELOSS)

/obj/item/weapon/saber/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	playsound(loc, 'sound/weapons/bladeslice.ogg', 50, 1, -1)
	return ..()

/obj/item/sheath
	name = "sheath"
	icon = 'weapons.dmi'
	icon_state = "ssheath"
	slot_flags = SLOT_BELT
	w_class = 4
	var/obj/item/weapon/saber/saber

/obj/item/sheath/MouseDrop(atom/over_object)
	if(ishuman(usr))
		var/mob/living/carbon/human/M = usr
		if (!( istype(over_object, /obj/screen) ))
			return ..()
		if ((!( M.restrained() ) && !( M.stat ) && M.belt == src))
			if (over_object.name == "r_hand")
				M.u_equip(src)
				M.put_in_r_hand(src)
			else if (over_object.name == "l_hand")
				M.u_equip(src)
				M.put_in_l_hand(src)
			M.update_inv_wear_suit()
			src.add_fingerprint(usr)

/obj/item/sheath/attackby(obj/item/weapon/saber/W as obj, mob/user as mob)
	if(!istype(W) || src.loc != user)
		return ..()

	user.u_equip(W)
	var/list/mob/heared_by = hearers(get_turf(src))
	heared_by << sound('saberput.ogg')
	W.loc = src
	saber = W
	if ((user.client && user.s_active != src))
		user.client.screen -= W
	W.dropped(user)
	update_icon()
	user.update_icons()

/obj/item/sheath/attack_hand(mob/user as mob)
	if(src.loc == user && saber)
		saber.attack_hand(user)
		if(saber.loc != src)
			var/list/mob/heared_by = hearers(get_turf(src))
			heared_by << sound('saberemove.ogg')
			saber = null
			update_icon()
			user.update_icons()
	else
		return ..()

/obj/item/sheath/update_icon()
	if(saber)
		icon_state = "[initial(icon_state)]-f"
	else
		icon_state = initial(icon_state)


/obj/item/sheath/gold
	icon_state = "gsheath"