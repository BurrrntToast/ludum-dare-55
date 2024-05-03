extends Node2D

const main_menu = "res://menus/main menu/main_menu.tscn"

@onready var playtime_text = $Control/CenterContainer/VBoxContainer/PlaytimeText
@onready var spawned_text = $Control/CenterContainer/VBoxContainer/SpawnedText
@onready var jumps_text = $Control/CenterContainer/VBoxContainer/JumpsText
@onready var deaths_text = $Control/CenterContainer/VBoxContainer/DeathsText
@onready var back_button = $Control/CenterContainer/VBoxContainer/BackButton

func _ready():
	
	back_button.grab_focus()
	TransitionManager.transition_in()
	
	playtime_text.text = "Playtime: " + str(StatisticsTracking.playtime)
	spawned_text.text = "Bergs Berged: " + str(StatisticsTracking.bergs_spawned)
	jumps_text.text = "Jumps: " + str(StatisticsTracking.jumps)
	deaths_text.text = "Deaths: " + str(StatisticsTracking.deaths)

func _on_back_button_pressed():
	TransitionManager.transition_to_scene(main_menu)
