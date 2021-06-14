extends Control

func _ready():
	Global.os = self;
	Global.tabs = $VSplitContainer/TopBarControl/Menu/Tabs;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	if Accounts.connected == null:
		get_tree().change_scene("res://GodotOS/LoginPage.tscn");

func _on_HideBarTimer_timeout():
	$VSplitContainer/TopBarControl.modulate = Color(1,1,1,1);

func _on_TopBarControl_mouse_entered():
	$VSplitContainer/TopBarControl/HideBarTimer.stop();
	$VSplitContainer/TopBarControl.modulate = Color(1,1,1,1);

func _on_TopBarControl_mouse_exited():
	$VSplitContainer/TopBarControl/HideBarTimer.start();


func _on_Tabs_tab_changed(tab):
	UI.update_tab_idx();
