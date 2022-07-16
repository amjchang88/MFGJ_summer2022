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
	if $TextureProgress.value < global.reputation:
		$TextureProgress.value += 1
	if $TexttureProgress.value > global.reputation:
		$TextureProgress.value += 1
	
	# set season
	$Season.frame = global.season
