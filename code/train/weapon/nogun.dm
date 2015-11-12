/obj/item/weapon/gun/projectile/revolver/nogun
	name = "nagan"
	desc = ""
	icon_state = "nogun"
	mag_type = /obj/item/ammo_magazine/internal/cylinder/nogun

/obj/item/weapon/gun/projectile/revolver/nogun/attackby(var/obj/item/A as obj, mob/user as mob)
	if(istype(A, /obj/item/ammo_magazine/stack))
		var/obj/item/ammo_magazine/AM = A
		for(var/obj/item/ammo_casing/AC in AM.stored_ammo)
			if(magazine.give_round(AC))
				AM.stored_ammo -= AC
				user << "<span class='notice'>You load a shell into \the [src]!</span>"
				update_icon()
				chamber_round()
				AM.update_icon()
				return 1
			else
				return 0
	else
		return ..()

/obj/item/ammo_magazine/internal/cylinder/nogun
	name = "nagan cylinder"
	caliber = "7.62"
	ammo_type = /obj/item/ammo_casing/nogun

/obj/item/ammo_casing/nogun
	caliber = "7.62"
	projectile_type = /obj/item/projectile/bullet/nogun

/obj/item/ammo_casing/nogun/attackby(var/obj/item/A as obj, mob/user as mob)
	if(istype(A, /obj/item/ammo_casing/nogun))
		var/obj/item/ammo_magazine/stack/S = new(user.loc, 1)
		S.attackby(src, user)
		S.attackby(A, user)
		S.attack_hand(user)

/obj/item/projectile/bullet/nogun
	damage = 25

/obj/item/ammo_magazine/stack
	name = "ammo stack"
	icon_state = "nogun"
	caliber = "7.62"
	ammo_type = /obj/item/ammo_casing/nogun
	max_ammo = 7
	multiple_sprites = 1

	New(loc, var/empty)
		if(!empty)
			return ..()

	update_icon()
		if(!ammo_count())
			if(istype(src.loc, /mob))
				//var/mob/M = src.loc
				//M.before_take_item(src)
				src.loc:before_take_item(src)
			qdel(src)
		return ..()