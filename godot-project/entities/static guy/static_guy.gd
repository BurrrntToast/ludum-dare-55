extends StaticBody2D

const guy1_spritesheet = preload("res://resources/textures/guy 1/guy1_spritesheet.png")
const guy2_spritesheet = preload("res://resources/textures/guy 2/guy2_spritesheet.png")
const guy3_spritesheet = preload("res://resources/textures/guy 3/guy3_spritesheet.png")

@onready var guy_sprite_array = [guy1_spritesheet, guy2_spritesheet, guy3_spritesheet]
@onready var guy_collision_size_array = [Vector2(8, 8), Vector2(8, 10), Vector2(8, 13)]
@onready var guy_collision_position_array = [Vector2(0, 4), Vector2(0, 3), Vector2(0, 1.5)]
@onready var sprite = $Sprite
@onready var sprite_mask = $SpriteMask
@onready var collision_shape = $CollisionShape2D
@onready var area_collision_shape = $Area2D/CollisionShape2D2
@onready var sprite_anim = $SpriteAnim

func setup(guy_num, col):
	set_collision_size(guy_num)
	set_collision_shape(guy_num)
	set_sprite(guy_num)
	set_colour(col)
	$SpriteAnim.play("summon")

func set_collision_size(guy_num):
	collision_shape.shape.size = guy_collision_size_array[guy_num]
	area_collision_shape.shape.size = guy_collision_size_array[guy_num]

func set_collision_shape(guy_num):
	collision_shape.position = guy_collision_position_array[guy_num]
	area_collision_shape.position = guy_collision_position_array[guy_num]

func set_sprite(guy_num):
	sprite.texture = guy_sprite_array[guy_num]
	sprite_mask.texture = guy_sprite_array[guy_num]

func set_colour(col):
	sprite.self_modulate = col
