/var/create_mob_html = null
/datum/admins/proc/create_mob(var/mob/user)
	if (!create_mob_html)
		var/mobjs = null
		mobjs = list2text(typesof(/mob), ";")
		create_mob_html = file2text('html/create_object.html')
		create_mob_html = text2list2text(create_mob_html, "null /* object types */", "\"[mobjs]\"")

	user << browse(text2list2text(create_mob_html, "/* ref src */", "\ref[src]"), "window=create_mob;size=425x475")
