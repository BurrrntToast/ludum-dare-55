extends CharacterBody2D

const STATIC_GUY = preload("res://entities/static guy/static_guy.tscn")

@onready var jump_sound = $JumpSound
@onready var sprite = $Sprite
@onready var sprite_anim = $SpriteAnim

@export var jump_height : float = 20.0
@export var time_to_peak_time : float = 0.2
@export var time_to_descent_time : float = 0.2

@onready var jump_velocity : float = ((2.0 * jump_height) / time_to_peak_time) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (time_to_peak_time * time_to_peak_time)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (time_to_descent_time * time_to_descent_time)) * -1.0

@onready var all_colours : Array = ["#ff004d", "#00e436", "#ffec27", "#29adff", "#ffa300"]
@onready var current_colour : String = "" 

var on_ground : bool = true

func _ready():
	pick_random_colour()

func _process(_delta):
		
	if is_on_floor() and !on_ground:
		sqeeze()
		on_ground = true
		
func _physics_process(delta):
	velocity.y += get_gravity() * delta # apply gravity
	
	move_and_slide()
	
func get_gravity():
	if velocity.y < 0.0: return jump_gravity
	else: return fall_gravity
	
func pick_random_colour():
	current_colour = all_colours.pick_random()
	sprite.self_modulate = current_colour

func stretch():
	var stretch_tween = create_tween()
	stretch_tween.tween_property(self, "scale", Vector2(0.8, 1.2), 0.1).set_trans(Tween.TRANS_CUBIC)
	stretch_tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1).set_trans(Tween.TRANS_CUBIC)

func sqeeze():
	var sqeeze_tween = create_tween()
	sqeeze_tween.tween_property(self, "scale", Vector2(1.2, .8), 0.1).set_trans(Tween.TRANS_CUBIC)
	sqeeze_tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1).set_trans(Tween.TRANS_CUBIC)
