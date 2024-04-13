extends CharacterBody2D

const STATIC_PLAYER = preload("res://entities/static player/static_player.tscn")

@export var speed : float = 150.0

@export var jump_height : float = 20.0
@export var time_to_peak_time : float = 0.2
@export var time_to_descent_time : float = 0.2

@onready var jump_velocity : float = ((2.0 * jump_height) / time_to_peak_time) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (time_to_peak_time * time_to_peak_time)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (time_to_descent_time * time_to_descent_time)) * -1.0

func _process(delta):
	
	if Input.is_action_just_pressed("summon"):
		var STATIC_PLAYER_INSTANCE = STATIC_PLAYER.instantiate()
		STATIC_PLAYER_INSTANCE.global_position = global_position
		GlobalScript.current_shell_holder.add_child(STATIC_PLAYER_INSTANCE)
		global_position.y = -20

func _physics_process(delta):
	velocity.y += get_gravity() * delta # apply gravity
	handle_movement()
	move_and_slide()

func handle_movement():
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
func jump():
	velocity.y = jump_velocity
	
func get_gravity():
	if velocity.y < 0.0: return jump_gravity
	else: return fall_gravity
