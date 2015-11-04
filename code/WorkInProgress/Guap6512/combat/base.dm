//It's not a very big change, but I think melee will benefit from it.
//Currently will only be restricted to special training weapons to test the balancedness of the system.
//1)Knockdown, stun and weaken chances are separate and dependant on the part of the body you're aiming at
//eg a mop will be better applied to legs since it has a higher base knockdown chance than the other disabling states
//while an energy gun would be better applied to the chest because of the stunning chance.
//2)Weapons also have a parry chance which is checked every time the one wielding the weapon is attacked in melee
//in the area is currently aiming at and is able to defend himself.
//More ideas to come.

//NOTES: doesn't work with armor yet

/obj/item/weapon/training //subclass of weapons that is currently the only one that uses the alternate combat system

	name = "training weapon"
	desc = "A weapon for training the advanced fighting technicues"
	icon = 'icons/obj/weapons.dmi'
	var/chance_parry = 0
	var/chance_knockdown = 0
	var/chance_knockout = 0
	var/chance_disarm = 0
	var/is_shield = 0


//chances - 5 is low, 10 is medium, 15 is good

/obj/item/weapon/training/axe //hard-hitting, but doesn't have much in terms of disabling people (except by killing)
	name = "battle axe"
	icon_state = "hatchet"
	/*combat stats*/
	force = 15
	edge = 1
	chance_parry = 5
	chance_weaken = 10
	chance_stun = 5
	chance_knockdown = 5
	chance_knockout = 5
	chance_disarm = 0

/obj/item/weapon/training/sword //not bad attack, good at parrying and disarming
	name = "battle sword"
	icon_state = "claymore"
	/*combat stats*/
	force = 10
	sharp = 1
	chance_parry = 30
	chance_weaken = 5
	chance_stun = 0
	chance_knockdown = 5
	chance_knockout = 0
	chance_disarm = 20

/obj/item/weapon/training/shield
	name = "buckler"
	icon_state = "buckler"
	chance_parry = 60
	is_shield = 1

/obj/item/weapon/training/hammer
	name = "battle hammer"
	icon_state = "sledgehammer"
	force = 20
	chance_parry = 5
	chance_weaken = 30
	chance_stun = 30
	chance_knockdown = 20
	chance_knockout = 50
	chance_disarm = 60


/obj/item/weapon/training/staff //not bad attack either, good at tripping and parrying
	name = "training staff"
	icon_state = "training_staff"
	/*combat stats*/
	force = 10
	chance_parry = 15
	chance_weaken = 5
	chance_stun = 0
	chance_knockdown = 15
	chance_knockout = 0
	chance_disarm = 10

/obj/item/weapon/training/mace //worst attack, but has a good chance of stun, knockout or weaken
	name = "training mace"
	icon_state = "training_mace"
	/*combat stats*/
	force = 5
	chance_parry = 0
	chance_weaken = 15
	chance_stun = 10
	chance_knockdown = 0
	chance_knockout = 10
	chance_disarm = 0

/obj/item/weapon/training/attack(target as mob, mob/user as mob)

	if((!istype(target, /mob/living/carbon)) || (!istype(user, /mob/living/carbon)))
		..()
		return
	var/mob/living/carbon/human/A = user
	var/mob/living/carbon/human/T = target
	var/target_area = A.zone_sel.selecting
	var/datum/organ/external/organ = T.get_organ(target_area)
	for(var/mob/O in viewers(target))
		O << "\red \b [A.name] attacks [T.name] in the [organ.display_name] with [src.name]!"
	if(T.stat < 2) //parrying occurs here
		if(!(T.dir == src.dir))					//To prevent blocking with ass.
			if(istype(T.r_hand,/obj/item/weapon/training) && (T.zone_sel.selecting == target_area || T.r_hand.IsShield()))
				if(prob(T.r_hand:chance_parry))
					T.visible_message("\red \b [T.name] deftly parries the attack with [T.r_hand.name]!")
					if(prob(chance_disarm))
						T.visible_message("\red \b The [T.r_hand.name] flies out of [T.name]'s hands!")
						var/obj/item/R = T.r_hand
						T.drop_r_hand()
						R.throw_at(get_step(R,pick(cardinal)),R.throw_range, R.throw_speed, T)
					return
			if(istype(T.l_hand,/obj/item/weapon/training) && (T.zone_sel.selecting == target_area || T.l_hand.IsShield()))
				if(prob(T.l_hand:chance_parry))
					T.visible_message("\red \b [T.name] deftly parries the attack with [T.l_hand.name]!")
					if(prob(chance_disarm))
						T.visible_message("\red \b The [T.l_hand.name] flies out of [T.name]'s hands!")
						var/obj/item/L = T.l_hand
						T.drop_l_hand()
						L.throw_at(get_step(L,pick(cardinal)),L.throw_range, L.throw_speed, T)
					return

	T.apply_damage(src.force, BRUTE, target_area, 0, src.sharp)

	var/modifier_knockdown = 1.0
	var/modifier_knockout = 0.0
	var/modifier_disarm = 0.0
	var/drop_hand = 0

	switch(target_area)
		if("eyes")
			modifier_knockdown = 0.0
			modifier_knockout = 1.5
		if("head")
			modifier_knockout = 1.5
			modifier_knockdown = 0.0
		if("chest")
			modifier_knockdown = 1.0
		if("right arm","r_arm","right hand","r_hand")
			modifier_disarm = 2
			drop_hand = 1
		if("left arm","l_arm","left hand","l_hand")
			modifier_disarm = 2
			drop_hand = 2
		if("groin")
		if("right leg","r_leg","left leg","l_leg","right foot","r_foot","left foot","l_foot")
			modifier_knockdown = 1.5

	if(prob(chance_disarm * modifier_disarm))
		if(drop_hand == 1 && T.r_hand)
			T.visible_message("\red \b [T.name] drops their [T.r_hand.name]!")
			T.drop_r_hand()
		else if(drop_hand == 2 && T.l_hand)
			T.visible_message("\red \b [T.name] drops their [T.l_hand.name]!")
			T.drop_l_hand()

	if(prob(chance_knockdown * modifier_knockdown))
		T.Weaken(1)
		for(var/mob/O in viewers(target))
			O << "\red \b [T.name] has been knocked down!"

	if(prob(chance_knockout * modifier_knockout))
		T.apply_effect(10, PARALYZE)
		for(var/mob/O in viewers(target))
			O << "\red \b [T.name] has been knocked out!"
