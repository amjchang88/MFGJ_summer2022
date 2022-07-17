extends Node2D
# This is the base animal node

# Node paths
onready var infoPanel := get_tree().get_root().get_node("Main").get_node("InfoPanel")
onready var parent := get_parent()


# Basic Animal Stats
onready var arrayPos := 0

# Health stats
onready var happiness := 1
onready var health := .5
onready var alive := true
onready var affliction := " "
onready var symptom := " "
onready var gender := 0

# Static stats
onready var rarity := int(rand_range(0, 4.9))
onready var weight := 0
onready var height := 0
onready var animalName : String
onready var nickname : String = "Jeff"
onready var variation := 0


func initialize(p_animalName, p_nickname, p_variation, p_rarity, p_affliction, p_health, p_weight):
	variation = p_variation
	affliction = p_affliction
	rarity = p_rarity
	health = p_health
	weight = p_weight
	animalName = p_animalName
	nickname = p_nickname
	$AnimatedSprite.animation = animalName.to_lower() + str(variation)
	
func _ready():
	randomize()
	var randFloat = randf()
	if randFloat < 0.2:
		$AnimatedSprite.animation = "bird" + str(floor(rand_range(1, 8.99)))
	elif randFloat < 0.4:
		$AnimatedSprite.animation = "rat" + str(floor(rand_range(1, 8.99)))
	elif randFloat < 0.6:
		$AnimatedSprite.animation = "frog" + str(floor(rand_range(1, 8.99)))
	elif randFloat < 0.8:
		$AnimatedSprite.animation = "axolotl" + str(floor(rand_range(1, 8.99)))
	elif randFloat <= 1:
		$AnimatedSprite.animation = "dragon" + str(floor(rand_range(1, 8.99)))
	$AnimatedSprite.speed_scale = rand_range(0.5, 1.5)





func _on_AnimalArea2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and !parent.paused:
			infoPanel.move_to(2, 2)
			infoPanel.set_values(animalName, nickname, weight, symptom, affliction, gender, rarity)


func _on_AnimalArea2D_mouse_entered():
	$AnimatedSprite.get_material().set_shader_param("opacity", 1)
	$animalShadow.visible = true


func _on_AnimalArea2D_mouse_exited():
	$AnimatedSprite.get_material().set_shader_param("opacity", 0)
	$animalShadow.visible = false

