extends CharacterBody2D

const STATIC_GUY = preload("res://entities/static guy/static_guy.tscn")

@onready var jump_sound = $JumpSound
@onready var sprite = $Sprite
@onready var shadow = $Shadow
@onready var sprite_anim = $SpriteAnim

@export var guy_id : float = 0
@export var speed : float = 150.0

@export var jump_height : float = 20.0
@export var time_to_peak_time : float = 0.2
@export var time_to_descent_time : float = 0.2

@onready var jump_velocity : float = ((2.0 * jump_height) / time_to_peak_time) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (time_to_peak_time * time_to_peak_time)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (time_to_descent_time * time_to_descent_time)) * -1.0

@onready var all_colours : Array = ["#ff004d", "#00e436", "#ffec27", "#29adff", "#ffa300"]
@onready var current_colour : String = "" 

var is_active : bool = false
var on_ground : bool = true
var can_summon : bool = true
var can_die : bool = true

func _ready():
	pick_random_colour()
	can_summon = true

func _process(_delta):
	
	if is_on_floor() and !is_active:
		is_active = true
		
	if is_on_floor() and !on_ground:
		sqeeze()
		on_ground = true
		
	if position.y > 170 or position.x > 170 or position.x < -10:
		if can_die:
			respawn()
			SoundManager.play_death_sound()
		
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
		play_walk_anim()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		play_idle_anim()
	
func jump():
	velocity.y = jump_velocity
	on_ground = false
	jump_sound.play()
	stretch()
	
func get_gravity():
	if velocity.y < 0.0: return jump_gravity
	else: return fall_gravity
	
func pick_random_colour():
	current_colour = all_colours.pick_random()
	sprite.self_modulate = current_colour

func play_walk_anim():
	if !sprite_anim.is_playing():
		sprite_anim.play("walk")

func play_idle_anim():
	sprite_anim.play("idle")
	
func play_walk_sound():
	if is_on_floor():
		SoundManager.play_walk_sound()

func stretch():
	var sprite_stretch_tween = create_tween()
	sprite_stretch_tween.tween_property(sprite, "scale", Vector2(0.8, 1.2), 0.1).set_trans(Tween.TRANS_CUBIC)
	sprite_stretch_tween.tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.1).set_trans(Tween.TRANS_CUBIC)

	var shadow_stretch_tween = create_tween()
	shadow_stretch_tween.tween_property(shadow, "scale", Vector2(0.8, 1.2), 0.1).set_trans(Tween.TRANS_CUBIC)
	shadow_stretch_tween.tween_property(shadow, "scale", Vector2(1.0, 1.0), 0.1).set_trans(Tween.TRANS_CUBIC)

func sqeeze():
	var sprite_sqeeze_tween = create_tween()
	sprite_sqeeze_tween.tween_property(sprite, "scale", Vector2(1.2, .8), 0.1).set_trans(Tween.TRANS_CUBIC)
	sprite_sqeeze_tween.tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.1).set_trans(Tween.TRANS_CUBIC)
	
	var shadow_sqeeze_tween = create_tween()
	shadow_sqeeze_tween.tween_property(shadow, "scale", Vector2(1.2, .8), 0.1).set_trans(Tween.TRANS_CUBIC)
	shadow_sqeeze_tween.tween_property(shadow, "scale", Vector2(1.0, 1.0), 0.1).set_trans(Tween.TRANS_CUBIC)

func respawn():
	get_tree().reload_current_scene()

func _on_area_2d_area_entered(area):
	if area.is_in_group("no_summon_zone"):
		can_summon = false
		
	if area.is_in_group("flag"):
		can_die = false

func _on_area_2d_area_exited(area):
	if area.is_in_group("no_summon_zone"):
		can_summon = true
		
	if area.is_in_group("spike"):
		respawn()
