extends Node2D

onready var player = $playerknb
onready var rurik = $rurik
func _ready():
	var music_player = get_node("AudioStreamPlayer")
	music_player.play()
	music_player.volume_db = geral.volume - 15


func _process(delta):
	geral.player_rurik_distance = rurik.position.distance_to(player.position)
	#print(rurik.position.distance_to(player.position))
