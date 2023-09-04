extends Control

var scene_path

func _ready():
	$Menu/CenterRow/Buttons/Start.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "on_Pressed", [button.scene_to_load])
		
func on_Pressed(scene_to_load):
	scene_path = scene_to_load
	$Fade.show()
	$Fade.fade_in()

func _on_Exit_pressed():
	get_tree().quit()

func _on_Fade_fade():
	if get_tree().change_scene(scene_path) !=OK:
		print ("OK")
