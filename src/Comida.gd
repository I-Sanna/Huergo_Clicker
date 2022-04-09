extends "res://src/Upgrades.gd"

func _ready():
	fichas_por_seg = 1400
	BASE_PRICE = 1.4
	exponent = 2
	price = BASE_PRICE
	$HBoxContainer2/Price.text = "Precio: " + str(price) + postfixes_dict[str(exponent)] +" fichas"
	
func add_level(level: int):
	match level: #Unlock one lv of upgrade for this
		100:
			owner.modify_upgrades("comida")
		200:
			owner.modify_upgrades("comida")	
		300:
			owner.modify_upgrades("comida")	
		400:
			owner.modify_upgrades("comida")	


func _on_Upgrades_comida_upgrade_bought(photo, Lv):
	if Lv > upgrade_level: #Checks that the upgrade is better than the actual and replaces it
		$HBoxContainer/TextureRect.texture = photo
		upgrade_level = Lv
	
	match Lv:
		1:
			owner.ask_upgrade(0, 0, fichas_por_seg * 0.1 * level, 0)
			fichas_por_seg += fichas_por_seg * 0.1
		2:
			owner.ask_upgrade(0, 0, fichas_por_seg * 0.3 * level, 0)
			fichas_por_seg += fichas_por_seg * 0.3
		3:
			owner.ask_upgrade(0, 0, fichas_por_seg * 0.6 * level, 0)
			fichas_por_seg += fichas_por_seg * 0.6
		4:
			owner.ask_upgrade(0, 0, fichas_por_seg * level, 0)
			fichas_por_seg += fichas_por_seg
			
