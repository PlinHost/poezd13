var/train_location = 0
var/train_time = 0

/area/train
	name = "Train"
	icon_state = "shuttle"
	requires_power = 0
	luminosity = 1
	ul_Lighting = 0

/area/train/stop

/area/train/go

/area/train/gonight
	luminosity = 0
	ul_Lighting = 1

proc/move_train()
	set category = "Train"
	set name = "Move"
	set desc = "Start or stop the train"
	var/area/fromArea
	var/area/toArea
	if(train_location)
		if(train_time)
			fromArea = locate(/area/train/gonight)
		else
			fromArea = locate(/area/train/go)
		toArea = locate(/area/train/stop)
		train_location = 0
		world << sound(null, 0, 0, 917)
	else
		fromArea = locate(/area/train/stop)
		if(train_time)
			toArea = locate(/area/train/gonight)
		else
			toArea = locate(/area/train/go)
		train_location = 1
		world << sound('train_loop.ogg', 1, 0, 917, 20)
	fromArea.move_contents_to(toArea)
	return

proc/toggle_train()
	set category = "Train"
	set name = "Toggle"
	set desc = "Toggle day/night"
	var/area/fromArea
	var/area/toArea
	if(train_location)
		if(train_time)
			fromArea = locate(/area/train/gonight)
			toArea = locate(/area/train/go)
		else
			fromArea = locate(/area/train/go)
			toArea = locate(/area/train/gonight)
	if(train_time)
		train_time = 0
	else
		train_time = 1
	fromArea.move_contents_to(toArea)
	return

/obj/effect/step_trigger/kebab
	Trigger(var/atom/A)
		if(istype(A, /mob))
			var/mob/M = A
			if(M.client)
				M << "You are lost forever."
		qdel(A)