extends Control

func _ready():
	Global.os = self;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	if Accounts.connected == null:
		get_tree().change_scene("res://GodotOS/LoginPage.tscn");



