extends Node

var time : float = 0.0
var active : bool = false

var mils : float = 0.0
var secs : float = 0.0
var mins : float = 0.0
var hrs : float = 0.0

var time_text : String = "%02d:%02d:%02d:%02d" % [hrs,mins,secs,mils]

func _process(delta):
	if active:
		time += delta
	
func reset_timer():
	time = 0
	update_time_values()

func start_timer():
	active = true

func stop_timer():
	active = false
	update_time_values()

func update_time_values():
	mils = fmod(time,1)*1000
	secs = fmod(time,60)
	mins = fmod(time,3600) / 60
	hrs = fmod(fmod(time,3600 * 60) / 3600,24)
	
	time_text = "%02d:%02d:%02d:%02d" % [hrs,mins,secs,mils]
