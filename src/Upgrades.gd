extends VBoxContainer

class_name Upgrade

var level: int = 0
var upgrade_level: int = 0
var upgrades_bought: Array = []
var multiplier: float = 1.15
var BASE_PRICE: float = 0.0
var price: float = BASE_PRICE
var exponent: int = 0
var fichas_por_seg: float = 0.0
const postfixes_dict = {"0":"", "1":"k", "2":"m", "3":"b", "4":"t", "5":"aa", "6":"ab", "7":"ac", "8":"ad", "9":"ae", "10":"af", "11":"ag", "12":"ah", "13":"ai", "14":"aj", "15":"ak", "16":"al", "17":"am", "18":"an", "19":"ao", "20":"ap", "21":"aq", "22":"ar", "23":"as", "24":"at", "25":"au", "26":"av", "27":"aw", "28":"ax", "29":"ay", "30":"az", "31":"ba", "32":"bb", "33":"bc", "34":"bd", "35":"be", "36":"bf", "37":"bg", "38":"bh", "39":"bi", "40":"bj", "41":"bk", "42":"bl", "43":"bm", "44":"bn", "45":"bo", "46":"bp", "47":"bq", "48":"br", "49":"bs", "50":"bt", "51":"bu", "52":"bv", "53":"bw", "54":"bx", "55":"by", "56":"bz", "57":"ca"}

func load_data():
	$HBoxContainer2/Price.text = "Precio: " + str(price) + postfixes_dict[str(exponent)] +" fichas"
	$HBoxContainer/VBoxContainer/Level.text	= "Lv. " + str(level)
	
func load_image(path: String):
	$HBoxContainer/TextureRect.texture = load(path)
	
func upgrade():
	level += 1
	price = stepify(price * multiplier, 0.01)	#Defines the price after upgrade
	calculate()
	$HBoxContainer2/Price.text = "Precio: " + str(price) + postfixes_dict[str(exponent)] +" fichas"
	$HBoxContainer/VBoxContainer/Level.text	= "Lv. " + str(level)
	
	add_level(level)
	
func _on_TextureButton_pressed():
	if owner.ask_upgrade(price, exponent, fichas_por_seg, 0):
		upgrade()

func add_level(level: int):
	pass
	
func calculate():
	while price >= 1000.0:
		price *= 0.001
		exponent += 1
		price = stepify(price, 0.001)

