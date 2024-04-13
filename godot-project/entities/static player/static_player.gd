extends StaticBody2D

const guy1_sprite = preload("res://resources/textures/guy 1/stand.png")
const guy2_sprite = preload("res://resources/textures/guy 2/stand.png")
const guy3_sprite = preload("res://resources/textures/guy 3/stand.png")

@onready var guy_sprite_array = [guy1_sprite, guy2_sprite, guy3_sprite]
@onready var guy_collision_size_array = [Vector2(12, 8), Vector2(12, 10), Vector2(12, 13)]
@onready var guy_collision_position_array = [Vector2(0, 4), Vector2(0, 3), Vector2(0, 1.5)]
@onready var sprite = $Sprite
@onready var collision_shape = $CollisionShape2D
@onready var area_collision_shape = $Area2D/CollisionShape2D2

func setup(guy_num, col):
	set_collision_size(guy_num)
	set_collision_shape(guy_num)
	set_sprite(guy_num)
	set_colour(col)

func set_collision_size(guy_num):
	collision_shape.shape.size = guy_collision_size_array[guy_num]
	area_collision_shape.shape.size = guy_collision_size_array[guy_num]

func set_collision_shape(guy_num):
	collision_shape.position = guy_collision_position_array[guy_num]
	area_collision_shape.position = guy_collision_position_array[guy_num]

func set_sprite(guy_num):
	sprite.texture = guy_sprite_array[guy_num]

func set_colour(col):
	sprite.self_modulate = col
