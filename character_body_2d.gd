extends CharacterBody2D
const SPEED = 1600.0
const JUMP_VELOCITY = -1800.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_D):
		rotate(0.1)
		position.x = position.x + 5
	if Input.is_key_pressed(KEY_A):
		rotate(-0.1)
		position.x = position.x - 5

func _on_body_entered(StaticBody2D):
	if Input.is_key_pressed(KEY_W):
		position.y = position.y + 30

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
