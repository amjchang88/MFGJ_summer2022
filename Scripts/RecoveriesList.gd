extends Node2D

var animalArray
var animalX : int
var animalY : int
var animalCount := 0

var paused = true

func place_animals():
	animalCount = 0
	animalArray = get_children()
	
	for Animal in animalArray:
		
		animalX = (animalCount % 6) * 32
		animalY = floor(animalCount / 6) * 32
		Animal.position = Vector2(animalX, animalY)
		
		animalCount += 1

func free_animals():
	animalArray = get_children()
	
	for Animal in animalArray:
		Animal.queue_free()
