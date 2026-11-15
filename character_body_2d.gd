extends CharacterBody2D
const SPEED = 500.0
const JUMP_VELOCITY = -1000.0
var CAN_JUMP = false

func _ready() -> void:
	CAN_JUMP = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		rotate(0.1)
		position.x = position.x + 5
	if Input.is_action_pressed("left"):
		rotate(-0.1)
		position.x = position.x - 5

func _on_body_entered(tramp_area: Node2D) -> void:
	CAN_JUMP = true
	CAN_JUMP = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if CAN_JUMP:
		if Input.is_action_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			CAN_JUMP = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
