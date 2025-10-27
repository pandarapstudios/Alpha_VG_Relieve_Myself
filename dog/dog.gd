extends CharacterBody2D
@export var move_speed : float = 100
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(_delta):
	var input_direction = Vector2.ZERO
	if Input.get_action_strength("shift"):
		$CPUParticles2D.emitting = true
	if Input.get_action_strength("right"): 
		input_direction.x += 1
		#$CollisionShape2D.shape.set_size(Vector2(25,20))
		
		animated_sprite.play("right")
	elif Input.get_action_strength("left"):
		input_direction.x -= 1
		#$CollisionShape2D.shape.set_size(Vector2(25,20))
		
		animated_sprite.play("left")
	elif Input.get_action_strength("down"):
		input_direction.y += 1
		#$CollisionShape2D.shape.set_size(Vector2(16,30))
		
		animated_sprite.play("down")
	elif Input.get_action_strength("up"):
		input_direction.y -= 1
		#$CollisionShape2D.shape.set_size(Vector2(16,30))
	
		animated_sprite.play("up")
	velocity = input_direction * move_speed
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		$"../GameOver".game_over()
