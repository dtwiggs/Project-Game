extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -250.0
var coyote := 0.0
var jumped = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		coyote = 0.0
		jumped = false
	elif not is_on_floor():
		velocity += get_gravity() * delta
		coyote += delta
		
	# Handle jump.
	if Input.is_action_just_pressed("space") and (is_on_floor() or coyote < 0.1) and not jumped:
		velocity.y = JUMP_VELOCITY
		jumped = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
	# Animation state machine
	if not is_on_floor():
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")    # going up
		else:
			$AnimatedSprite2D.play("falling") # going down
	elif direction != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
