extends Node2D

var combo:int = 0 
var cantidad_por_click: int = 1
var prercentage_clicks: float = 0
var multiplier_clicks: int = 1
var fichas_blancas: float = 0
var exponent: int = 0
var fichas_por_seg: float = 0
var exponent_seg: int = 0
var multiplier: int = 1
var upgrades: Dictionary = {
	"click": 0,
	"computadora": 0,
	"comida": 0,
	"mail": 0,
	"camara": 0,
	"preceptor": 0,
	"celular" : 0
}
const postfixes_dict = {"0":"", "1":"k", "2":"m", "3":"b", "4":"t", "5":"aa", "6":"ab", "7":"ac", "8":"ad", "9":"ae", "10":"af", "11":"ag", "12":"ah", "13":"ai", "14":"aj", "15":"ak", "16":"al", "17":"am", "18":"an", "19":"ao", "20":"ap", "21":"aq", "22":"ar", "23":"as", "24":"at", "25":"au", "26":"av", "27":"aw", "28":"ax", "29":"ay", "30":"az", "31":"ba", "32":"bb", "33":"bc", "34":"bd", "35":"be", "36":"bf", "37":"bg", "38":"bh", "39":"bi", "40":"bj", "41":"bk", "42":"bl", "43":"bm", "44":"bn", "45":"bo", "46":"bp", "47":"bq", "48":"br", "49":"bs", "50":"bt", "51":"bu", "52":"bv", "53":"bw", "54":"bx", "55":"by", "56":"bz", "57":"ca"}

func _ready():
	PersistentNode.loadClicker()
	PersistentNode.loadGame()
	Input.set_custom_mouse_cursor(preload("res://assets/lapices/lapiz_1.png"), 0, Vector2(5, 60))
	$Description.visible = false
	$Timer.start()
	Input.set_custom_mouse_cursor(load($MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/Lapices/HBoxContainer/TextureRect.texture.get_path()), 0, Vector2(5, 60))

func load_data():
	$Puntaje.text = "Fichas blancas: " + str(fichas_blancas) + " " + postfixes_dict[str(exponent)] 
	$FichasPorSegundo.text = "Fichas blancas/s: " + str(fichas_por_seg) + postfixes_dict[str(exponent_seg)]
	$ScrollContainer/Upgrades.load_shadows(upgrades)
	
func _on_FB_Area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			$ClickTimer.start()
			$FB_Area/FB_Animation.frame = 0
			$FB_Area/FB_Animation.play("default") #Plays the animation whenever it is clicked		
			if combo < 15: #Limits the combo so the number doesn´t get too big
				combo += 1
			if combo >= 15: #Enable the effect when the combo reachs 15
				$Effect2D.emitting = true
			fichas_blancas = plus(fichas_blancas, cantidad_por_click * multiplier * multiplier_clicks, exponent, 0)
			fichas_blancas = plus(fichas_blancas, fichas_por_seg * 2 / 100, exponent, exponent_seg)
			calculate()
			$Puntaje.text = "Fichas blancas: " + str(fichas_blancas) + " " + postfixes_dict[str(exponent)] 

func _on_FB_Animation_animation_finished():
	$FB_Area/FB_Animation.stop() #Stops the animation when finished


func _on_ClickTimer_timeout():
	combo = 0
	$Effect2D.emitting = false #Disables de effect after some time without clicking
	
func _on_Timer_timeout(): #Adds fichas blancas per second
	$Timer.start()
	fichas_blancas = plus(fichas_blancas, fichas_por_seg / 10 * multiplier, exponent, exponent_seg)
	calculate()
	$Puntaje.text = "Fichas blancas: " + str(fichas_blancas) + " " + postfixes_dict[str(exponent)] 
	
