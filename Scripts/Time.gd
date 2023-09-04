extends Control

export (int) var minu = 0
export (int) var sec = 0
var dsec = 0

func _physics_process(delta):
	if sec > 0 and dsec <= 0: 
		sec -= 1
		dsec = 10
		
	if minu > 0 and sec <= 0:
		minu -= 1
		sec = 59
		
	if sec >= 10:
		$sec.set_text(str(sec))
	else:
		$sec.set_text("0"+str(sec))
	if dsec >= 10:
		$dsec.set_text(str(dsec))
	else:
		$dsec.set_text("0"+str(dsec))
	if minu >= 10:
		$min.set_text(str(minu))
	else:
		$min.set_text("0"+str(minu))

func _on_Timer_timeout():
	(dsec -= 10)
	
	if minu <= 0 and sec <= 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
