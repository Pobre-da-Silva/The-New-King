extends Sprite

var speed = 50

func _ready():
	$AnimationPlayer.play("rurik")
	
#func _process(delta):
#	if geral.rurik_take_off_right == true:
#		#make rurik go forward to dojo
#		while walk_count < 1347:
#			
#			walk_count += 1
#		geral.rurik_take_off_right = false

func _process(delta):
	
	if geral.rurik_take_off_right == true:
		#print(geral.rurik_take_off_right)
		
		# Define the target position to move to
		var target_position = Vector2(2000, position.y)
		
		# Calculate the distance and direction to move in
		var distance = target_position - position
		var direction = distance.normalized()
		
		# Define the movement speed and multiply it by delta to make the movement framerate-independent
		var speed = 250
		var movement = direction * speed * delta
		
		# Update the position of the sprite by the movement amount
		position += movement
		$AnimationPlayer.play("rurik_sigmawalk")
		
		# Check if the sprite has reached the target position and stop the movement if it has
		if direction.x > 0 and position.x > target_position.x:
			position.x = target_position.x
		elif direction.x < 0 and position.x < target_position.x:
			position.x = target_position.x
		if position.x == target_position.x:
			$AnimationPlayer.play("rurik")
			geral.rurik_take_off_right = false
			geral.rurik_is_in_dojo = true
