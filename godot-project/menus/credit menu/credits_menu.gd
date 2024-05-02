extends Node2D

var main_menu : String = "res://menus/main menu/main_menu.tscn"

func _ready():
	TransitionManager.transition_in()

# back button
func _on_back_button_pressed():
	TransitionManager.transition_to_scene(main_menu)
