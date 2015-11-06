/obj/item/passport
	name = "passport"
	icon_state = "passport2"
	w_class = 2

	var/_color = 0
	var/open = 0

/obj/item/passport/New()
	_color = pick(1,2,3)
	icon_state = "passport[_color]"

/obj/item/passport/attack_self(mob/user as mob)
	if(!open)
		open = 1
	else
		open = 0
	icon_state = "passport[_color][open ? "-o" : ""]"
	user << sound('passport.ogg')

/obj/item/passport/gold
	icon_state = "passport5"

/obj/item/passport/gold/New()
	_color = pick(4,5)
	icon_state = "passport[_color]"