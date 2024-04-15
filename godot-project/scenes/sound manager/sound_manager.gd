extends Node2D

@onready var summon_sound = $PlayerSounds/SummonSound
@onready var jump_sound = $PlayerSounds/JumpSound
@onready var walk_sound = $PlayerSounds/WalkSound
@onready var death_sound = $PlayerSounds/DeathSound
@onready var portal_sound = $PlayerSounds/PortalSound


func play_summon_sound():
	var rand_pitch = randf_range(0.8, 1.2)
	summon_sound.pitch_scale = rand_pitch
	summon_sound.play()

func play_walk_sound():
	if !walk_sound.playing:
		walk_sound.play()

func play_death_sound():
	death_sound.play()
	
func play_portal_sound():
	portal_sound.play()
