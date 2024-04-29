extends Node

var time : float = 0.0
var active : bool = false

func _process(delta):
	if active:
		time += delta
	
func reset_timer():
	time = 0

func start_timer():
	active = true

func stop_timer():
	active = false
