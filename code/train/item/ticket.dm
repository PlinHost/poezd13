/obj/item/ticket
	name = "ticket"
	icon_state = "ticket"
	w_class = 2

	var/state = 0

/obj/item/ticket/attack_self(mob/user as mob)
	if(!state)
		state = 1
		icon_state = "ticket_cut"
		var/list/mob/heared_by = hearers(2, get_turf(src))
		heared_by << sound('ticket.ogg')