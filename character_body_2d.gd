extends CharacterBody2D



func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_D):
		rotate(0.1)
		position.x = position.x + 5
	if Input.is_key_pressed(KEY_A):
		rotate(-0.1)
		position.x = position.x - 5

func _on_body_entered(StaticBody2D):
	position.y = position.y + 30
