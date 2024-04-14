extends Area2D

@onready var zone = $Zone
@onready var collision_shape = $CollisionShape2D

func _ready():
	TransitionManager.transition_in()
	
	var zone_size = zone.size
	
	collision_shape.shape.size = zone_size
	collision_shape.position = (zone_size / 2.0) + zone.position
