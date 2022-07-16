extends Node2D

# class
class AnimalClass:
	var variationList = [0, 0, 0, 0, 0, 0, 0, 0]
	var nameList = [" ", " ", " ", " ", " ", " ", " ", " "]
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

	catClass.nameList = ["Black Shorthair", "Tuxedo Shorthair", "Coffee Longhair", "Calico Shorthair", "Brown Tabby", "Orange Shorthair", "Chocolate Point", "White Longhair"]
	
	dogClass.name = "DOG"
	dogClass.rarity = 0
	dogClass.weightLow = 40
	dogClass.weightHigh = 85
	dogClass.nameList = ["Border Collie", "Chocolate Lab", "Rhodesian Ridgeback", "Golden Retriever", "Terrier", "Black Shiba Inu", "Schipperke", "White German Shepherd"]
	
	fishClass.name = "FISH"
	fishClass.rarity = 1
	fishClass.weightLow = 0.1
	fishClass.weightHigh = 1
	fishClass.nameList = ["Blue Beta", "Light Blue Beta", "Orange Guppy", "Red Beta", "Yellow Guppy", "Orange Koi", "Red Koi", "Tricolor Koi"]
	
	duckClass.name = "DUCK"
	duckClass.rarity = 1
	duckClass.weightLow = 1
	duckClass.weightHigh = 4
	duckClass.nameList = ["Black", "Brown", "Mallard (Female)", "Mallard (Male)", "Mandarin (Female)", "Mandarin (Male)", "White", "Yellow"]
	
	rabbitClass.name = "RABBIT"
	rabbitClass.rarity = 1
	rabbitClass.weightLow = 2
	rabbitClass.weightHigh = 10
	rabbitClass.nameList = ["Black", "Dutch", "Brown", "Californian", "Harlequin", "White", "Golden"]
	
	ratClass.name = "RAT"
	ratClass.rarity = 2
	ratClass.weightLow = 0.5
	ratClass.weightHigh = 1.5
	ratClass.nameList = ["Black", "Black Piebald", "Blue", "Gray", "Gray Piebald", "Brown", "Brown Piebald", "Tan Piebald"]
	
	frogClass.name = "FROG"
	frogClass.rarity = 3
	frogClass.weightLow = 0.1
	frogClass.weightHigh = 5
	frogClass.nameList = [""]
	
	axolotlClass.name = "AXOLOTL"
	axolotlClass.rarity = 3
	axolotlClass.weightLow = 0.1
	axolotlClass.weightHigh = 1
	
	dragonClass.name = "DRAGON"
	dragonClass.rarity = 4
	dragonClass.weightLow = 5
	dragonClass.weightHigh = 15
