extends Node2D

onready var animal = preload("res://Scenes/Animal.tscn")
onready var global = get_node("/root/Global")
onready var timer = get_node("Timer")
onready var mainAnimalArray = get_tree().get_root().get_node("Main").get_node("AnimalList").get_node("AnimalArray")
var mode := 0
var animalArray 
var rng = RandomNumberGenerator.new()
var choices = []
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

					
					newAnimalNode = get_node("Animal")
					newAnimalNode.nickname = $New/LineEdit.text
					self.remove_child(get_node("Animal"))
					mainAnimalArray.add_child(newAnimalNode)
					newAnimalNode.set_owner(mainAnimalArray)
					mainAnimalArray.place_animals()
					$New/LineEdit.text = ""
					#emit_signal("finished")
					
					random_animal()					
					mode += 1
				_:
					#random_animal()
					newAnimalNode = get_node("Animal")
					newAnimalNode.nickname = $New/LineEdit.text
					self.remove_child(get_node("Animal"))
					mainAnimalArray.add_child(newAnimalNode)
					newAnimalNode.set_owner(mainAnimalArray)
					mainAnimalArray.place_animals()
					$New/LineEdit.text = ""
					#emit_signal("finished")

					visible = false
					$RichTextLabel2.text = ""
					mode = 0
					emit_signal("returnMain")
					$New/LineEdit.text = ""


func _on_NewAnimal_finished():
	$NewAnimalPanel.frame = 1
	$Area2D.visible = true

func random_animal():
	randomize()
	if global.reputation < 250:
		choices = ["Cat", "Dog", "Fish", "Rabbit", "Duck"]
		#choices = ["cat"]
	else:
		choices = ["Cat", "Dog", "Fish", "Rabbit", "Duck", "Rat", "Frog", "Bird", "Axolotl", "Dragon"]
		#choices = ["cat"]
	var newAnimal = animal.instance()
	self.add_child(newAnimal)
	var p_animalNameCaps = choices[randi() % choices.size()]
	var p_animalName = p_animalNameCaps.to_lower()
	var p_variation = rng.randi_range(1, 8)
	var p_rarity = global.get(p_animalName + "Class").rarity
	var treatment = global.get(p_animalName + "Class").symptomList[randi() % global.get(p_animalName + "Class").symptomList.size()]
	var p_symptom = global.symptomDict[treatment].symptomName
	var p_ttk = global.symptomDict[treatment].ttk
	var p_weight = rand_range(global.get(p_animalName + "Class").weightLow, global.get(p_animalName + "Class").weightHigh)
	var p_gender = rng.randi_range(0,1)
	newAnimal.initialize(p_animalNameCaps, p_variation, p_rarity, p_symptom, p_ttk, p_weight, p_gender)
	newAnimal.position = $New.position



func _on_LineEdit_text_changed(_new_text):
	$NewAnimalPanel.frame = 1
	$Area2D.visible = true
