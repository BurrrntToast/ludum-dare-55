extends Node2D

# this whole script is a mess LOL

@export var target_scene : String 
@export var plate1_required : bool = false
@export var plate2_required : bool = false
@export var plate3_required : bool = false

@onready var flag_sprite = $FlagSprite
@onready var portal_particle = $PortalParticle

@onready var plate1 = $Plate1
@onready var plate2 = $Plate2
@onready var plate3 = $Plate3
@onready var plate1_collision = $Plate1/Plate1Collision
@onready var plate2_collision = $Plate2/Plate2Collision
@onready var plate3_collision = $Plate3/Plate3Collision

var plate1_active : bool = false
var plate2_active : bool = false
var plate3_active : bool = false

var flag_active : bool = false
var used : bool = false

func _ready():
	if !plate1_required:
		plate1_active = true
		plate1.hide()
		plate1_collision.set_deferred("disabled", true)
	
	if !plate2_required:
		plate2_active = true
		plate2.hide()
		plate2_collision.set_deferred("disabled", true)
	
	if !plate3_required:
		plate3_active = true
		plate3.hide()
		plate3_collision.set_deferred("disabled", true)
	
	should_flag_be_active()

func should_flag_be_active():
	if plate1_active and plate2_active and plate3_active:
		flag_active = true
		flag_sprite.self_modulate = "ffec27"
		portal_particle.color = "ffffff"
	else:
		flag_active = false
		flag_sprite.self_modulate = "3b3b3b"
		portal_particle.color = "000000"
	
func _on_area_2d_area_entered(area):
	if area.is_in_group("guy") and flag_active and !used:
		used = true
		TransitionManager.transition_to_scene(target_scene)
		SoundManager.play_portal_sound()

func _on_plate_1_area_entered(area):
	plate1_active = true
	should_flag_be_active()
	
	if area.is_in_group("static"):
		plate1_collision.set_deferred("disabled", true)
	

func _on_plate_1_area_exited(_area):
	plate1_active = false
	
	if plate1_collision.disabled:
		plate1_active = true

	should_flag_be_active()
	
func _on_plate_2_area_entered(area):
	plate2_active = true
	should_flag_be_active()

	if area.is_in_group("static"):
		plate2_collision.set_deferred("disabled", true)

func _on_plate_2_area_exited(_area):
	plate2_active = false
	
	if plate2_collision.disabled:
		plate2_active = true
	
	should_flag_be_active()

func _on_plate_3_area_entered(area):
	plate3_active = true
	should_flag_be_active()
	
	if area.is_in_group("static"):
		plate3_collision.set_deferred("disabled", true)

func _on_plate_3_area_exited(_area):
	plate3_active = false
	
	if plate3_collision.disabled:
		plate3_active = true
	
	should_flag_be_active()
