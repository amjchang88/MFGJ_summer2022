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


func initialize(p_species, p_xpYield, p_affliction):
	$AnimatedSprite.animation = p_species
	affliction = p_affliction
	xpYield = p_xpYield
	
