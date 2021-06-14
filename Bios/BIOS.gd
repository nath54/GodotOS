extends Control

var choices : Array = [
	"BiosMenu/CenterContainer/CenterContainer2/VBoxContainer/G-OS",
	"BiosMenu/CenterContainer/CenterContainer2/VBoxContainer/Settings",
	"BiosMenu/CenterContainer/CenterContainer2/VBoxContainer/Quit",
];

var selected : int = 0;

func _ready():
	# Animation
	$Animation1/AnimationPlayer.play("godot_icon");
	# Choices
	get_node(choices[selected]).active();
	# Mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	# UI
	UI.selected_window = null;
	UI.hover_window = null;
	UI.drag_window = null;

	

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "godot_icon":
		$BiosMenu.visible = true;

func _input(_event):
	if Input.is_action_just_pressed("ui_down"):
		get_node(choices[selected]).unactive();
		selected = clamp(selected+1, 0, len(choices)-1);
		get_node(choices[selected]).active();
	elif Input.is_action_just_pressed("ui_up"):
		get_node(choices[selected]).unactive();
		selected = clamp(selected-1, 0, len(choices)-1);
		get_node(choices[selected]).active();
	elif Input.is_action_just_pressed("ui_accept"):
		if selected == 0:
			get_tree().change_scene("res://GodotOS/LoginPage.tscn");
		elif selected == 1:
			pass
		elif selected == 2:
			get_tree().quit();
