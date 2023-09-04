extends KinematicBody2D

export var speed = 200
export var gravity = 15
export var jump = -350
var motion = Vector2()

var vakcina = preload("res://Scenes/Vakcina.tscn")
var forward = 1

func _physics_process(delta):
	
	if Input.is_action_pressed("end"):
		get_tree().quit()
	motion.y += gravity
	
	if Input.is_action_pressed("left"):
		motion.x = -speed
		$Anim.flip_h = true
		$Anim.play("run")
		forward = -1
	elif Input.is_action_pressed("right"):
		motion.x = speed
		$Anim.flip_h = false
		$Anim.play("run")
		forward = 1
	else:
		motion.x = 0
		$Anim.play("idle")
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = jump
	
	if Input.is_action_just_pressed("fire"):
		var fire = vakcina.instance()
		if forward > 0:
			fire.position = $LetiacaVakcinaP.global_position
		elif forward < 0:
			fire.position = $LetiacaVakcinaL.global_position
		fire.speed *= forward
		$Vakciny.add_child(fire)
		
	motion = move_and_slide(motion, Vector2(0, -1))
	
#ako hrac mate rusko na sebe tak nebolo nutne vytvorit funkciu stratu healthov

func _on_Area2D_area_entered(area):
		Global.lives -= 1
