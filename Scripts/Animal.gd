extends Node2D
# This is the base animal node

# Node paths


# Basic Animal Stats
onready var happiness := 0
onready var health := 0
onready var alive := true
onready var xpYield := 0
onready var weight := 0
onready var height := 0


func initialize(species):
	$AnimatedSprite.animation = species
