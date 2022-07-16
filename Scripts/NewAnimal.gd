extends Node2D

onready var animal = preload("res://Scenes/Animal.tscn")
onready var global = get_node("/root/Global")
var mode := 0

func _on_Main_toNewAnimal():

	$Title.bbcode_text = "[center]Week " + str(global.week) + " Summary[/center]"
	$RecoveriesList.place_animals()
	
func next_week():

	global.week += 1
	if global.week >= 14:
		global.week = 1
		global.season += 1
	if global.season >= 4:
		global.season = 0
	$Title.bbcode_text = "[center]New Animals:[/center]"
