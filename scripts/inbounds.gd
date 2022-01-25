extends Area

func _on_inbounds_area_exited(area):
	var body = area.get_parent()
	var parent = body.get_parent()
	if parent.get_node('block').won or parent.get_node('block').respawning: return
	parent.get_node('block').gravity_scale = 1
	parent.get_node('block').lose()
	parent.get_node('block').angular_velocity *= 2
