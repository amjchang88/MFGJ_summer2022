extends Node2D

onready var animal = preload("res://Scenes/Animal.tscn")
onready var global = get_node("/root/Global")
onready var timer = get_node("Timer")
onready var mainAnimalArray = get_tree().get_root().get_node("Main").get_node("AnimalList").get_node("AnimalArray")
var mode := 0
var animalArray 
var rng = RandomNumberGenerator.new()

signal finished

func _on_Main_toNewAnimal():
	rng.randomize()
	$New.visible = false
	$RichTextLabel.text = "Recoveries:"
	$RichTextLabel2.visible = true
	$RichTextLabel3.text = "Reputation:"
	$DeathList.visible = false
	$Title.bbcode_text = "[center]Week " + str(global.week) + " Summary[/center]"
	$Area2D.visible = false
	$NewAnimalPanel.frame = 0
	
	$RecoveriesList.place_animals()
	
	timer.start(1)
	yield(timer, "timeout")
	
	animalArray = $RecoveriesList.animalArray
	read_animals()
	
	#$NewAnimalPanel.frame = 1
	#$Area2D.visible = true
	
func next_week():

	global.week += 1
	if global.week >= 14:
		global.week = 1
		global.season += 1
	if global.season >= 4:
		global.season = 0
	$Title.bbcode_text = "[center]New Animals:[/center]"

func read_animals():
	for Animal in animalArray:
		timer.start(1.5)
		yield(timer, "timeout")
		var xp = ((Animal.rarity + 1)*(Animal.rarity + 1)) * 25
		$RichTextLabel2.text = Animal.nickname + ": +" + str(xp)
		global.reputation += xp
	emit_signal("finished")

func read_dead_animals():
	for Animal in animalArray:
		timer.start(1.5)
		yield(timer, "timeout")
		var xp = ((Animal.rarity + 1)*(Animal.rarity + 1)) * 25 * -1
		global.reputation += xp
		$RichTextLabel2.text = Animal.nickname + ": " + str(xp)
	emit_signal("finished")
	
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			mode += 1
			
			match mode:
				1:
					$RichTextLabel2.text = ""
					$RecoveriesList.free_animals()
					$DeathList.visible = true
					$DeathList.place_animals()
					
					$NewAnimalPanel.frame = 0
					$Area2D.visible = false
					
					animalArray = $DeathList.animalArray
					$RichTextLabel.text = "Deaths:"

					read_dead_animals()
				2:
					$DeathList.free_animals()
					$DeathList.visible = false
					$RichTextLabel2.visible = false
					$RichTextLabel.text = "New Animal:"
					$RichTextLabel3.text = "Choose Name:"
					$New.visible = true
					$NewAnimalPanel.frame = 0
					$Area2D.visible = false
				3:
					visible = false


func _on_NewAnimal_finished():
	$NewAnimalPanel.frame = 1
	$Area2D.visible = true

func random_animal():
	randomize()
	if global.reputation < 500:
		var choices = ["cat", "dog", "fish", "rabbit", "duck"]
	else:
		var choices = ["cat", "dog", "fish", "rabbit", "duck", "rat", "frog", "bird", "axolotl", "dragon"]
	var newAnimal = animal.instance()
	add_child_below_node(get_node("New"), newAnimal)
	
	
