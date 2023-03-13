extends KinematicBody2D


var speed = 250
var jump_speed = 600
var velocity = Vector2.ZERO
const gravity = 8

var last_jump_time = 0.0
const jump_delay = 1.00000001

var last_interact_time = 0.0
const interact_delay = 1.0

var last_direction = 0
var fala_1_count = 0
var fala_1_played = false


# Called when the node enters the scene tree for the first time.

func _ready():
	$fala_tutorial.hide()
	pass
	
	
func _physics_process(delta):
	velocity.y += gravity
	print(geral.player_rurik_distance)
		
	if Input.is_action_pressed("ui_left"):
		$AnimationPlayer.play("andar_tras")
		velocity.x = -speed
		last_direction = 1
		
	elif Input.is_action_pressed("ui_right"):
		$AnimationPlayer.play("andar_frente")
		velocity.x = speed
		last_direction = 0
		
	else:
		velocity.x = 0
		
		if last_direction == 0:
			$AnimationPlayer.play("parado")
			
		if last_direction == 1:
			$AnimationPlayer.play("parado_tras")
		
		
	if Input.is_action_just_pressed("ui_select") and last_jump_time + jump_delay <= OS.get_ticks_msec() / 1000:
		velocity.y = -jump_speed / 3
		last_jump_time = OS.get_ticks_msec() / 1000
		
	if geral.player_rurik_distance < 150 and Input.is_action_pressed("ui_interact") and last_interact_time + interact_delay <= OS.get_ticks_msec() / 1000:
		if fala_1_played == false:
			$fala_tutorial.show()

			if fala_1_count < 4:
				if fala_1_count == 0:
					$fala_tutorial/fala_player.play("1")
				
				if fala_1_count == 1:
					$fala_tutorial/fala_player.play("2")
				
				if fala_1_count == 2:
					$fala_tutorial/fala_player.play("3")
				
				if fala_1_count == 3:
					$fala_tutorial/fala_player.play("4")
					
			if fala_1_count > 3:
				fala_1_count = 0
				fala_1_played = true
				$fala_tutorial.hide()
				geral.rurik_take_off_right = true
				
			fala_1_count += 1
		last_interact_time = OS.get_ticks_msec() / 1000

	move_and_slide(velocity, Vector2.UP)


