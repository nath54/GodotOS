extends VBoxContainer

func _process(delta):
	var time = OS.get_datetime()
	$Day.text = String(time.day)+"/"+String(time.month)+"/"+String(time.year);
	$Time.text = String(time.hour) +"h "+String(time.minute)+"min "+String(time.second)+ "sec";
