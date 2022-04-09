extends Upgrade

func _ready():
	fichas_por_seg = 500
	BASE_PRICE = 12
	exponent = 1
	price = BASE_PRICE
	$HBoxContainer2/Price.text = "Precio: " + str(price) + postfixes_dict[str(exponent)] +" fichas"

func add_level(level: int):
	match level: #Unlock one lv of upgrade for this
		100:
			owner.modify_upgrades("camara")
		200:
			owner.modify_upgrades("camara")	
		300:
			owner.modify_upgrades("camara")


func _on_Upgrades_camara_upgrade_bought(photo, Lv):
	if Lv > upgrade_level: #Checks that the upgrade is better than the actual and replaces it
		$HBoxContainer/TextureRect.texture = photo
		upgrade_level = Lv
	match Lv:
		1:
			owner.ask_upgrade(0, 0, fichas_por_seg * 0.25 * level, 0)
			fichas_por_seg += fichas_por_seg * 0.25
		2:
			owner.ask_upgrade(0, 0, fichas_por_seg * 0.50 * level, 0)
			fichas_por_seg += fichas_por_seg * 0.50
		3:
			owner.ask_upgrade(0, 0, fichas_por_seg * level, 0)
			fichas_por_seg += fichas_por_seg
