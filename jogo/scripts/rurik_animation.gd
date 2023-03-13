extends Sprite


func _ready():
	$AnimationPlayer.play("rurik")
	
func _process(delta):
	if geral.rurik_take_off_right == true:
		#make rurik go forward to dojo
		geral.rurik_take_off_right = false

