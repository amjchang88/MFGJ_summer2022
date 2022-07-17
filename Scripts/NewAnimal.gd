extends Node2D

onready var animal = preload("res://Scenes/Animal.tscn")
onready var global = get_node("/root/Global")
onready var timer = get_node("Timer")
onready var mainAnimalArray = get_tree().get_root().get_node("Main").get_node("AnimalList").get_node("AnimalArray")
var mode := 0
var animalArray 
var rng = RandomNumberGenerator.new()
var choices = []
var newAnimal
var newAnimalNode
var paused 

signal finished
signal returnMain

func _on_Main_toNewAnimal():
	rng.randomize()
	$New.visible = false
	$RichTextLabel.text = "Healed:"
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
	mode += 1

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
					mode += 1
					if mainAnimalArray.animalArray.size() > 30:
						mode = 6
				2:
					next_week()
					$DeathList.free_animals()
					$DeathList.visible = false
					$RichTextLabel2.visible = false
					$RichTextLabel.text = "New Animal:"
					$RichTextLabel3.text = "Choose Name:"
					$New.visible = true
					$NewAnimalPanel.frame = 0
					$Area2D.visible = false
					
					random_animal()
					mode += 1
				3, 4:
					$NewAnimalPanel.frame = 0
					$Area2D.visible = false
					$New/LineEdit.text = ""
					random_animal()
					mode += 1
				_:
					visible = false
					$RichTextLabel2.text = ""
					mode = 0
					emit_signal("returnMain")


func _on_NewAnimal_finished():
	$NewAnimalPanel.frame = 1
	$Area2D.visible = true

func random_animal():
	randomize()
	if global.reputation < 500:
		#choices = ["cat", "dog", "fish", "rabbit", "duck"]
		choices = ["cat"]
	else:
		#choices = ["cat", "dog", "fish", "rabbit", "duck", "rat", "frog", "bird", "axolotl", "dragon"]
		choices = ["cat"]
	newAnimal = animal.instance()
	mainAnimalArray.add_child(newAnimal)
	var p_animalName = choices[randi() % choices.size()]
	var p_variation = rng.randi_range(1, 8)
	var p_rarity = global.get(p_animalName + "Class").rarity
	var p_symptom = global.get(p_animalName + "Class").symptomList[randi() % global.get(p_animalName + "Class").symptomList.size()]
	var p_ttk = global.symptomDict[p_symptom].ttk
	var p_weight = rand_range(global.get(p_animalName + "Class").weightLow, global.get(p_animalName + "Class").weightHigh)
	newAnimal.initialize(p_animalName, p_variation, p_rarity, p_symptom, p_ttk, p_weight)
	newAnimal.position = $New.position
	


func _on_LineEdit_text_entered(new_text):
	if new_text:
		print('*****')
		newAnimal.nickname = new_text
		#remove_child(get_node("Animal"))
		mainAnimalArray.add_child(newAnimal)
		newAnimal.set_owner(mainAnimalArray)
		mainAnimalArray.place_animals()
		emit_signal("finished")
	
