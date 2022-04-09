extends "res://src/Upgrades.gd"

const CLICKS: int = 2

func _ready():
	fichas_por_seg = 0
	BASE_PRICE = 15.0
	price = BASE_PRICE
	$HBoxContainer2/Price.text = "Precio: " + str(price) + postfixes_dict[str(exponent)] +" fichas"
	
func add_level(level: int):
	match level: #Unlock one lv of upgrade for this
		60:
			owner.modify_upgrades("click")
		120:
			owner.modify_upgrades("click")	
		180:
			owner.modify_upgrades("click")
		240:
			owner.modify_upgrades("click")
		300:
			owner.modify_upgrades("click")

func _on_TextureButton_pressed():
	if owner.ask_upgrade(price, exponent, fichas_por_seg, 0):
		upgrade()
		owner.upgrade_click(CLICKS, 0)


func _on_Upgrades_click_upgrade_bought(photo, Lv):
	if Lv > upgrade_level: #Checks that the upgrade is better than the actual and replaces it
		$HBoxContainer/TextureRect.texture = photo
		upgrade_level = Lv
	owner.upgrade_click(0, 2.0)
