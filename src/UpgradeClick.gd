extends GridContainer

signal click_upgrade_bought(photo, Lv)
signal computadora_upgrade_bought(photo, Lv)
signal mail_upgrade_bought(photo, Lv)
signal comida_upgrade_bought(photo, Lv)
signal camara_upgrade_bought(photo, Lv)
signal celular_upgrade_bought(photo, Lv)
signal preceptor_upgrade_bought(photo, Lv)

var prices: Dictionary = {
	"Click1" : [1, 1],
	"Click2" : [10, 1],
	"Click3" : [100, 1],
	"Click4" : [1, 2],
	"Click5" : [10, 2 ],
	"Computadora1" : [2.5, 1],
	"Computadora2" : [25, 1],
	"Computadora3" : [250, 1],
	"Computadora4" : [2.5, 2],
	"Computadora5" : [25, 2],
	"Mail1" : [100, 3],
	"Mail2" : [1, 4],
	"Comida1" : [13, 2],
	"Comida2" : [130, 2],
	"Comida3" : [1.3, 3],
	"Comida4" : [13, 3],
	"Camara1" : [20, 1],
	"Camara2" : [200, 1],
	"Camara3" : [2, 2],
	"Preceptor1" : [500, 1],
	"Preceptor2" : [5, 2],
	"Preceptor3" : [50, 2],
	"Celular1" : [8, 1],
	"Celular2" : [80, 1],
	"Celular3" : [800, 1],
	"Celular4" : [8, 2],
	"Celular5" : [80, 2]
}

var descriptions: Dictionary = {
	"Click1" : "Obtienes un 2% mas de tus fichas blancas actuales",
	"Click2" : "Obtienes un 2% mas de tus fichas blancas actuales",
	"Click3" : "Obtienes un 2% mas de tus fichas blancas actuales",
	"Click4" : "Obtienes un 2% mas de tus fichas blancas actuales",
	"Click5" : "Obtienes un 2% mas de tus fichas blancas actuales",
	"Computadora1" : "Obtienes un 5% mas de fichas blancas de las computadoras",
	"Computadora2" : "Obtienes un 10% mas de fichas blancas de las computadoras",
	"Computadora3" : "Obtienes un 25% mas de fichas blancas de las computadoras",
	"Computadora4" : "Obtienes un 60% mas de fichas blancas de las computadoras",
	"Computadora5" : "'Creo que instalar el Elden Ring aca no fue una buena idea'",
	"Mail1" : "Obtienes un 50% mas de fichas blancas del Mail",
	"Mail2" : "'Oh, que pequeño y adorable mono. ¿Que podria hacer de malo?'",
	"Comida1" : "Obtienes un 10% mas de fichas blancas de la comida",
	"Comida2" : "Obtienes un 30% mas de fichas blancas de la comida",
	"Comida3" : "Obtienes un 60% mas de fichas blancas de la comida",
	"Comida4" : "'Hola, te pido 2 de choclo 5 de carne 2 de verdura 1 de choclo 1 de choclo, 1 de pescado, otra de pescado , 3 de carne, 1 de anana '",
	"Camara1" : "Obtienes un 25% mas de fichas blancas de las camaras",
	"Camara2" : "Obtienes un 50% mas de fichas blancas de las camaras",
	"Camara3" : "'Esta camara todo lo ve...'- Obtienes fichas blancas por jugar este juego en clase",
	"Preceptor1" : "Obtienes un 25% mas de fichas blancas del preceptor",
	"Preceptor2" : "Obtienes un 50% mas de fichas blancas del preceptor",
	"Preceptor3" : "||| N'T NT|' A'YD NiJ NJ NU'r'r?҉",
	"Celular1" : "Obtienes un 5% mas de fichas blancas de los celulares",
	"Celular2" : "Obtienes un 10% mas de fichas blancas de los celulares",
	"Celular3" : "Obtienes un 25% mas de fichas blancas de los celulares",
	"Celular4" : "Obtienes un 60% mas de fichas blancas de los celulares",
	"Celular5" : "'¿Te gusta el CS? ¿Te gusta el colegio? Combina los 2 con este increible producto'"
}

