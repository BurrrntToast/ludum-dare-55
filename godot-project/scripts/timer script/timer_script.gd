extends Node

var time : float = 0.0
var active : bool = false

func _process(delta):
	if active:
		time += delta
	
func reset_timer():
	time = 0

func pause_timer():
	active = false

func resume_timer():
	active = true