func ask_upgrade(price: float, exponential:int, fichas_p_s: float, exp_seg: int):
	if exponent > exponential or fichas_blancas >= price and exponent == exponential: #Checks if the player has enough to buy the upgrade
		fichas_por_seg = plus(fichas_por_seg, fichas_p_s, exponent_seg, exp_seg)
		fichas_blancas = minus(fichas_blancas, price, exponent, exponential)
		calculate()
		calculate_seg()
		$FichasPorSegundo.text = "Fichas blancas/s: " + str(fichas_por_seg) + postfixes_dict[str(exponent_seg)]
		return true
	return false
		
func effect_on(effect):
	match effect:
		"x7":
			$FondoMejoras.visible = true
			$TimerEffect.wait_time = 70
			multiplier = 7
			$Effect.text = "EFECTO ACTIVADO: X7 FICHAS BLANCAS"
			$TimerEffect.start()		
		"x777":
			$FondoMejoras.visible = true
			$TimerEffect.wait_time = 40
			multiplier_clicks = 777
			$Effect.text = "EFECTO ACTIVADO: X777 FICHAS BLANCAS POR CLICK"
			$TimerEffect.start()
		"%10":
			$FondoMejoras.visible = true
			$TimerEffect.wait_time = 5
			fichas_blancas += fichas_blancas * 0.1
			$Effect.text = "EFECTO ACTIVADO: OBTUVISTE +10% DE TUS FICHAS BLANCAS"
			$TimerEffect.start()

func _on_TimerEffectx7_timeout():
	multiplier = 1
	multiplier_clicks = 1
	$Effect.text = ""
	$FondoMejoras.visible = false

func upgrade_click(clicks: int, percentage: float):
	cantidad_por_click += clicks
	prercentage_clicks += percentage

func modify_upgrades(upgrade: String):
	upgrades[upgrade] += 1 #Adds one level to one upgrade 
	$ScrollContainer/Upgrades.modify_shadow(upgrade, upgrades[upgrade])
	
func update_verifier(price: float, exponential: int, type: String, level: int):
	if exponent > exponential or fichas_blancas >= price and exponent == exponential:
		if level <= upgrades[type]:
			fichas_blancas = minus(fichas_blancas, price, exponent, exponential)
			return true
	return false

func show_description(description: String, price: Array):
	#Shows a label with the price and description of the upgrade
	$Description.text = str(price[0]) + " " + postfixes_dict[str(price[1])] + """
	
	""" + description
	$Description.visible = true

func hide_description():
	$Description.visible = false
	
func calculate():
	while fichas_blancas >= 1000.0:
		fichas_blancas *= 0.001
		exponent += 1
		fichas_blancas = stepify(fichas_blancas, 0.0001)
	while fichas_blancas < 1 and exponent > 0:
		fichas_blancas *= 1000.0
		exponent -= 1
		 

func calculate_seg():
	while fichas_por_seg >= 1000.0:
		fichas_por_seg *= 0.001
		exponent_seg += 1
		fichas_por_seg = stepify(fichas_por_seg, 0.0001)

func plus(num1, num2, exp1, exp2):
	var exponent_diff: int = exp1 - exp2
	if exponent_diff < 0:
		exponent_diff *= -1	
		for x in range(0, exponent_diff):
			num2 *= 1000
		num1 += num2
	else:
		for x in range(0, exponent_diff):
			num2 *= 0.001
		num1 += num2
	return stepify(num1, 0.0001)

func minus(num1, num2, exp1, exp2):
	var exponent_diff: int = exp1 - exp2
	if exponent_diff < 0:
		exponent_diff *= -1	
		for x in range(0, exponent_diff):
			num2 *= 1000
		num1 -= num2
	else:
		for x in range(0, exponent_diff):
			num2 *= 0.001
		num1 -= num2
	return stepify(num1, 0.00001)

func draw_assets(image, type: String):
	pass	

func save():
	var save_dict = {
		"filename" : get_filename(),
		"path" : get_path(),
		"cantidad_por_click" : cantidad_por_click,
		"prercentage_clicks" : prercentage_clicks,
		"fichas_blancas" : fichas_blancas,
		"exponent" : exponent,
		"fichas_por_seg" : fichas_por_seg,
		"exponent_seg" : exponent_seg,
		"upgrades" : upgrades
	}
	return save_dict
