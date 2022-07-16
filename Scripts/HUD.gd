extends Node2D

onready var global = get_node("/root/Global")

func _process(_delta):
	# set week number
	if global.week >= 10:
		$Week2.frame = global.week - 10
		$Week1.frame = 1
		
	else:
		$Week1.frame = 0
		$Week2.frame = global.week
	
	# set reputation bar length
	$TextureProgress.value = global.repuation
	
	# set season
	$Season.frame = global.season
