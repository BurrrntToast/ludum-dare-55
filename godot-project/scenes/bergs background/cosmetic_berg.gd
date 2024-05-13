extends Sprite2D

var active = false

var speed = 30

# random berg size
# random berg colour
# random berg animation state
# random berg rotation
# random berg scale

func _process(delta):
	if active:
		position.y += speed * delta
