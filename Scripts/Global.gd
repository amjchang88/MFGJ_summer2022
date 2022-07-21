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
	var symptomName : String
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
var fuzzGrowth

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

var reputation : float = 50
var season := 0
var week := 1

func _init():
	fever = SymptomClass.new()
	fever.ttk = 2
	fever.afflictionName = "Flu"
	fever.treatmentName = "Flu meds"
	fever.symptomName = "Fever"
	
	rashes = SymptomClass.new()
	rashes.ttk = 3
	rashes.afflictionName = "Mange"
	rashes.treatmentName = "Mange meds"
	rashes.symptomName = "Rashes"
	
	itching = SymptomClass.new()
	itching.ttk = 3
	itching.afflictionName = "Fleas"
	itching.treatmentName = "Flea meds"
	itching.symptomName = "Itching"
	
	vomiting = SymptomClass.new()
	vomiting.ttk = 2
	vomiting.afflictionName = "Worms"
	vomiting.treatmentName = "Dewormer"
	vomiting.symptomName = "Vomiting"
	
	limping = SymptomClass.new()
	limping.ttk = 1
	limping.afflictionName = "Fracture"
	limping.treatmentName = "Splint"
	limping.symptomName = "Limping"
	
	bleeding = SymptomClass.new()
	bleeding.ttk = 1 
	bleeding.afflictionName = "Cuts"
	bleeding.treatmentName = "Bandages"
	bleeding.symptomName = "Bleeding"
	
	swelling = SymptomClass.new()
	swelling.ttk = 2
	swelling.afflictionName = "Arthritis"
	swelling.treatmentName = "Anti inflammatory"
	swelling.symptomName = "Swelling"
	
	lethargy = SymptomClass.new()
	lethargy.ttk = 3
	lethargy.afflictionName = "Autoimmune disease"
	lethargy.treatmentName = "Vitamin treatment"
	lethargy.symptomName = "Lethargy"
	
	eyeCrusts = SymptomClass.new()
	eyeCrusts.ttk = 1
	eyeCrusts.afflictionName = "Conjunctivitis"
	eyeCrusts.treatmentName = "Eye drops"
	eyeCrusts.symptomName = "Eye crusts"
	
	damagedFeathers = SymptomClass.new()
	damagedFeathers.ttk = 1
	damagedFeathers.afflictionName = "Mites"
	damagedFeathers.treatmentName = "Med bath"
	damagedFeathers.symptomName = "Damaged feathers"
	
	sneezing = SymptomClass.new()
	sneezing.ttk = 2
	sneezing.afflictionName = "Infection"
	sneezing.treatmentName = "Antibiotics"
	sneezing.symptomName = "Sneezing"
	
	fuzzGrowth = SymptomClass.new()
	fuzzGrowth.ttk = 2
	fuzzGrowth.afflictionName = "Fungal infection"
	fuzzGrowth.treatmentName = "Antifungal"
	fuzzGrowth.symptomName = "Fuzz growth"
	
	frayedFins = SymptomClass.new()
	frayedFins.ttk = 3
	frayedFins.afflictionName = "Infection"
	frayedFins.treatmentName = "Antibiotics"
	
	weightLoss = SymptomClass.new()
	weightLoss.ttk = 2 
	weightLoss.afflictionName = "Parasites"
	weightLoss.treatmentName = "Parasite meds"
	weightLoss.symptomName = "Weight loss"
	
	gasping = SymptomClass.new()
	gasping.ttk = 1
	gasping.afflictionName = "Ammonia buildup"
	gasping.treatmentName = "Tank filter"
	gasping.symptomName = "Gasping"
	
	drySkin = SymptomClass.new()
	drySkin.ttk = 2
	drySkin.afflictionName = "Dehydration"
	drySkin.treatmentName = "Mineral bath"
	drySkin.symptomName = "Dry skin"
	
	dullSkin = SymptomClass.new()
	dullSkin.ttk = 3
	dullSkin.afflictionName = "Infection"
	dullSkin.treatmentName = "Antibiotics"
	
	cloudyEyes = SymptomClass.new()
	cloudyEyes.ttk = 2
	cloudyEyes.afflictionName = "Eye irritation"
	cloudyEyes.treatmentName = "Eye cream"
	cloudyEyes.symptomName = "Cloudy eyes"
	
	bloating = SymptomClass.new()
	bloating.ttk = 2
	bloating.afflictionName = "Thyroid disorder"
	bloating.treatmentName = "Thyroid meds"
	bloating.symptomName = "Bloating"
	
	fuzzyGills = SymptomClass.new()
	fuzzyGills.ttk = 2
	fuzzyGills.afflictionName = "Fungal infection"
	fuzzyGills.treatmentName = "Antifungal"
	
	floating = SymptomClass.new()
	floating.ttk = 3
	floating.afflictionName = "Constipation"
	floating.treatmentName = "Refrigeration"
	floating.symptomName = "Floating"
	
	discoloredScales = SymptomClass.new()
	discoloredScales.ttk = 2
	discoloredScales.afflictionName = "Infection"
	discoloredScales.treatmentName = "Antibiotics"
	
	coughing = SymptomClass.new()
	coughing.ttk = 1
	coughing.afflictionName = "Dragon flu"
	coughing.treatmentName = "Flu meds"
	
	irritability = SymptomClass.new()
	irritability.ttk = 3 
	irritability.afflictionName = "Mad dragon disease"
	irritability.treatmentName = "Teddy bear"
	irritability.symptomName = "Irritability"
	
	dryClaws = SymptomClass.new()
	dryClaws.ttk = 1
	dryClaws.afflictionName = "Dragonitis"
	dryClaws.treatmentName = "Claw cream"
	dryClaws.symptomName = "Dry claws"

	
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
	catClass.weightHigh = 14
	catClass.nameList = ["Black Shorthair", "Tuxedo Shorthair", "Coffee Longhair", "Calico Shorthair", "Brown Tabby", "Orange Shorthair", "Chocolate Point", "White Longhair"]
	catClass.symptomList = ["Flu meds", "Mange meds", "Flea meds", "Dewormer", "Splint", "Bandages", "Anti inflammatory", "Vitamin injection"]
	
	dogClass.name = "Dog"
	dogClass.rarity = 0
	dogClass.weightLow = 40
	dogClass.weightHigh = 85
	dogClass.nameList = ["Border Collie", "Chocolate Lab", "Rhodesian Ridgeback", "Golden Retriever", "Terrier", "Black Shiba Inu", "Schipperke", "White German Shepherd"]
	dogClass.symptomList = ["Flu meds", "Mange meds", "Flea meds", "Dewormer", "Splint", "Bandages", "Anti inflammatory", "Vitamin injection"]
	
	fishClass.name = "Fish"
	fishClass.rarity = 1
	fishClass.weightLow = 0.1
	fishClass.weightHigh = 1
	fishClass.nameList = ["Blue Beta", "Light Blue Beta", "Orange Guppy", "Red Beta", "Yellow Guppy", "Orange Koi", "Red Koi", "Tricolor Koi"]
	fishClass.symptomList = ["Parasite meds", "Tank filter"]
	
	duckClass.name = "Duck"
	duckClass.rarity = 1
	duckClass.weightLow = 1
	duckClass.weightHigh = 4
	duckClass.nameList = ["Black", "Brown", "Mallard (Female)", "Mallard (Male)", "Mandarin (Female)", "Mandarin (Male)", "White", "Yellow"]
	duckClass.symptomList = ["Eye drops", "Med bath", "Antibiotics", "Antifungal"]
	
	rabbitClass.name = "Rabbit"
	rabbitClass.rarity = 1
	rabbitClass.weightLow = 2
	rabbitClass.weightHigh = 10
	rabbitClass.nameList = ["Black", "Dutch", "Brown", "Californian", "Harlequin", "White", "Golden"]
	rabbitClass.symptomList = ["Flu meds", "Mange meds", "Flea meds", "Dewormer", "Splint", "Bandages", "Anti inflammatory", "Vitamin injection"]
	
	ratClass.name = "Rat"
	ratClass.rarity = 2
	ratClass.weightLow = 0.5
	ratClass.weightHigh = 1.5
	ratClass.nameList = ["Black", "Black Piebald", "Blue", "Gray", "Gray Piebald", "Brown", "Brown Piebald", "Tan Piebald"]
	ratClass.symptomList = ["Flu meds", "Mange meds", "Flea meds", "Dewormer", "Splint", "Bandages", "Anti inflammatory", "Vitamin injection"]
	
	frogClass.name = "Frog"
	frogClass.rarity = 2
	frogClass.weightLow = 0.1
	frogClass.weightHigh = 5
	frogClass.nameList = ["Brown", "Green", "Tree", "White", "Golden", "Blue Poison", "Red Poison", "Yellow Poison"]
	frogClass.symptomList = ["Mineral bath", "Eye cream"]
	
	birdClass.name = "Bird"
	birdClass.rarity = 3
	birdClass.weightLow = 0.1
	birdClass.weightHigh = 1
	birdClass.nameList = ["Red Canary", "Yellow Canary", "Gray Cockatiel", "White Cockatiel", "Green Lovebird", "Rainbow Lovebird", "Blue Parakeet", "Green Parakeet"]
	birdClass.symptomList = ["Eye drops", "Med bath", "Antibiotics", "Antifungal"]
	
	axolotlClass.name = "Axolotl"
	axolotlClass.rarity = 3
	axolotlClass.weightLow = 0.1
	axolotlClass.weightHigh = 1
	axolotlClass.nameList = ["Black", "Copper", "Golden", "Lavender", "Piebald", "Pink", "Sunglasses", "Red"]
	axolotlClass.symptomList = ["Thyroid meds", "Antifungal", "Refrigeration"]
	
	dragonClass.name = "Dragon"
	dragonClass.rarity = 4
	dragonClass.weightLow = 5
	dragonClass.weightHigh = 15
	dragonClass.nameList = ["Air", "Earth", "Fire", "Frost", "Light", "Shadow", "Soul", "Water"]
	dragonClass.symptomList = ["Antibiotics", "Flu meds", "Teddy bear", "Claw cream"]

	symptomDict = {"Flu meds" : fever, "Mange meds" : rashes, "Flea meds" : itching, "Dewormer" : vomiting, "Splint" : limping, "Bandages" : bleeding, "Anti inflammatory" : swelling, "Vitamin injection" : lethargy, "Eye drops" : eyeCrusts, "Med bath" : damagedFeathers, "Antibiotics" : sneezing, "Antifungal" : fuzzGrowth, "Parasite meds" : weightLoss, "Tank filter" : gasping, "Mineral bath" : drySkin, "Eye cream" : cloudyEyes, "Thyroid meds" : bloating, "Refrigeration" : floating, "Teddy bear" : irritability, "Claw cream" : dryClaws}
