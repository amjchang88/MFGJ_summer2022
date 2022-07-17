extends Node2D

onready var animal = preload("res://Scenes/Animal.tscn")
onready var global = get_node("/root/Global")
onready var timer = get_node("Timer")
var mode := 0

func _on_Main_toNewAnimal():

	$Title.bbcode_text = "[center]Week " + str(global.week) + " Summary[/center]"
	$Area2D.visible = false
	$NewAnimalPanel.frame = 0
	
	$RecoveriesList.place_animals()
	
	timer.start(1)
	yield(timer, "timeout")
	
	read_animals()
	
	$NewAnimalPanel.frame = 1
	$Area2D.visible = true
	
func next_week():

	global.week += 1
	if global.week >= 14:
		global.week = 1
		global.season += 1
	if global.season >= 4:
		global.season = 0
	$Title.bbcode_text = "[center]New Animals:[/center]"

func read_animals():
	var animalArray = $RecoveriesList.animalArray
	for Animal in animalArray:
		timer.start(1.5)
		yield(timer, "timeout")
		var xp = ((Animal.rarity + 1)*(Animal.rarity + 1)) * 25
		print(Animal.rarity)
		$RichTextLabel2.text = Animal.nickname + ": +" + str(xp)
		global.reputation += xp
	


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			pass
