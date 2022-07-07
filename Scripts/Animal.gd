extends Node2D
# This is the base animal node

# Node paths


# Basic Animal Stats

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
	$AnimatedSprite.animation = "dog" + str(round(rand_range(1, 8.99)))
	$AnimatedSprite.speed_scale = rand_range(0.5, 1.5)
