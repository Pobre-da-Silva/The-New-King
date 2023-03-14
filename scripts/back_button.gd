extends TextureButton

func _ready():
	pass
	
func _pressed():
	get_tree().change_scene_to(load('res://scenes//menu.tscn'))
