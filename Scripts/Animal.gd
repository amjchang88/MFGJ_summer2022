extends Node2D
# This is the base animal node

# Node paths
onready var infoPanel := get_tree().get_root().get_node("Main").get_node("InfoPanel")
onready var parent := get_parent()


# Basic Animal Stats
onready var arrayPos := 0

# Health stats
onready var happiness := 1
onready var health := 2
onready var alive := true
onready var affliction := " "
onready var symptom := "Fever"
onready var gender := 0
onready var treatment

# Static stats
onready var rarity := 0
onready var weight : float = 0
onready var height := 0
onready var animalName : String = "Cat"
onready var nickname : String = "Bao"
onready var variation := 0


func initialize(p_animalName, p_variation, p_rarity, p_symptom, p_ttk, p_weight, p_gender):
	variation = p_variation
	symptom = p_symptom
	rarity = p_rarity
	health = p_ttk
	weight = p_weight
	animalName = p_animalName
	$AnimatedSprite.animation = animalName.to_lower() + str(variation)
	gender = p_gender
	
func _ready():
	randomize()
	var p_gender = randi() % 2
	gender = p_gender
	weight = 5.1
	





func _on_AnimalArea2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and !parent.paused and alive:
			infoPanel.move_to(2, 2)
			infoPanel.set_values(animalName, nickname, weight, symptom, affliction, gender, rarity, $AnimatedSprite.animation)


func _on_AnimalArea2D_mouse_entered():
	$AnimatedSprite.get_material().set_shader_param("opacity", 1)
	$animalShadow.visible = true


func _on_AnimalArea2D_mouse_exited():
	$AnimatedSprite.get_material().set_shader_param("opacity", 0)
	$animalShadow.visible = false

