extends Node2D

var first_scene : String = "res://scenes/levels/level_1.tscn"
var option_menu : String
var credits_menu : String

@onready var play_button = $Control/CenterContainer/OptionsContainer/PlayButton
@onready var options_button = $Control/CenterContainer/OptionsContainer/OptionsButton
@onready var credits_button = $Control/CenterContainer/OptionsContainer/CreditsButton
@onready var quit_button = $Control/CenterContainer/OptionsContainer/QuitButton

# TODO 
# add sound
# add options screen
# add credits screen
# add title text
# add some bergs about

func _ready():
	TransitionManager.transition_in()

# play button
func _on_play_button_pressed():
	TransitionManager.transition_to_scene(first_scene)

# options button
func _on_options_button_pressed():
	TransitionManager.transition_to_scene(option_menu)

# credits button
func _on_credits_button_pressed():
	TransitionManager.transition_to_scene(credits_menu)

# quit button
func _on_quit_button_pressed():
	get_tree().quit()
