extends Node2D

onready var animalArray 
onready var animalInstance = preload("res://Scenes/Animal.tscn")
onready var global = get_node("/root/Global")
onready var paused = false

onready var recoveryList = get_tree().get_root().get_node("Main").get_node("NewAnimal").get_node("RecoveriesList")
onready var deathList = get_tree().get_root().get_node("Main").get_node("NewAnimal").get_node("DeathList")

signal toNewAnimal

var animalX := 0
var animalY := 0
var animalCount := 0

func _ready():
		
	place_animals()

func place_animals():
	animalCount = 0
	animalArray = get_children()

	for Animal in animalArray:
	
		Animal.arrayPos = animalCount
		
		animalX = (animalCount % 6) * 32
		animalY = floor(animalCount / 6) * 32
		Animal.position = Vector2(animalX, animalY)

		animalCount += 1


func _on_JournalPanel_returned():
	paused = false


func _on_Main_toNewAnimal():
	animalArray = get_children()
	
	# check each animal for recovery / death
	for Animal in animalArray:
		# check if treatment is correct
		if global.symptomDict.has(Animal.treatment):
			if Animal.symptom == global.symptomDict[Animal.treatment].symptomName:
				self.remove_child(Animal)
				recoveryList.add_child(Animal)
				Animal.set_owner(recoveryList)
				

		
	emit_signal("toNewAnimal")
