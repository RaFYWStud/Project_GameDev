extends Area2D

var drag_enabled = false
var last_touch_position = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		drag_enabled = true
		last_touch_position = event.position
	
	elif event is InputEventScreenDrag and drag_enabled:
		# Menggerakkan parent TrashBinGroup
		var delta = event.position.x - last_touch_position.x
		get_parent().position.x += delta
		last_touch_position = event.position
	
	elif event is InputEventScreenTouch and not event.pressed:
		drag_enabled = false
