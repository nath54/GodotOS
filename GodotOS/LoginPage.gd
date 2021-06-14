extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);

func _on_Button_pressed():
	var pseudo = $CenterContainer/VBoxContainer/Form/V_form/C_Pseudo/H_Pseudo/LineEdit.text;
	var password = $CenterContainer/VBoxContainer/Form/V_form/C_Password/_Password/LineEdit.text;
	var data = Accounts.connection(pseudo, password);
	if data["succeed"]:
		Accounts.connected = data;
		get_tree().change_scene("res://GodotOS/GodotOS.tscn");
	else:
		$Popup.visible = true;
		$Popup/Control/VBoxContainer/C_error/error.text = data["error"];


func _on_Ok_pressed():
	$Popup.visible = false;
