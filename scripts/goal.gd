extends Area

const BlockClass = preload("res://scripts/block.gd")

func _on_goal_body_entered(body):
	var block = body.get_parent()
	if block.rest_position == BlockClass.RestPosition.STANDING:
		block.won = true
		$gravity.connect("timeout", self, "_on_gravity_timeout", [
block, body ])
		$gravity.wait_time = block.movement_duration
		$gravity.one_shot = true
		$gravity.start()

func _on_gravity_timeout(block, body):
	block.win()
	body.gravity_scale = 1
	$gravity.disconnect("timeout", self, "_on_gravity_timeout")