func modify_shadow(upgrade: String, level: int):
	#Disables the shadow of the unlocked upgrade
	match upgrade:
		"click":
			match level:
				1:
					$Click1/Shadow.visible = false
				2:
					$Click2/Shadow.visible = false
				3:
					$Click3/Shadow.visible = false
				4:
					$Click4/Shadow.visible = false
				5:
					$Click5/Shadow.visible = false
		"mail":
			match level:
				1:
					$Mail1/Shadow.visible = false
				2:
					$Mail2/Shadow.visible = false
		"computadora":
			match level:
				1:
					$Computadora1/Shadow.visible = false
				2:
					$Computadora2/Shadow.visible = false
				3:
					$Computadora3/Shadow.visible = false
				4:
					$Computadora4/Shadow.visible = false
				5:
					$Group4Computadora5/Shadow.visible = false
		"comida":
			match level:
				1:
					$Comida1/Shadow.visible = false
				2:
					$Comida2/Shadow.visible = false
				3:
					$Comida3/Shadow.visible = false
				4:
					$Comida4/Shadow.visible = false
		"camara":
			match level:
				1:
					$Camara1/Shadow.visible = false
				2:
					$Camara2/Shadow.visible = false
				3:
					$Camara3/Shadow.visible = false
		"mail":
			match level:
				1:
					$Mail1/Shadow.visible = false
				2:
					$Mail2/Shadow.visible = false
		"preceptor":
			match level:
				1:
					$Preceptor1/Shadow.visible = false
				2:
					$Preceptor2/Shadow.visible = false
				3:
					$Preceptor3/Shadow.visible = false
		"celular":
			match level:
				1:
					$Celular1/Shadow.visible = false
				2:
					$Celular2/Shadow.visible = false
				3:
					$Celular3/Shadow.visible = false
				4:
					$Celular4/Shadow.visible = false
				5:
					$Celular5/Shadow.visible = false

func pressed(object: String, type: String, level:int):
	if owner.update_verifier(prices[object][0], prices[object][1], type, level):
		get_node(object).visible = false
		match type:
			"camara":
				emit_signal("camara_upgrade_bought", load(get_node(object + "/Image").texture.get_path()), level)
			"mail":
				emit_signal("mail_upgrade_bought", load(get_node(object + "/Image").texture.get_path()), level)
			"comida":
				emit_signal("comida_upgrade_bought", load(get_node(object + "/Image").texture.get_path()), level)
			"computadora":
				emit_signal("computadora_upgrade_bought", load(get_node(object + "/Image").texture.get_path()), level)
			"celular":
				emit_signal("celular_upgrade_bought", load(get_node(object + "/Image").texture.get_path()), level)
			"preceptor":
				emit_signal("preceptor_upgrade_bought", load(get_node(object + "/Image").texture.get_path()), level)
				
func mouse_entered(object: String):
	owner.show_description(descriptions[object], prices[object])
	
func mouse_exited():
	owner.hide_description()

func _on_Click1_pressed():
	if owner.update_verifier(prices["Click1"][0], prices["Click1"][1], "click", 1):
		get_node("Click1").visible = false
		emit_signal("click_upgrade_bought", load(get_node("Click1/Image").texture.get_path()), 1)
		Input.set_custom_mouse_cursor(preload("res://assets/lapices/lapiz_2.png"), 0, Vector2(5, 60))


func _on_Click1_mouse_entered():
	mouse_entered("Click1")


func _on_Click1_mouse_exited():
	mouse_exited()


func _on_Mail1_pressed():
	pressed("Mail1", "mail", 1)


func _on_Mail1_mouse_entered():
	mouse_entered("Mail1")


func _on_Mail1_mouse_exited():
	mouse_exited()
	
	
func _on_Mail2_pressed():
	pressed("Mail2", "mail", 2)


func _on_Mail2_mouse_entered():
	mouse_entered("Mail2")


func _on_Mail2_mouse_exited():
	mouse_exited()


func _on_Click2_pressed():
	if owner.update_verifier(prices["Click2"][0], prices["Click2"][1], "click", 2):
		get_node("Click2").visible = false
		emit_signal("click_upgrade_bought", load(get_node("Click2/Image").texture.get_path()), 2)
		Input.set_custom_mouse_cursor(preload("res://assets/lapices/lapiz_3.png"), 0, Vector2(5, 60))


func _on_Click2_mouse_entered():
	mouse_entered("Click2")


func _on_Click2_mouse_exited():
	mouse_exited()


func _on_Click3_pressed():
	if owner.update_verifier(prices["Click3"][0], prices["Click3"][1], "click", 3):
		get_node("Click3").visible = false
		emit_signal("click_upgrade_bought", load(get_node("Click3/Image").texture.get_path()), 3)
		Input.set_custom_mouse_cursor(preload("res://assets/lapices/lapiz_4.png"), 0, Vector2(5, 60))


func _on_Click3_mouse_entered():
	mouse_entered("Click3")


func _on_Click3_mouse_exited():
	mouse_exited()


func _on_Click4_pressed():
	if owner.update_verifier(prices["Click4"][0], prices["Click4"][1], "click", 4):
		get_node("Click4").visible = false
		emit_signal("click_upgrade_bought", load(get_node("Click4/Image").texture.get_path()), 4)
		Input.set_custom_mouse_cursor(preload("res://assets/lapices/lapiz_5.png"), 0, Vector2(5, 60))


func _on_Click4_mouse_entered():
	mouse_entered("Click4")


func _on_Click4_mouse_exited():
	mouse_exited()


func _on_Click5_pressed():
	if owner.update_verifier(prices["Click5"][0], prices["Click5"][1], "click", 5):
		get_node("Click5").visible = false
		emit_signal("click_upgrade_bought", load(get_node("Click5/Image").texture.get_path()), 5)
		Input.set_custom_mouse_cursor(preload("res://assets/lapices/lapiz_6.png"), 0, Vector2(5, 60))


