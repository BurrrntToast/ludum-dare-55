extends Node2D

@onready var out_anim = $OutAnim
@onready var in_anim = $InAnim

var next_scene : String = ""

func transition_in():
	in_anim.play("fade_in")

func transition_to_scene(scene):
	next_scene = scene
	out_anim.play("fade_out")

func change_scene():
	get_tree().change_scene_to_file(next_scene)

func _on_out_anim_animation_finished(_anim_name):
	change_scene()
