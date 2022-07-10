extends Node2D
# This is the base animal node

# Node paths


# Basic Animal Stats
onready var arrayPos := 0

# Health stats
onready var happiness := 0
onready var health := 0
onready var alive := true
onready var affliction := ""

# Static stats
onready var xpYield := 0
onready var weight := 0
onready var height := 0


func initialize(p_animation, p_xpYield, p_affliction, p_health, p_happiness):
	$AnimatedSprite.animation = p_animation
	affliction = p_affliction
	xpYield = p_xpYield
	health = p_health
	happiness = p_happiness
	
func _ready():
	var randFloat = randf()
	if randFloat > 0.5:
		$AnimatedSprite.animation = "dog" + str(floor(rand_range(1, 8.99)))
	else:
		$AnimatedSprite.animation = "cat" + str(floor(rand_range(1, 8.99)))
	$AnimatedSprite.speed_scale = rand_range(0.5, 1.5)





func _on_AnimalArea2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			print("Animal Position in array is " + str(arrayPos))


func _on_AnimalArea2D_mouse_entered():
	$AnimatedSprite.get_material().set_shader_param("opacity", 1)
	$animalShadow.visible = true


func _on_AnimalArea2D_mouse_exited():
	$AnimatedSprite.get_material().set_shader_param("opacity", 0)
	$animalShadow.visible = false
