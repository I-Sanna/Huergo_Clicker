extends "res://src/Upgrades.gd"

func _ready():
	fichas_por_seg = 7800
	BASE_PRICE = 20
	exponent = 2                                                                                                                                                                                                                                              
	price = BASE_PRICE
	$HBoxContainer2/Price.text = "Precio: " + str(price) + postfixes_dict[str(exponent)] +" fichas"

func add_level(level: int):
	match level: #Changes photo for each 100 levels|
		PersistentNode.unlockUpgradeLevel1:
			owner.modify_upgrades("mail")
		PersistentNode.unlockUpgradeLevel2:
			owner.modify_upgrades("mail")	


func _on_Upgrades_mail_upgrade_bought(photo, Lv):
	if Lv > upgrade_level: #Checks that the upgrade is better than the actual and replaces it
		$HBoxContainer/TextureRect.texture = photo
		upgrade_level = Lv
		upgrades_bought.append(Lv)
	match Lv:
		1:
			owner.ask_upgrade(0, 0, fichas_por_seg * 0.5 * level, 0)
			fichas_por_seg += fichas_por_seg * 0.5
		2:
			owner.ask_upgrade(0, 0, fichas_por_seg * level, 0)
			fichas_por_seg += fichas_por_seg
func save():
	var save_dict = {
		"filename" : get_filename(),
		"path" : get_path(),
		"level" : level,
		"price" : price,
		"exponent" : exponent,
		"image_path" : $HBoxContainer/TextureRect.texture.get_path(),
		"upgrades_list" : ["mail", upgrades_bought]
	}
	return save_dict
