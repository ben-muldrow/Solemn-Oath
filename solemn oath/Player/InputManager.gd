extends Node

signal player_move(direction)
signal player_jump()
signal player_interact()
signal player_special()

func process_input():
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		0
	)
	emit_signal("player_move", direction)
	
	if (Input.is_action_just_pressed("jump")):
		emit_signal("player_jump")
	
	if (Input.is_action_just_pressed("special")):
		emit_signal("player_special")
