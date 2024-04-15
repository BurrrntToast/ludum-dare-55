extends Node2D

const RECTANGLE = preload("res://scenes/background/rectangle.tscn")
const SQUARE = preload("res://scenes/background/square.tscn")

@onready var shape_holder = $ShapeHolder

func _ready():
	populate_background()

func populate_background():
	
	var rand_sqares = randi_range(5, 15)
	var rand_rectangles = randi_range(5, 15)
	
	for i in rand_rectangles:
		
		var rand_scale = randf_range(2.0,4.0)
		var rand_x_pos = randf_range(0.0, 160.0)
		var rand_y_pos = randf_range(0.0, 160.0)
		var rand_rotations = randi_range(0.0, 360.0)
		
		var rect_instance = RECTANGLE.instantiate()
		rect_instance.scale = Vector2(rand_scale, rand_scale)
		rect_instance.global_position = Vector2(rand_x_pos, rand_y_pos)
		rect_instance.rotation_degrees = rand_rotations
		shape_holder.add_child(rect_instance)

	for i in rand_sqares:
		
		var rand_scale = randf_range(2.0,4.0)
		var rand_x_pos = randf_range(0.0, 160.0)
		var rand_y_pos = randf_range(0.0, 160.0)
		var rand_rotations = randi_range(0.0, 360.0)
		
		var square_instance = SQUARE.instantiate()
		square_instance.scale = Vector2(rand_scale, rand_scale)
		square_instance.global_position = Vector2(rand_x_pos, rand_y_pos)
		square_instance.rotation_degrees = rand_rotations
		shape_holder.add_child(square_instance)
	
