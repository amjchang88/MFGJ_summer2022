extends Node2D

# class
class AnimalClass:
	var variationList = [0, 0, 0, 0, 0, 0, 0, 0]
	var nameList = [" ", " ", " ", " ", " ", " ", " ", " "]
	var name : String
	var rarity : int
	var weightLow : float
	var weightHigh : float
	var symptomList = []

class SymptomClass:
	var ttk : int
	var tth : int
	var afflictionName : String
	var treatmentName : String
	var discovered := false
	
var symptomDict : Dictionary

var fever
var rashes
var itching
var vomiting
var limping
var bleeding
var swelling
var lethargy

var eyeCrusts 
var damagedFeathers
var sneezing
var beakLesions

var frayedFins
var weightLoss
var gasping

var drySkin
var dullSkin
var cloudyEyes

var bloating
var fuzzyGills
var floating

var discoloredScales
var coughing
var irritability
var dryClaws

var catClass
var dogClass
var fishClass
var rabbitClass
var duckClass
var ratClass
var frogClass
var birdClass
var axolotlClass
var dragonClass

var reputation : float = 0
var season := 0
var week := 1

func _init():
	fever = SymptomClass.new()
	fever.ttk = 2
	fever.afflictionName = "Flu"
	fever.treatmentName = "Flu meds"
	
	rashes = SymptomClass.new()
	rashes.ttk = 3
	rashes.afflictionName = "Mange"
	rashes.treatmentName = "Mange meds"
	
	itching = SymptomClass.new()
	itching.ttk = 3
	itching.afflictionName = "Fleas"
	itching.treatmentName = "Flea meds"
	
	vomiting = SymptomClass.new()
	vomiting.ttk = 2
	vomiting.afflictionName = "Worms"
	vomiting.treatmentName = "Dewormer"
	
	limping = SymptomClass.new()
	limping.ttk = 1
	limping.afflictionName = "Fracture"
	limping.treatmentName = "Cast"
	
	bleeding = SymptomClass.new()
	bleeding.ttk = 1 
	bleeding.afflictionName = "Cuts"
	bleeding.treatmentName = "Bandages"
	
	swelling = SymptomClass.new()
	swelling.ttk = 2
	swelling.afflictionName = "Arthritis"
	swelling.treatmentName = "Anti-inflammatory"
	
	lethargy = SymptomClass.new()
	lethargy.ttk = 3
	lethargy.afflictionName = "Autoimmune disease"
	lethargy.treatmentName = "Vitamin treatment"
	
	eyeCrusts = SymptomClass.new()
	eyeCrusts.ttk = 1
	eyeCrusts.afflictionName = "Conjunctivitis"
	eyeCrusts.treatmentName = "Eye drops"
	
	damagedFeathers = SymptomClass.new()
	damagedFeathers.ttk = 1
	damagedFeathers.afflictionName = "Mites"
	damagedFeathers.treatmentName = "Med bath"
	
	sneezing = SymptomClass.new()
	sneezing.ttk = 2
	sneezing.afflictionName = "Respiratory infection"
	sneezing.treatmentName = "Antibiotics"
	
	beakLesions = SymptomClass.new()
	beakLesions.ttk = 2
	beakLesions.afflictionName = "Fungal infection"
	beakLesions.treatmentName = "Antifungal"
	
	frayedFins = SymptomClass.new()
	frayedFins.ttk = 3
	frayedFins.afflictionName = "Fin rot"
	frayedFins.treatmentName = "Antibiotics"
	
	weightLoss = SymptomClass.new()
	weightLoss.ttk = 2 
	weightLoss.afflictionName = "Parasites"
	weightLoss.treatmentName = "Parasite treatment"
	
	gasping = SymptomClass.new()
	gasping.ttk = 1
	gasping.afflictionName = "Ammonia buildup"
	gasping.treatmentName = "Tank filter"
	
	drySkin = SymptomClass.new()
	drySkin.ttk = 2
	drySkin.afflictionName = "Dehydration"
	drySkin.treatmentName = "Mineral bath"
	
	dullSkin = SymptomClass.new()
	dullSkin.ttk = 3
	dullSkin.afflictionName = "Skin infection"
	dullSkin.treatmentName = "Antibiotics"
	
	cloudyEyes = SymptomClass.new()
	cloudyEyes.ttk = 2
	cloudyEyes.afflictionName = "Eye irritation"
	cloudyEyes.treatmentName = "Eye cream"
	
	bloating = SymptomClass.new()
	bloating.ttk = 2
	bloating.afflictionName = "Thyroid disorder"
	bloating.treatmentName = "Thyroid meds"
	
	fuzzyGills = SymptomClass.new()
	fuzzyGills.ttk = 2
	fuzzyGills.afflictionName = "Amphibian fungus"
	fuzzyGills.treatmentName = "Antifungal"
	
	floating = SymptomClass.new()
	floating.ttk = 3
	floating.afflictionName = "Constipation"
	floating.treatmentName = "Refrigeration"
	
	discoloredScales = SymptomClass.new()
	discoloredScales.ttk = 2
	discoloredScales.afflictionName = "Dragon scale rot"
	discoloredScales.treatmentName = "Antibiotics"
	
	coughing = SymptomClass.new()
	coughing.ttk = 1
	coughing.afflictionName = "Dragon flu"
	coughing.treatmentName = "Flu meds"
	
	irritability = SymptomClass.new()
	irritability.ttk = 3 
	irritability.afflictionName = "Mad dragon disease"
	irritability.treatmentName = "Teddy bear"
	
	dryClaws = SymptomClass.new()
	dryClaws.ttk = 1
	dryClaws.afflictionName = "Dragonitis"
	dryClaws.treatmentName = "Claw cream"

	
	catClass = AnimalClass.new()
	dogClass = AnimalClass.new()
	fishClass = AnimalClass.new()
	rabbitClass = AnimalClass.new()
	duckClass = AnimalClass.new()
	ratClass = AnimalClass.new()
	frogClass = AnimalClass.new()
	birdClass = AnimalClass.new()
	axolotlClass = AnimalClass.new()
	dragonClass = AnimalClass.new()
	
	catClass.name = "Cat"
	catClass.rarity = 0
	catClass.weightLow = 7
	catClass.weightHigh = 18
	catClass.nameList = ["Black Shorthair", "Tuxedo Shorthair", "Coffee Longhair", "Calico Shorthair", "Brown Tabby", "Orange Shorthair", "Chocolate Point", "White Longhair"]
	catClass.symptomList = ["Fever", "Rashes", "Itching", "Vomiting", "Limping", "Bleeding", "Swelling", "Lethargy"]
	
	dogClass.name = "Dog"
	dogClass.rarity = 0
	dogClass.weightLow = 40
	dogClass.weightHigh = 85
	dogClass.nameList = ["Border Collie", "Chocolate Lab", "Rhodesian Ridgeback", "Golden Retriever", "Terrier", "Black Shiba Inu", "Schipperke", "White German Shepherd"]
	dogClass.symptomList = ["Fever", "Rashes", "Itching", "Vomiting", "Limping", "Bleeding", "Swelling", "Lethargy"]
	
	fishClass.name = "Fish"
	fishClass.rarity = 1
	fishClass.weightLow = 0.1
	fishClass.weightHigh = 1
	fishClass.nameList = ["Blue Beta", "Light Blue Beta", "Orange Guppy", "Red Beta", "Yellow Guppy", "Orange Koi", "Red Koi", "Tricolor Koi"]
	fishClass.symptomList = ["Frayed fins", "Weight loss", "Gasping"]
	
	duckClass.name = "Duck"
	duckClass.rarity = 1
	duckClass.weightLow = 1
	duckClass.weightHigh = 4
	duckClass.nameList = ["Black", "Brown", "Mallard (Female)", "Mallard (Male)", "Mandarin (Female)", "Mandarin (Male)", "White", "Yellow"]
	duckClass.symptomList = ["Eye crusts", "Damaged feathers", "Sneezing", "Beak lesions"]
	
	rabbitClass.name = "Rabbit"
	rabbitClass.rarity = 1
	rabbitClass.weightLow = 2
	rabbitClass.weightHigh = 10
	rabbitClass.nameList = ["Black", "Dutch", "Brown", "Californian", "Harlequin", "White", "Golden"]
	rabbitClass.symptomList = ["Fever", "Rashes", "Itching", "Vomiting", "Limping", "Bleeding", "Swelling", "Lethargy"]
	
	ratClass.name = "Rat"
	ratClass.rarity = 2
	ratClass.weightLow = 0.5
	ratClass.weightHigh = 1.5
	ratClass.nameList = ["Black", "Black Piebald", "Blue", "Gray", "Gray Piebald", "Brown", "Brown Piebald", "Tan Piebald"]
	ratClass.symptomList = ["Fever", "Rashes", "Itching", "Vomiting", "Limping", "Bleeding", "Swelling", "Lethargy"]
	
	frogClass.name = "Frog"
	frogClass.rarity = 2
	frogClass.weightLow = 0.1
	frogClass.weightHigh = 5
	frogClass.nameList = ["Brown", "Green", "Tree", "White", "Golden", "Blue Poison", "Red Poison", "Yellow Poison"]
	frogClass.symptomList = ["Dry skin", "Dull skin", "Cloudy eyes"]
	
	birdClass.name = "Bird"
	birdClass.rarity = 3
	birdClass.weightLow = 0.1
	birdClass.weightHigh = 1
	birdClass.nameList = ["Red Canary", "Yellow Canary", "Gray Cockatiel", "White Cockatiel", "Green Lovebird", "Rainbow Lovebird", "Blue Parakeet", "Green Parakeet"]
	birdClass.symptomList = ["Eye crusts", "Damaged feathers", "Sneezing", "Beak lesions"]
	
	axolotlClass.name = "Axolotl"
	axolotlClass.rarity = 3
	axolotlClass.weightLow = 0.1
	axolotlClass.weightHigh = 1
	axolotlClass.nameList = ["Black", "Copper", "Golden", "Lavender", "Piebald", "Pink", "Sunglasses", "Red"]
	axolotlClass.symptomList = ["Bloating", "Fuzzy gills", "Floating"]
	
	dragonClass.name = "Dragon"
	dragonClass.rarity = 4
	dragonClass.weightLow = 5
	dragonClass.weightHigh = 15
	dragonClass.nameList = ["Air", "Earth", "Fire", "Frost", "Light", "Shadow", "Soul", "Water"]
	dragonClass.symptomList = ["Discolored scales", "Coughing", "Irritability", "Dry claws"]

	symptomDict = {"Fever" : fever, "Rashes" : rashes, "Itching" : itching, "Vomiting" : vomiting, "Limping" : limping, "Bleeding" : bleeding, "Swelling" : swelling, "Lethargy" : lethargy, "Eye crusts" : eyeCrusts, "Damaged feathers" : damagedFeathers, "Sneezing" : sneezing, "Beak lesions" : beakLesions, "Frayed fins" : frayedFins, "Weight loss" : weightLoss, "Gasping" : gasping, "Dry skin" : drySkin, "Dull skin" : dullSkin, "Cloudy eyes" : cloudyEyes, "Bloating" : bloating, "Fuzzy gills" : fuzzyGills, "Floating" : floating, "Discolored scales" : discoloredScales, "Coughing" : coughing, "Irritability" : irritability, "Dry claws" : dryClaws}
