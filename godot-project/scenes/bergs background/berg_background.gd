extends Node2D

const RECTANGLE = preload("res://scenes/background/rectangle.tscn")
const SQUARE = preload("res://scenes/background/square.tscn")

const cosmetic_berg = preload("res://scenes/bergs background/cosmetic_berg.tscn")
const berg_1_texture = preload("res://resources/textures/guy 1/guy1_spritesheet.png")
const berg_2_texture = preload("res://resources/textures/guy 2/guy2_spritesheet.png")
const berg_3_texture = preload("res://resources/textures/guy 3/guy3_spritesheet.png")

@onready var berg_holder = $BergHolder
@onready var shape_holder = $ShapeHolder

# random berg texture
@onready var berg_textures : Array = [berg_1_texture, berg_2_texture, berg_3_texture]

# random berg colour
@onready var colours : Array = ["#ff004d", "#00e436", "#ffec27", "#29adff", "#ffa300"]

# random berg scale
const min_scale = 0.5
const max_scale = 1.5

# random berg speed
const min_speed = 20
const max_speed = 45

# random berg position
var min_y_pos = -5.0
var max_y_pos = -200

var min_x_pos = -5.0
var max_x_pos = 165

# random berg frame 
@onready var frame_states : Array = [0, 0, 0, 5]

func _ready():
	
	populate_background()

	TransitionManager.transition_in()
	max_y_pos = -25.0

func populate_background():
	
	var square_amount = randi_range(5, 15)
	var rectangle_amount = randi_range(5, 15)
	var berg_amount = 30
	
	for i in rectangle_amount:
		
		var rand_scale = randf_range(2.0,4.0)
		var rand_x_pos = randf_range(0.0, 160.0)
		var rand_y_pos = randf_range(0.0, 160.0)
		var rand_rotations = randi_range(0.0, 360.0)
		
		var rect_instance = RECTANGLE.instantiate()
		rect_instance.scale = Vector2(rand_scale, rand_scale)
		rect_instance.global_position = Vector2(rand_x_pos, rand_y_pos)
		rect_instance.rotation_degrees = rand_rotations
		shape_holder.add_child(rect_instance)

	for i in square_amount:
		
		var rand_scale = randf_range(2.0,4.0)
		var rand_x_pos = randf_range(0.0, 160.0)
		var rand_y_pos = randf_range(0.0, 160.0)
		var rand_rotations = randi_range(0.0, 360.0)
		
		var square_instance = SQUARE.instantiate()
		square_instance.scale = Vector2(rand_scale, rand_scale)
		square_instance.global_position = Vector2(rand_x_pos, rand_y_pos)
		square_instance.rotation_degrees = rand_rotations
		shape_holder.add_child(square_instance)

	for i in berg_amount:
		spawn_random_berg()

func spawn_random_berg():
	
	var berg_instance = cosmetic_berg.instantiate()
	berg_holder.add_child(berg_instance)
	
	berg_instance.position = set_berg_position()
	
	berg_instance.texture = set_berg_texture()
	berg_instance.self_modulate = set_berg_colour()
	berg_instance.frame = set_berg_pose()
	berg_instance.scale = set_berg_scale()
	berg_instance.rotation_degrees = set_berg_rotation()
	berg_instance.speed = set_berg_speed()
	berg_instance.active = true

func set_berg_position() -> Vector2:
	var rand_x = randf_range(min_x_pos, max_x_pos)
	var rand_y = randf_range(min_y_pos, max_y_pos)
	
	return Vector2(rand_x, rand_y)

func set_berg_texture() -> Texture2D:
	var text = berg_textures.pick_random()
	return text

func set_berg_colour() -> String:
	var col = colours.pick_random()
	return col

func set_berg_pose() -> int:
	var frame = frame_states.pick_random()
	return frame

func set_berg_scale() -> Vector2:
	var s = randf_range(min_scale, max_scale)
	return Vector2(s, s)

func set_berg_speed() -> int:
	var s = randi_range(min_speed, max_speed)
	return s

func set_berg_rotation() -> int:
	var rand = randi_range(1, 5)
	
	if rand == 1:
		return 180
	else:
		return 0


func _on_respawn_trigger_area_entered(area):
	if area.is_in_group("berg"):
		await get_tree().process_frame
		area.queue_free()
		spawn_random_berg()
