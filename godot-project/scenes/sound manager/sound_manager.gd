extends Node2D

@onready var summon_sound = $PlayerSounds/SummonSound
@onready var jump_sound = $PlayerSounds/JumpSound
@onready var walk_sound = $PlayerSounds/WalkSound

func play_summon_sound():
	summon_sound.play()

func play_walk_sound():
	if !walk_sound.playing:
		walk_sound.play()
