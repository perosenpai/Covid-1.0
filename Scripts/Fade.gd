extends ColorRect

signal fade

func fade_in():
	$AnimationPlayer.play("fade")

#mame iba jednu animaciu tak nemusim menit anim_name
func _on_AnimationPlayer_animation_finished(anim_name):
	if emit_signal("fade") != OK:
		print("ok");
