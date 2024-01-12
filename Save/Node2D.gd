extends CharacterBody2D

@export var speed = 200

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1.0
	if Input.is_action_pressed("left"):
		velocity.x += -1.0
	if Input.is_action_pressed("up"):
		velocity.y += 1.0
	if Input.is_action_pressed("down"):
		velocity.y += -1.0
	
	velocity * speed
	
	move_and_slide()
	


