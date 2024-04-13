extends Node2D

@export var target : String 
@export var plate1_required : bool = false
@export var plate2_required : bool = false
@export var plate3_required : bool = false

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
	
func _on_area_2d_area_entered(_area):
	pass#get_tree().change_scene_to_file(target)
	# replace later with scene transition and stuff

func _on_plate_1_area_entered(_area):
	should_flag_be_active()
	plate1_active = true

func _on_plate_1_area_exited(_area):
	should_flag_be_active()
	plate1_active = false

func _on_plate_2_area_entered(_area):
	should_flag_be_active()
	plate2_active = true

func _on_plate_2_area_exited(_area):
	should_flag_be_active()
	plate2_active = false

func _on_plate_3_area_entered(_area):
	should_flag_be_active()
	plate3_active = true

func _on_plate_3_area_exited(_area):
	should_flag_be_active()
	plate3_active = false
