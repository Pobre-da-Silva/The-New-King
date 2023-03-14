extends Node2D

func _ready():
	var music_player = get_node("AudioStreamPlayer")
	music_player.play()
	music_player.volume_db = geral.volume


