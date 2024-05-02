extends Node2D

const main_menu : String = "res://menus/main menu/main_menu.tscn"

@onready var back_button = $Control/CenterContainer/VBoxContainer/BackButton

func _ready():
	TransitionManager.transition_in()
	back_button.grab_focus()

# back button
func _on_back_button_pressed():
	TransitionManager.transition_to_scene(main_menu)
