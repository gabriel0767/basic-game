extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	if direction != 0:
		velocity.x = direction * SPEED
		animated_sprite.play("run") 
		
		
		animated_sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle") 
	

	if direction != 0:
		velocity.x = direction * SPEED
		animated_sprite.play("run") # Toca a animação de corrida
		
		# Inverte o sprite dependendo da direção que ele olha
		animated_sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle") # Toca a animação parado

	move_and_slide()
