extends Node2D

# class
class AnimalClass:
	var variationList = [0, 0, 0, 0, 0, 0, 0, 0]
	var nameList = [" ", "", " ", " ", " ", " ", " ", " "]
	var name : String
	var rarity : int
	var weightLow : float
	var weightHigh : float

var catClass
var dogClass
var fishClass
var rabbitClass
var duckClass
var ratClass
var frogClass
var axolotlClass
var dragonClass
	
func _init():
	catClass = AnimalClass.new()
	dogClass = AnimalClass.new()
	fishClass = AnimalClass.new()
	rabbitClass = AnimalClass.new()
	duckClass = AnimalClass.new()
	ratClass = AnimalClass.new()
	frogClass = AnimalClass.new()
	axolotlClass = AnimalClass.new()
	dragonClass = AnimalClass.new()
	
	catClass.name = "CAT"
	catClass.rarity = 0
	catClass.weightLow = 7
	catClass.weightHigh = 18
	
	dogClass.name = "DOG"
	dogClass.rarity = 0
	dogClass.weightLow = 35
	dogClass.weightHigh = 85
	
	fishClass.name = "FISH"
	fishClass.rarity = 1
	fishClass.weightLow = 0.1
	fishClass.weightHigh = 1
	
	duckClass.name = "DUCK"
	duckClass.rarity = 1
	duckClass.weightLow = 1
	duckClass.weightHigh = 4
	
	rabbitClass.name = "RABBIT"
	rabbitClass.rarity = 1
	rabbitClass.weightLow = 2
	rabbitClass.weightHigh = 10
	
	ratClass.name = "RAT"
	ratClass.rarity = 2
	ratClass.weightLow = 0.5
	ratClass.weightHigh = 1.5
	
	frogClass.name = "FROG"
	frogClass.rarity = 3
	frogClass.weightLow = 0.1
	frogClass.weightHigh = 5
	
	axolotlClass.name = "AXOLOTL"
	axolotlClass.rarity = 3
	axolotlClass.weightLow = 0.1
	axolotlClass.weightHigh = 1
	
	dragonClass.name = "DRAGON"
	dragonClass.rarity = 4
	dragonClass.weightLow = 5
	dragonClass.weightHigh = 15
