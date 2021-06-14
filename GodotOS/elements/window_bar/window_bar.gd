extends Control

export var title : String = "window";
export var icon : ImageTexture = null;
export var closable : bool = true;
export var minusable : bool= true;
export var expandable : bool = true;


# Called when the node enters the scene tree for the first time.
func _ready():
	$bg.add_color_override("style_box_flat", Color(0.1,0.1,0.1));
	$VBoxContainer/HSplitContainer/Title/Title.text = title;

func _on_BtClose_pressed():
	get_parent().queue_free();

func _on_BtMinus_pressed():
	get_parent().visible = false;

func _on_BtExpand_pressed():
	pass # Replace with function body.

func _on_Title_mouse_entered():
	UI.hover_window = self;
	$bg.add_color_override("style_box_flat", Color(0.2, 0.2, 0.2));

func _on_Title_mouse_exited():
	UI.hover_window = null;
	$bg.add_color_override("style_box_flat", Color(0.1,0.1,0.1));

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			$bg.add_color_override("style_box_flat", Color(0.3,0.3,0.3));
		else:
			$bg.add_color_override("style_box_flat", Color(0.1,0.1,0.1));
