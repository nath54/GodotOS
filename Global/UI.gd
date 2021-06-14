extends Node

var selected_window : Node = null;
var hover_window : Node = null;
var drag_window : Node = null;
var dec_win_drag : Vector2 = Vector2.ZERO;

var tabs : Dictionary = {};
var compteur_tabs : int = 0;

func select_window(): # hover window
	if selected_window != null:
		selected_window.unselect();
	#
	selected_window = hover_window;
	var idtab:int = tabs[selected_window.id_fen]["idx"];
	Global.tabs.set_current_tab(idtab);
	selected_window.select();

func _input(event):
	if event is InputEventMouseMotion and drag_window != null:
		drag_window.get_parent().rect_global_position = event.position + dec_win_drag;
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if hover_window != null and event.pressed:
				select_window();
				drag_window = hover_window;
				dec_win_drag = drag_window.get_parent().rect_global_position - event.position
			elif not event.pressed:
				drag_window = null;

func update_tab_idx():
	# on récupere les titres
	var titles:Dictionary = {};
	for i in range(Global.tabs.get_tab_count()):
		titles[Global.tabs.get_tab_title(i)] = i;
	# On ajuste les index
	for k in tabs.keys():
		var v:Dictionary = tabs[k];
		v["idx"] = titles[v["win"].title+" - "+String(k)];
	

func add_tab(win_bar:Node):
	compteur_tabs += 1;
	tabs[compteur_tabs] = {"win": win_bar, "idx":0};
	Global.tabs.add_tab(win_bar.title+" - "+String(compteur_tabs));
	return compteur_tabs;

func remove_tab(id_tab:int):
	Global.tabs.remove_tab(tabs[id_tab]["idx"]);
	tabs.erase(id_tab);

