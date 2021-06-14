extends Node

var selected_window : Node = null;
var hover_window : Node = null;
var drag_window : Node = null;
var dec_win_drag : Vector2 = Vector2.ZERO;


func _input(event):
	if event is InputEventMouseMotion and drag_window != null:
		drag_window.get_parent().rect_global_position = event.position + dec_win_drag;
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if hover_window != null and event.pressed:
				drag_window = hover_window;
				dec_win_drag = drag_window.get_parent().rect_global_position - event.position
			elif not event.pressed:
				drag_window = null;
	
	
