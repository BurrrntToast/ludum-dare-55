extends Node2D

const GUY_1 = preload("res://entities/guys/guy1.tscn")
const GUY_2 = preload("res://entities/guys/guy2.tscn")
const GUY_3 = preload("res://entities/guys/guy3.tscn")
const STATIC_GUY = preload("res://entities/static guy/static_guy.tscn")

@onready var array_of_guys = [GUY_1, GUY_2, GUY_3]

@onready var shell_holder = $ShellHolder
@onready var player_holder = $PlayerHolder
@onready var guy_spawn_pos = $PlayerHolder/GuySpawnPos

var current_guy = null

func _ready():

	guy_spawn_pos.visible = false

	var default_guy = GUY_2.instantiate()
	default_guy.global_position = guy_spawn_pos.global_position
	player_holder.add_child(default_guy)
	current_guy = default_guy
	
	TransitionManager.transition_in()
	
func _process(_delta):
	if Input.is_action_just_pressed("summon"):
		if current_guy.global_position.y > 0.0 and current_guy.can_summon:
			make_static_guy()
			summon_random_guy()
			SoundManager.play_summon_sound()
			StatisticsTracking.bergs_spawned += 1
			StatisticsTracking.run_bergs_spawned += 1
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
func make_static_guy():
	var new_static_guy = STATIC_GUY.instantiate()
	new_static_guy.global_position = current_guy.global_position
	shell_holder.add_child(new_static_guy)
	new_static_guy.setup(current_guy.guy_id - 1, current_guy.current_colour)

	guy_spawn_pos.global_position.x = current_guy.global_position.x
	guy_spawn_pos.global_position.y = -20
	
	current_guy.queue_free()
	current_guy = null

func summon_random_guy():
	var new_guy_scene = array_of_guys.pick_random()
	var new_guy = new_guy_scene.instantiate()
	new_guy.global_position = guy_spawn_pos.global_position
	player_holder.add_child(new_guy)
	current_guy = new_guy
