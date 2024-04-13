extends CharacterBody2D

const STATIC_PLAYER = preload("res://entities/static player/static_player.tscn")

@onready var jump_sound = $JumpSound
@onready var summon_sound = $SummonSound
@onready var sprite = $Sprite

@export var guy_id : float = 0
@export var speed : float = 150.0

@export var jump_height : float = 20.0
@export var time_to_peak_time : float = 0.2
@export var time_to_descent_time : float = 0.2

@onready var jump_velocity : float = ((2.0 * jump_height) / time_to_peak_time) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (time_to_peak_time * time_to_peak_time)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (time_to_descent_time * time_to_descent_time)) * -1.0

@onready var all_colours : Array = ["#ff004d", "#00e436", "#ffec27", "#29adff"]
@onready var current_colour : String = "" 

var is_active : bool = false

func _ready():
	pick_random_colour()

func _process(delta):
	
	if is_on_floor() and !is_active:
		is_active = true
	
	if Input.is_action_just_pressed("summon"):
		var STATIC_PLAYER_INSTANCE = STATIC_PLAYER.instantiate()
		STATIC_PLAYER_INSTANCE.global_position = global_position
		GlobalScript.current_shell_holder.add_child(STATIC_PLAYER_INSTANCE)
		STATIC_PLAYER_INSTANCE.setup(guy_id - 1, current_colour)
		pick_random_colour()
		global_position.y = -20
		is_active = false
		summon_sound.play()

func _physics_process(delta):
	velocity.y += get_gravity() * delta # apply gravity
	
	if is_active:
		handle_movement_input()

	move_and_slide()

func handle_movement_input():
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
		

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
func jump():
	velocity.y = jump_velocity
	jump_sound.play()
	
func get_gravity():
	if velocity.y < 0.0: return jump_gravity
	else: return fall_gravity
	
func pick_random_colour():
	current_colour = all_colours.pick_random()
	sprite.self_modulate = current_colour
