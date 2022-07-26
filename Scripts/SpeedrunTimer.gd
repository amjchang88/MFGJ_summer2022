extends Node2D

var time := 0.0
var running : bool = false
var minutes : float
var seconds : float
var ms : float

func _ready():
	self.visible = false
	
func run():
	if !running:
		self.visible = true
		running = true
	else:
		#self.visible = false
		running = false


func _process(delta : float):
	if running:
		time += delta
		
	minutes = time / 60
	seconds = fmod(time, 60)
	ms = fmod(time, 1) * 100
	
	var time_string := "%02d:%02d:%02d" % [minutes, seconds, ms]
	$Label.text = time_string
