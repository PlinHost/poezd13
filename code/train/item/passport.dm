/obj/item/passport
	name = "passport"
	icon_state = "passport2"
	w_class = 2
	slot_flags = SLOT_ID

	var/_color = 0
	var/open = 0
	var/registered_name = "Unknown"

/obj/item/passport/New(loc)
	_color = pick(1,2,3)
	icon_state = "passport[_color]"
	if(istype(loc, /mob/living/carbon/human))
		registered_name = loc:real_name

/obj/item/passport/attack_self(mob/user as mob)
	if(!open)
		open = 1
		desc = "Belongs to [registered_name]."
	else
		open = 0
		desc = initial(desc)
	icon_state = "passport[_color][open ? "-o" : ""]"
	user << sound('passport.ogg')

/obj/item/passport/gold
	icon_state = "passport5"

/obj/item/passport/gold/New(loc)
	_color = pick(4,5)
	icon_state = "passport[_color]"
	if(istype(loc, /mob/living/carbon/human))
		registered_name = loc:real_name