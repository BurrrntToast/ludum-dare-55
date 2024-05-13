extends Node2D

const first_scene : String = "res://scenes/levels/level_1.tscn"
const option_menu : String = "res://menus/options menu/options_menu.tscn"
const credits_menu : String = "res://menus/credit menu/credits_menu.tscn"
const statistics_menu = "res://menus/statistics menu/statistics_menu.tscn"

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
	play_button.grab_focus()

# play button
func _on_play_button_pressed():
	TransitionManager.transition_to_scene(first_scene)

# options button
func _on_options_button_pressed():
	TransitionManager.transition_to_scene(option_menu)

# credits button
func _on_credits_button_pressed():
	TransitionManager.transition_to_scene(credits_menu)

func _on_statistics_button_pressed():
	TransitionManager.transition_to_scene(statistics_menu)

# quit button
func _on_quit_button_pressed():
	get_tree().quit()

