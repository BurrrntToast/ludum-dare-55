extends Node

# add this node to the scene where the timer
# needs to be stopped
# in most cases this will be the final level

func _ready():
	TimerScript.stop_timer()
	StatisticsTracking.run_playtime = TimerScript.time
