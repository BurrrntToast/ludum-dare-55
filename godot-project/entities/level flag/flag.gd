extends Area2D

@export var target : String 

func _on_area_entered(area):
	get_tree().change_scene_to_file(target)
	# replace later with scene transition and stuff
