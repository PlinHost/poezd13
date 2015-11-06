/obj/item/umbrella
	name = "umbrella"
	icon_state = "umbrella"
	item_state = "umbrella"
	w_class = 4

	var/open = 0

/obj/item/umbrella/attack_self(mob/user as mob)
	if(!open)
		open = 1
		w_class = 5
	else
		open = 0
		w_class = 4
	icon_state = "umbrella[open ? "-o" : ""]"
	item_state = "umbrella[open ? "-o" : ""]"
	user.update_icons()
	user << sound('umbrella.ogg')