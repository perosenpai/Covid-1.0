extends Area2D

export var speed = 500

func _ready():
	if speed < 0:
		$Sprite.flip_v = true
		$CollisionShape2D.position.x = -10

func _physics_process(delta):
	position.x += speed*delta


func _on_Timer_timeout():
	queue_free()
