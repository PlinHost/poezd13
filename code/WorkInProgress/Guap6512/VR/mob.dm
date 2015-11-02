/mob/living/cyber
	var/real_owner = null
	icon = 'icons/mob/cyber.dmi'
	icon_state = "mob"


/mob/living/cyber/death()
	var/atom/movable/overlay/animation = null
	canmove = 0
	icon = null
	invisibility = 101

	animation = new(loc)
	animation.icon_state = "blank"
	animation.icon = 'icons/mob/cyber.dmi'
	animation.dir = src.dir
	animation.master = src

	src << "<b><font size = 4>You died.</font></b>"
	src << "<b>This session will be terminated.</b>"
	src << "\red <i>Returning to the real world...</i>"

	flick("destroy", animation)

	spawn(10)
		return_VR()

	..()