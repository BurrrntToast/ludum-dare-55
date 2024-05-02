extends Node2D

const main_menu : String = "res://menus/main menu/main_menu.tscn"

@onready var music_slider = $Control/CenterContainer/VBoxContainer/Music/Slider
@onready var sfx_slider = $Control/CenterContainer/VBoxContainer/SFX/Slider
@onready var back_button = $Control/CenterContainer/VBoxContainer/BackButton

func _ready():
	TransitionManager.transition_in()
	music_slider.grab_focus()

func _on_back_button_pressed():
	TransitionManager.transition_to_scene(main_menu)
