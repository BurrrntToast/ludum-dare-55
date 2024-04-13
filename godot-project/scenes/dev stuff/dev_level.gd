extends Node2D

func _ready():
	GlobalScript.current_level = self
	GlobalScript.current_shell_holder = $ShellHolder
