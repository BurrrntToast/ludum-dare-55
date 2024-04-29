extends Node

# add this node to the scene where the timer
# needs to be started
# in most cases this will be level 1

func _ready():
	TimerScript.reset_timer() # reset time value
	TimerScript.start_timer() # start timer
