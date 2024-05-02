extends Node2D

const main_menu : String = "res://menus/main menu/main_menu.tscn"

@onready var music_slider = $Control/CenterContainer/VBoxContainer/Music/MusicSlider
@onready var sfx_slider = $Control/CenterContainer/VBoxContainer/Sfx/SfxSlider
@onready var back_button = $Control/CenterContainer/VBoxContainer/BackButton

@onready var music_bus_id = AudioServer.get_bus_index("Music")
@onready var sfx_bus_id = AudioServer.get_bus_index("SFX")

func _ready():
	TransitionManager.transition_in()
	music_slider.grab_focus()

func _on_back_button_pressed():
	TransitionManager.transition_to_scene(main_menu)

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus_id, linear_to_db(value))

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(sfx_bus_id, linear_to_db(value))
