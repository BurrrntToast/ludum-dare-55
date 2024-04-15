extends Node2D

var current_level : Node2D
var current_shell_holder : Node2D

func _process(_delta):
	
	if Input.is_action_just_pressed("mute"):
		AudioServer.set_bus_mute(0, !AudioServer.is_bus_mute(0))
