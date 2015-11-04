/mob/dead/observer/proc/candlecheck()
	var/count = 0
	var/total_wax = 0
	for(var/dir in cardinal)
		var/turf/T = get_turf(src)
		T = get_step(T, dir)
		T = get_step(T, dir)			//Таким образом, свеча должна стоять в ДВУХ тайлах от него, не в одном. Вроде бы.
		if(!T)
			return 0
		var/obj/item/weapon/flame/candle/C = locate() in T
		if(C && C.lit)
			count++
			total_wax += C.wax

	if(count < 4)
		return 0
	else
		return total_wax


