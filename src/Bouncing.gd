extends Node2D

func _ready():
	$Spawn.start()

func activate_effect():
	var random: int = 0
	var effect: = ""
	random = randi() % 101 #randoms a number
	if random <= 40: #Based on the random number, a effect is selected
		effect = "x7"
	if random > 40 and random <= 80:
		effect = "%10"
	if random > 80:
		effect = "x777"
	
	$Nutzen.visible = false
	$Spawn.start()
	owner.effect_on(effect)

func _on_Spawn_timeout():
	$Nutzen.visible = true
	$ExistTime.start()

func _on_ExistTime_timeout():
	if $Nutzen.visible:
		$Nutzen.visible = false
		$Spawn.start()
