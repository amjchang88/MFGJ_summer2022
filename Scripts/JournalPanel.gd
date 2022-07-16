extends UIPanel

onready var animalPanel = get_tree().get_root().get_node("Main").get_node("AnimalPanel")
onready var global = get_node("/root/Global")

signal returned 

var paused := false

func _ready():
	pass


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	# clicked back button
	if event is InputEventMouseButton:
		if event.pressed and !paused:
			move_to(defaultX, defaultY)
			emit_signal("returned")

func _on_AnimalPanel_returned():
	paused = false
	
func set_panel(p_name : String):
	var localName : String = global.get(p_name + "Class").name
	var localVariationList = global.get(p_name + "Class").variationList
	var localNameList = global.get(p_name + "Class").nameList
	var localRarity = global.get(p_name + "Class").rarity
	
	if !paused:
		animalPanel.move_to(112, 2)
		animalPanel.initialize(localName, localVariationList, localNameList, localRarity)
		paused = true
		
# calling set panel functions
func _on_Cat_clicked():
	set_panel("cat")
func _on_Dog_clicked():
	set_panel("dog")
func _on_Fish_clicked():
	set_panel("fish")
func _on_Rabbit_clicked():
	set_panel("rabbit")
func _on_Duck_clicked():
	set_panel("duck")
func _on_Rat_clicked():
	set_panel("rat")
func _on_Frog_clicked():
	set_panel("frog")
func _on_Bird_clicked():
	set_panel("bird")
func _on_Axolotl_clicked():
	set_panel("axolotl")
func _on_Dragon_clicked():
	set_panel("dragon")