func _on_Click5_mouse_entered():
	mouse_entered("Click5")


func _on_Click5_mouse_exited():
	mouse_exited()


func _on_Camara1_pressed():
	pressed("Camara1", "camara", 1)


func _on_Camara1_mouse_entered():
	mouse_entered("Camara1")


func _on_Camara1_mouse_exited():
	mouse_exited()


func _on_Camara2_pressed():
	pressed("Camara2", "camara", 2)


func _on_Camara2_mouse_entered():
	mouse_entered("Camara2")


func _on_Camara2_mouse_exited():
	mouse_exited()


func _on_Camara3_pressed():
	pressed("Camara3", "camara", 3)


func _on_Camara3_mouse_entered():
	mouse_entered("Camara3")


func _on_Camara3_mouse_exited():
	mouse_exited()


func _on_Comida1_pressed():
	pressed("Comida1", "comida", 1)


func _on_Comida1_mouse_entered():
	mouse_entered("Comida1")


func _on_Comida1_mouse_exited():
	mouse_exited()


func _on_Comida2_pressed():
	pressed("Comida2", "comida", 2)


func _on_Comida2_mouse_entered():
	mouse_entered("Comida2")


func _on_Comida2_mouse_exited():
	mouse_exited()


func _on_Computadora1_pressed():
	pressed("Computadora1", "computadora", 1)


func _on_Computadora1_mouse_entered():
	mouse_entered("Computadora1")


func _on_Computadora1_mouse_exited():
	mouse_exited()


func _on_Computadora2_pressed():
	pressed("Computadora2", "computadora", 2)


func _on_Computadora2_mouse_entered():
	mouse_entered("Computadora2")


func _on_Computadora2_mouse_exited():
	mouse_exited()


func _on_Computadora3_pressed():
	pressed("Computadora3", "computadora", 3)


func _on_Computadora3_mouse_entered():
	mouse_entered("Computadora3")


func _on_Computadora3_mouse_exited():
	mouse_exited()


func _on_Computadora4_pressed():
	pressed("Computadora4", "computadora", 4)


func _on_Computadora4_mouse_entered():
	mouse_entered("Computadora4")


func _on_Computadora4_mouse_exited():
	mouse_exited()


func _on_Computadora5_pressed():
	pressed("Computadora5", "computadora", 5)


func _on_Computadora5_mouse_entered():
	mouse_entered("Computadora5")


func _on_Computadora5_mouse_exited():
	mouse_exited()


func _on_Comida3_pressed():
	pressed("Comida3", "comida", 3)


func _on_Comida3_mouse_entered():
	mouse_entered("Comida3")


func _on_Comida3_mouse_exited():
	mouse_exited()


func _on_Comida4_pressed():
	pressed("Comida4", "comida", 4)


func _on_Comida4_mouse_entered():
	mouse_entered("Comida4")


func _on_Comida4_mouse_exited():
	mouse_exited()


func _on_Preceptor1_pressed():
	pressed("Preceptor1", "preceptor", 1)


func _on_Preceptor1_mouse_entered():
	mouse_entered("Preceptor1")


func _on_Preceptor1_mouse_exited():
	mouse_exited()


func _on_Preceptor2_pressed():
	pressed("Preceptor2", "preceptor", 2)


func _on_Preceptor2_mouse_entered():
	mouse_entered("Preceptor2")


func _on_Preceptor2_mouse_exited():
	mouse_exited()


func _on_Preceptor3_pressed():
	pressed("Preceptor3", "preceptor", 3)


func _on_Preceptor3_mouse_entered():
	mouse_entered("Preceptor3")


func _on_Preceptor3_mouse_exited():
	mouse_exited()


func _on_Celular1_pressed():
	pressed("Celular1", "celular", 1)


func _on_Celular1_mouse_entered():
	mouse_entered("Celular1")


func _on_Celular1_mouse_exited():
	mouse_exited()


func _on_Celular2_pressed():
	pressed("Celular2", "celular", 2)


func _on_Celular2_mouse_entered():
	mouse_entered("Celular2")


func _on_Celular2_mouse_exited():
	mouse_exited()

func _on_Celular3_pressed():
	pressed("Celular3", "celular", 3)


func _on_Celular3_mouse_entered():
	mouse_entered("Celular3")


func _on_Celular3_mouse_exited():
	mouse_exited()
	
	
func _on_Celular4_pressed():
	pressed("Celular4", "celular", 4)


func _on_Celular4_mouse_entered():
	mouse_entered("Celular4")


func _on_Celular4_mouse_exited():
	mouse_exited()


func _on_Celular5_pressed():
	pressed("Celular5", "celular", 5)


func _on_Celular5_mouse_entered():
	mouse_entered("Celular5")


func _on_Celular5_mouse_exited():
	mouse_exited()	
