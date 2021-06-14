extends MenuButton

var options = {
	"apps":{
		"Games":{
		},
		"Tools":{
		},
		"Other":{
			"Hello-World": 5,
			"25x(Hello-World)": 42
		}
	},
	"system": {
		"Log Out": 2,
		"Reboot": 1,
		"Quit": 0
	}
}

onready var popup = get_popup();

func _ready():
	# System
	for key in options.keys():
		var data = options[key];
		if data is int:
			popup.add_item(key, data);
		elif data is Dictionary:
			var submenu = add_menu(key, data);
			popup.add_submenu_item(key, key);
			popup.add_child(submenu);
	# Signals
	popup.connect("id_pressed", self, "menu_pressed")

func add_menu(name, dic):
	var submenu = PopupMenu.new();
	submenu.set_name(name);
	for key in dic.keys():
		var data = dic[key];
		if data is int:
			submenu.add_item(key, data);
		elif data is Dictionary:
			var subsubmenu = add_menu(key, data);
			submenu.add_submenu_item(key, key);
			submenu.add_child(subsubmenu);
	# Signals
	submenu.connect("id_pressed", self, "menu_pressed")
	return submenu;

func menu_pressed(id):
	if id == 0:
		get_tree().quit();
	elif id == 1:
		get_tree().change_scene("res://Bios/BIOS.tscn");
	elif id == 2:
		Accounts.connected = null;
		get_tree().change_scene("res://GodotOS/LoginPage.tscn");
	elif id == 5:
		Global.launch_app("res://GodotOS/apps/hello_world/HelloWorld.tscn");
	elif id == 42:
		for i in range(25):
			var size = get_viewport().size;
			var x = rand_range(0, size.x - 100);
			var y = rand_range(0, size.y - 100);
			Global.launch_app("res://GodotOS/apps/hello_world/HelloWorld.tscn", Vector2(x, y));
			yield(get_tree().create_timer(0.1), "timeout");
