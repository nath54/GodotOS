extends Control

export var title : String = "window";
export var icon : ImageTexture = null;
export var closable : bool = true;
export var minusable : bool= true;
export var expandable : bool = true;

var id_fen : int = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	$bg.add_color_override("style_box_flat", Color(0.1,0.1,0.1));
	$VBoxContainer/HSplitContainer/Title/Title.text = title;
	#
	id_fen = UI.add_tab(self);

func _on_BtClose_pressed():
	UI.remove_tab(id_fen);
	get_parent().queue_free();

func _on_BtMinus_pressed():
	get_parent().visible = false;

func _on_BtExpand_pressed():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			$bg.add_color_override("style_box_flat", Color(0.3,0.3,0.3));
		else:
			$bg.add_color_override("style_box_flat", Color(0.1,0.1,0.1));


func _on_Title_mouse_entered():
	UI.hover_window = self;
	$bg.add_color_override("style_box_flat", Color(0.2, 0.2, 0.2));

func _on_Title_mouse_exited():
	if UI.hover_window == self:
		UI.hover_window = null;
	$bg.add_color_override("style_box_flat", Color(0.1,0.1,0.1));

func select():
	$bg.add_color_override("style_box_flat", Color(0.1,0.2,0.3));
	get_parent().set_as_toplevel(true);

func unselect():
	$bg.add_color_override("style_box_flat", Color(0.1,0.1,0.1));
	get_parent().set_as_toplevel(false);


"""
func _on_window_bar_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				UI.drag_window = self;
			elif UI.drag_window == self:
				UI.drag_window = null;
"""
