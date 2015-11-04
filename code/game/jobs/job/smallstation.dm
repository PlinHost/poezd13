/datum/job/captain
	title = "Captain"
	flag = CAPTAIN
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Nanotrasen officials and Space law"
	selection_color = "#ccccff"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/captain(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/captain(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_cap(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		var/obj/item/clothing/under/U = new /obj/item/clothing/under/rank/captain/green(H)
		if(H.age>49)
			U.hastie = new /obj/item/clothing/tie/medal/gold/captain(U)
		H.equip_to_slot_or_del(U, slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/revolver/captain(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/ammo_magazine/internal/cylinder/rev38(H), slot_r_store)
		H.equip_to_slot_or_del(new /obj/item/device/pda/captain(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/brown(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/caphat(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_glasses)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/ids(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/ids(H.back), slot_in_backpack)
//		var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
//		L.imp_in = H
//		L.implanted = 1
		world << "<b>[H.real_name] is the captain!</b>"
//		var/datum/organ/external/affected = H.organs_by_name["head"]
//		affected.implants += L
//		L.part = affected
		return 1

	get_access()
		return get_all_accesses()



//Food
/datum/job/bartender
	title = "Bartender"
	flag = BARTENDER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	access = list(access_maint_tunnels, access_hydroponics, access_bar, access_kitchen, access_morgue)
	minimal_access = list(access_bar)


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_norm(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/bartender(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/chefhat(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/device/analyzer/plant_analyzer(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/device/pda/bar(H), slot_belt)

		if(H.backbag == 1)
			var/obj/item/weapon/storage/box/survival/Barpack = new /obj/item/weapon/storage/box/survival(H)
			H.equip_to_slot_or_del(Barpack, slot_r_hand)
			new /obj/item/ammo_casing/shotgun/beanbag(Barpack)
			new /obj/item/ammo_casing/shotgun/beanbag(Barpack)
			new /obj/item/ammo_casing/shotgun/beanbag(Barpack)
			new /obj/item/ammo_casing/shotgun/beanbag(Barpack)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/ammo_casing/shotgun/beanbag(H), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/ammo_casing/shotgun/beanbag(H), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/ammo_casing/shotgun/beanbag(H), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/ammo_casing/shotgun/beanbag(H), slot_in_backpack)

		return 1

//Cargo
/datum/job/qm
	title = "Quartermaster"
	flag = QUARTERMASTER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	idtype = /obj/item/weapon/card/id/qm
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station)


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_cargo(H), slot_l_ear)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/cargo(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/brown(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/quartermaster(H), slot_belt)
//		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_glasses)
		H.equip_to_slot_or_del(new /obj/item/weapon/clipboard(H), slot_l_hand)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		return 1


/datum/job/mining
	title = "Shaft Miner"
	flag = MINER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the quartermaster and the head of personnel"
	selection_color = "#dddddd"
	idtype = /obj/item/weapon/card/id/engie
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station)
	minimal_access = list(access_mining, access_mint, access_mining_station, access_mailsorting)


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_cargo (H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/industrial(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_eng(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/miner(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/device/pda/shaftminer(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
//		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/weapon/crowbar(H), slot_l_hand)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/bag/ore(H), slot_l_store)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/weapon/crowbar(H), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/bag/ore(H), slot_in_backpack)
		return 1


/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	access = list(access_janitor, access_maint_tunnels)
	minimal_access = list(access_janitor, access_maint_tunnels)


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/janitor(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/janitor(H), slot_belt)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		return 1



//More or less assistants
/datum/job/librarian
	title = "Librarian"
	flag = LIBRARIAN
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	access = list(access_library, access_maint_tunnels)
	minimal_access = list(access_library)


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/red(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/device/pda/librarian(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/weapon/barcodescanner(H), slot_l_hand)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		return 1




//Chaplain
/datum/job/chaplain
	title = "Chaplain"
	flag = CHAPLAIN
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	idtype = /obj/item/weapon/card/id/chaplain
	access = list(access_maint_tunnels, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels)
	minimal_access = list(access_morgue, access_chapel_office, access_crematorium)


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0

		var/obj/item/weapon/storage/bible/B = new /obj/item/weapon/storage/bible(H) //BS12 EDIT
		H.equip_to_slot_or_del(B, slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chaplain(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/device/pda/chaplain(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		spawn(0)
			var/religion_name = "Christianity"
			var/new_religion = sanitize(input(H, "You are the crew services officer. Would you like to change your religion? Default is Christianity, in SPACE.", "Name change", religion_name))

			if (!new_religion)
				new_religion = religion_name

			switch(lowertext(new_religion))
				if("christianity")
					B.name = pick("The Holy Bible","The Dead Sea Scrolls")
				if("satanism")
					B.name = "The Unholy Bible"
				if("cthulu")
					B.name = "The Necronomicon"
				if("islam")
					B.name = "Quran"
				if("scientology")
					B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
				if("chaos")
					B.name = "The Book of Lorgar"
				if("imperium")
					B.name = "Uplifting Primer"
				if("toolboxia")
					B.name = "Toolbox Manifesto"
				if("homosexuality")
					B.name = "Guys Gone Wild"
				//if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks")
				//	B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition")
				//	H.setBrainLoss(100) // starts off retarded as fuck
				if("science")
					B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
				else
					B.name = "The Holy Book of [new_religion]"

		spawn(1)
			var/deity_name = "Space Jesus"
			var/new_deity = sanitize(input(H, "Would you like to change your deity? Default is Space Jesus.", "Name change", deity_name))

			if ((length(new_deity) == 0) || (new_deity == "Space Jesus") )
				new_deity = deity_name
			B.deity_name = new_deity

			var/accepted = 0
			var/outoftime = 0
			spawn(200) // 20 seconds to choose
				outoftime = 1
			var/new_book_style = "Bible"

			while(!accepted)
				if(!B) break // prevents possible runtime errors
				new_book_style = input(H,"Which bible style would you like?") in list("Bible", "Koran", "Scrapbook", "Creeper", "White Bible", "Holy Light", "Athiest", "Tome", "The King in Yellow", "Ithaqua", "Scientology", "the bible melts", "Necronomicon")
				switch(new_book_style)
					if("Koran")
						B.icon_state = "koran"
						B.item_state = "koran"
						for(var/area/chapel/main/A in world)
							for(var/turf/T in A.contents)
								if(T.icon_state == "carpetsymbol")
									T.dir = 4
					if("Scrapbook")
						B.icon_state = "scrapbook"
						B.item_state = "scrapbook"
					if("Creeper")
						B.icon_state = "creeper"
						B.item_state = "syringe_kit"
					if("White Bible")
						B.icon_state = "white"
						B.item_state = "syringe_kit"
					if("Holy Light")
						B.icon_state = "holylight"
						B.item_state = "syringe_kit"
					if("Athiest")
						B.icon_state = "athiest"
						B.item_state = "syringe_kit"
						for(var/area/chapel/main/A in world)
							for(var/turf/T in A.contents)
								if(T.icon_state == "carpetsymbol")
									T.dir = 10
					if("Tome")
						B.icon_state = "tome"
						B.item_state = "syringe_kit"
					if("The King in Yellow")
						B.icon_state = "kingyellow"
						B.item_state = "kingyellow"
					if("Ithaqua")
						B.icon_state = "ithaqua"
						B.item_state = "ithaqua"
					if("Scientology")
						B.icon_state = "scientology"
						B.item_state = "scientology"
						for(var/area/chapel/main/A in world)
							for(var/turf/T in A.contents)
								if(T.icon_state == "carpetsymbol")
									T.dir = 8
					if("the bible melts")
						B.icon_state = "melted"
						B.item_state = "melted"
					if("Necronomicon")
						B.icon_state = "necronomicon"
						B.item_state = "necronomicon"
					else
						// if christian bible, revert to default
						B.icon_state = "bible"
						B.item_state = "bible"
						for(var/area/chapel/main/A in world)
							for(var/turf/T in A.contents)
								if(T.icon_state == "carpetsymbol")
									T.dir = 2

				H.update_inv_l_hand() // so that it updates the bible's item_state in his hand

				switch(input(H,"Look at your bible - is this what you want?") in list("Yes","No"))
					if("Yes")
						accepted = 1
					if("No")
						if(outoftime)
							H << "Welp, out of time, buddy. You're stuck. Next time choose faster."
							accepted = 1

			if(ticker)
				ticker.Bible_icon_state = B.icon_state
				ticker.Bible_item_state = B.item_state
				ticker.Bible_name = B.name
				ticker.Bible_deity_name = B.deity_name
		return 1


/datum/job/chief_engineer
	title = "Chief Engineer"
	flag = CHIEF
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffeeaa"
	idtype = /obj/item/weapon/card/id/ce
	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_player_age = 7


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/ce(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/industrial(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_eng(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chief_engineer(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/device/pda/heads/ce(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/brown(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat/white(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/utility/full(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(H.back), slot_in_backpack)
		return 1



/datum/job/engineer
	title = "Vessel Engineer"
	flag = ENGINEER
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the chief engineer"
	selection_color = "#fff5cc"
	idtype = /obj/item/weapon/card/id/engie
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction)


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/industrial(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_eng(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/engineer(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/orange(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/utility/full(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/device/t_scanner(H), slot_r_store)
		H.equip_to_slot_or_del(new /obj/item/device/pda/engineering(H), slot_l_store)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(H.back), slot_in_backpack)
		return 1



/datum/job/scientist
	title = "Scientist"
	flag = SCIENTIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the research director"
	selection_color = "#ffeeff"
	idtype = /obj/item/weapon/card/id/sci
	access = list(access_robotics, access_medical, access_tox, access_tox_storage, access_research, access_xenobiology, access_xenoarch)
	minimal_access = list(access_tox, access_medical, access_tox_storage, access_research, access_xenoarch)

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sci(H), slot_l_ear)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/scientist(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/toxins(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat/science(H), slot_wear_suit)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		return 1


/datum/job/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the research director"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/med
	access = list(access_maint_tunnels, access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics)
	minimal_access = list(access_medical, access_morgue, access_surgery, access_virology)

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)

		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/medical(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		return 1



//Chemist is a medical job damnit	//YEAH FUCK YOU SCIENCE	-Pete	//Guys, behave -Erro
/datum/job/chemist
	title = "Chemist"
	flag = CHEMIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the research director"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/chem
	access = list(access_maint_tunnels, access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics)
	minimal_access = list(access_medical, access_chemistry)


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chemist(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/chemist(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat/chemist(H), slot_wear_suit)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		return 1





/datum/job/hos
	title = "Head of Security"
	flag = HOS
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffdddd"
	idtype = /obj/item/weapon/card/id/hos
	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_player_age = 14

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/security(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_sec(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/hos(H), slot_l_ear)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/head_of_security(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/heads/hos(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
//		H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(H), slot_wear_mask) //Grab one from the armory you donk
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud(H), slot_glasses)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/gun(H), slot_s_store)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_store)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)
		var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
		L.imp_in = H
		L.implanted = 1
		var/datum/organ/external/affected = H.organs_by_name["head"]
		affected.implants += L
		L.part = affected
		return 1



/datum/job/officer
	title = "Security Officer"
	flag = OFFICER
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/sec
	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels)
	minimal_player_age = 3
	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/security(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_sec(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/security(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_s_store)
		H.equip_to_slot_or_del(new /obj/item/device/flash(H), slot_l_store)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)
		return 1
