extends Node2D

onready var global = get_node("/root/Global")
onready var value = $TextureProgress.value

func _process(_delta):
	# set week number
	if global.week >= 10:
		$Week2.frame = global.week - 10
		$Week1.frame = 1
		
	else:
		$Week1.frame = 0
		$Week2.frame = global.week
	
	# set reputation bar length
	set_bar()
	
	# set season
	$Season.frame = global.season
	
	if global.reputation > 3000:
		global.reputation = 3000
	if global.reputation < 0:
		global.reputation = 0

func set_bar():
	if ($TextureProgress.value < global.reputation):
		$TextureProgress.value += 5
	if ($TextureProgress.value > global.reputation):
		$TextureProgress.value -= 5
