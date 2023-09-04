extends Node2D

func _on_Area2D_area_entered(area):
	if queue_free() != OK:
		Global.score += 1
		
