extends Control

export var text = "";

func _ready():
	$Label.text = text;

func active():
	$Selected.visible = true;
	$Label.add_color_override("font_color", Color(0,0,0));

func unactive():
	$Selected.visible = false;
	$Label.add_color_override("font_color", Color(1,1,1));
