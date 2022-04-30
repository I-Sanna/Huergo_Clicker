extends Upgrade

func _ready():
	fichas_por_seg = 1000
	BASE_PRICE = 130
	exponent = 1
	price = BASE_PRICE
	$HBoxContainer2/Price.text = "Precio: " + str(price) + postfixes_dict[str(exponent)] +" fichas"

func add_level(level: int):
	match level: #Unlock one lv of upgrade for this
		PersistentNode.unlockUpgradeLevel1:
			owner.modify_upgrades("preceptor")
		PersistentNode.unlockUpgradeLevel2:
			owner.modify_upgrades("preceptor")	
		PersistentNode.unlockUpgradeLevel3:
			owner.modify_upgrades("preceptor")

func _on_Upgrades_preceptor_upgrade_bought(photo, Lv):
	if Lv > upgrade_level: #Checks that the upgrade is better than the actual and replaces it
		$HBoxContainer/TextureRect.texture = photo
		upgrade_level = Lv
		upgrades_bought.append(Lv)
	match Lv:
		1:
			owner.ask_upgrade(0, 0, fichas_por_seg * 0.25 * level, 0)
			fichas_por_seg += fichas_por_seg * 0.25
		2:
			owner.ask_upgrade(0, 0, fichas_por_seg * 0.5 * level, 0)
			fichas_por_seg += fichas_por_seg * 0.5
		3:
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
		"upgrades_list" : ["preceptor", upgrades_bought]
	}
	return save_dict
