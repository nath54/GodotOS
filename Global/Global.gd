extends Node

var os = null;
var tabs = null;

func launch_app(path, position=null):
	var app = load(path).instance();
	os.get_node("VSplitContainer/MainScene").add_child(app);
	if position != null:
		app.rect_position = position;
