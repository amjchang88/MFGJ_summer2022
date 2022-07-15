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

# Static stats
onready var xpYield := 0
onready var weight := 0
onready var height := 0


func initialize(p_animation, p_xpYield, p_affliction, p_health, p_weight):
	$AnimatedSprite.animation = p_animation
	affliction = p_affliction
	xpYield = p_xpYield
	health = p_health
	weight = p_weight
	
	
func _ready():
	randomize()
	var randFloat = randf()
	if randFloat < 0.2:
		$AnimatedSprite.animation = "dog" + str(floor(rand_range(1, 8.99)))
	elif randFloat < 0.4:
		$AnimatedSprite.animation = "cat" + str(floor(rand_range(1, 8.99)))
	elif randFloat < 0.6:
		$AnimatedSprite.animation = "fish" + str(floor(rand_range(1, 8.99)))
	elif randFloat < 0.8:
		$AnimatedSprite.animation = "rabbit" + str(floor(rand_range(1, 8.99)))
	elif randFloat <= 1:
		$AnimatedSprite.animation = "duck" + str(floor(rand_range(1, 8.99)))
	$AnimatedSprite.speed_scale = rand_range(0.5, 1.5)





func _on_AnimalArea2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and !parent.paused:
			infoPanel.move_to(2, 2)


func _on_AnimalArea2D_mouse_entered():
	$AnimatedSprite.get_material().set_shader_param("opacity", 1)
	$animalShadow.visible = true


func _on_AnimalArea2D_mouse_exited():
	$AnimatedSprite.get_material().set_shader_param("opacity", 0)
	$animalShadow.visible = false

