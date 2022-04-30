extends "res://src/Upgrades.gd"

const CLICKS: int = 2

func _ready():
	fichas_por_seg = 0
	BASE_PRICE = 15.0
	price = BASE_PRICE
	$HBoxContainer2/Price.text = "Precio: " + str(price) + postfixes_dict[str(exponent)] +" fichas"
	
func add_level(level: int):
	match level: #Unlock one lv of upgrade for this
		PersistentNode.unlockUpgradeLevel1:
			owner.modify_upgrades("click")
		PersistentNode.unlockUpgradeLevel2:
			owner.modify_upgrades("click")
		PersistentNode.unlockUpgradeLevel3:
			owner.modify_upgrades("click")
		PersistentNode.unlockUpgradeLevel4:
			owner.modify_upgrades("click")
		PersistentNode.unlockUpgradeLevel5:
			owner.modify_upgrades("click")

func _on_TextureButton_pressed():
	if owner.ask_upgrade(price, exponent, fichas_por_seg, 0):
		upgrade()
		owner.upgrade_click(CLICKS, 0)


func _on_Upgrades_click_upgrade_bought(photo, Lv):
	if Lv > upgrade_level: #Checks that the upgrade is better than the actual and replaces it
		$HBoxContainer/TextureRect.texture = photo
		upgrade_level = Lv
		upgrades_bought.append(Lv)
	owner.upgrade_click(0, 2.0)

func save():
	var save_dict = {
		"filename" : get_filename(),
		"path" : get_path(),
		"level" : level,
		"price" : price,
		"exponent" : exponent,
		"image_path" : $HBoxContainer/TextureRect.texture.get_path(),
		"upgrades_list" : ["click", upgrades_bought]
	}
	return save_dict
