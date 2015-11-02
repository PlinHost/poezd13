/obj/machinery/cybernode
	icon = 'cyber.dmi'
	icon_state = "node"

/obj/machinery/cybernode/proc/search()
	if(!area_group)
		return

	for(var/obj/machinery/computer/C in machines)
		if(C.cyber_tag
