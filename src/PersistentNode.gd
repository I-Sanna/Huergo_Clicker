extends Node


# Declare member variables here. Examples:
# var a = 2
var unlockUpgradeLevel1: int = 20
var unlockUpgradeLevel2: int = unlockUpgradeLevel1 * 2
var unlockUpgradeLevel3: int = unlockUpgradeLevel1 * 3
var unlockUpgradeLevel4: int = unlockUpgradeLevel1 * 4
var unlockUpgradeLevel5: int = unlockUpgradeLevel1 * 5
var unlockUpgradeLevel6: int = unlockUpgradeLevel1 * 6
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():	
	pass

func saveGame():
	print ("guardando")
	var savedGame = File.new()
	savedGame.open("user://saves/savegame.save", File.WRITE)
	if not savedGame.file_exists("user://saves/savegame.save"):
		var dir = Directory.new()
		dir.open("user://")
		dir.make_dir("saves")

	var nodesToSave = get_tree().get_nodes_in_group("Save")
	for node in nodesToSave:
		var nodeData = node.call("save")
		savedGame.store_line(to_json(nodeData)) 
	savedGame.close()

func saveClicker():
	print ("guardando")
	var savedGame = File.new()
	savedGame.open("user://saves/saveclicker.save", File.WRITE)
	if not savedGame.file_exists("user://saves/saveclicker.save"):
		var dir = Directory.new()
		dir.open("user://")
		dir.make_dir("saves")

	var nodesToSave = get_tree().get_nodes_in_group("Click")
	for node in nodesToSave:
		var nodeData = node.call("save")
		savedGame.store_line(to_json(nodeData)) 
	savedGame.close()

func saveEstructuras():
	print ("guardando")
	var savedGame = File.new()
	savedGame.open("user://saves/saveEstructuras.save", File.WRITE)
	if not savedGame.file_exists("user://saves/saveEstructuras.save"):
		var dir = Directory.new()
		dir.open("user://")
		dir.make_dir("saves")

	var nodesToSave = get_tree().get_nodes_in_group("Estructuras")
	for node in nodesToSave:
		var nodeData = node.call("save")
		savedGame.store_line(to_json(nodeData)) 
	savedGame.close()

func loadGame():
	print ("cargando")
	var savedGame = File.new()

	if savedGame.file_exists("user://saves/savegame.save"):
		savedGame.open("user://saves/savegame.save", File.READ)
		while savedGame.get_position() < savedGame.get_len():
		
			var nodeData = parse_json(savedGame.get_line())
			var existentObject = get_node(nodeData["path"])
			
			for key in nodeData.keys():
				if key == "filename" or key == "path":
					continue
				if key == "upgrades_list":
					get_node("/root/HuergoClicker/ScrollContainer/Upgrades").load_data(nodeData[key][0], nodeData[key][1])
					continue
				if key == "image_path":
					existentObject.load_image(nodeData[key])
				existentObject.set(key, nodeData[key])
				existentObject.load_data()
	else:
		print("archivo no encontrado")
	
func loadClicker():
	print ("cargando")
	var savedGame = File.new()

	if savedGame.file_exists("user://saves/saveclicker.save"):
		savedGame.open("user://saves/saveclicker.save", File.READ)
		while savedGame.get_position() < savedGame.get_len():
		
			var nodeData = parse_json(savedGame.get_line())
			var existentObject = get_node(nodeData["path"])
			
			for key in nodeData.keys():
				if key == "filename" or key == "path":
					continue
				existentObject.set(key, nodeData[key])
				existentObject.load_data()
	else:
		print("archivo no encontrado")

	savedGame.close()
