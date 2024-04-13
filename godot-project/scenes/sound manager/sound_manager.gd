extends Node2D

@onready var summon_sound = $PlayerSounds/SummonSound
@onready var jump_sound = $PlayerSounds/JumpSound

func play_summon_sound():
	summon_sound.play()
