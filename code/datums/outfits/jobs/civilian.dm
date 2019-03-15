/decl/hierarchy/outfit/job/assistant
	name = OUTFIT_JOB_NAME("Assistant")

/decl/hierarchy/outfit/job/service
	l_ear = /obj/item/device/radio/headset/headset_service
	hierarchy_type = /decl/hierarchy/outfit/job/service

/decl/hierarchy/outfit/job/service/bartender
	name = OUTFIT_JOB_NAME("Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	id_type = /obj/item/weapon/card/id/civilian/bartender
	pda_type = /obj/item/device/pda/bar

/decl/hierarchy/outfit/job/service/chef
	name = OUTFIT_JOB_NAME("Chef")
	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/chef
	head = /obj/item/clothing/head/chefhat
	id_type = /obj/item/weapon/card/id/civilian/chef
	pda_type = /obj/item/device/pda/chef

/decl/hierarchy/outfit/job/service/gardener
	name = OUTFIT_JOB_NAME("Gardener")
	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/apron
	gloves = /obj/item/clothing/gloves/thick/botany
	r_pocket = /obj/item/device/analyzer/plant_analyzer
	backpack = /obj/item/weapon/storage/backpack/hydroponics
	satchel_one = /obj/item/weapon/storage/backpack/satchel_hyd
	id_type = /obj/item/weapon/card/id/civilian/botanist
	pda_type = /obj/item/device/pda/botanist
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/hyd

/decl/hierarchy/outfit/job/service/janitor
	name = OUTFIT_JOB_NAME("Janitor")
	uniform = /obj/item/clothing/under/rank/janitor
	id_type = /obj/item/weapon/card/id/civilian/janitor
	pda_type = /obj/item/device/pda/janitor

/decl/hierarchy/outfit/job/librarian
	name = OUTFIT_JOB_NAME("Librarian")
	uniform = /obj/item/clothing/under/suit_jacket/red
	l_hand = /obj/item/weapon/barcodescanner
	id_type = /obj/item/weapon/card/id/civilian/librarian
	pda_type = /obj/item/device/pda/librarian

/decl/hierarchy/outfit/job/internal_affairs_agent
	name = OUTFIT_JOB_NAME("Internal affairs agent")
	l_ear = /obj/item/device/radio/headset/ia
	uniform = /obj/item/clothing/under/rank/internalaffairs
	suit = /obj/item/clothing/suit/storage/toggle/internalaffairs
	shoes = /obj/item/clothing/shoes/brown
	glasses = /obj/item/clothing/glasses/sunglasses/big
	l_hand = /obj/item/weapon/storage/briefcase
	id_type = /obj/item/weapon/card/id/civilian/internal_affairs_agent
	pda_type = /obj/item/device/pda/lawyer

/decl/hierarchy/outfit/job/chaplain
	name = OUTFIT_JOB_NAME("Chaplain")
	uniform = /obj/item/clothing/under/rank/chaplain
	l_hand = /obj/item/weapon/storage/bible
	id_type = /obj/item/weapon/card/id/civilian/chaplain
	pda_type = /obj/item/device/pda/chaplain

// Darkholm's Dungeon (Re-)Additions
/decl/hierarchy/outfit/clown
	name = "Clown"
	uniform = /obj/item/clothing/under/rank/clown
	back = /obj/item/weapon/storage/backpack/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_ear = /obj/item/device/radio/headset
	r_pocket = /obj/item/weapon/bikehorn
	l_pocket = /obj/item/weapon/pen/crayon/rainbow

	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/clown
	pda_type = /obj/item/device/pda/clown
	id_pda_assignment = "Jabroni"

/decl/hierarchy/outfit/prostitute
	name = "Prostitute"
	uniform = /obj/item/clothing/under/stripper/mankini
	suit = /obj/item/clothing/suit/chameleon
	shoes = /obj/item/clothing/shoes/sandal
	mask = /obj/item/clothing/mask/muzzle/tape
	l_ear = /obj/item/device/radio/headset
	r_pocket = /obj/item/weapon/dildo

	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/clown
	pda_type = /obj/item/device/pda/clown
	id_pda_assignment = "Jabroni"