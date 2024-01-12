extends CharacterBody2D

@export var speed = 1200
@onready var character_body_2d = $"."
@onready var animation_tree = $AnimationTree



var direction = Input.get_vector("left", "right", "up", "down")

func _physics_process(_delta):
	$"AnimationTree".advance(_delta)
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if direction != Vector2.ZERO:
		set_walking(true)
		update_blend_position()
	else: 
		set_walking(false)
	
	move_and_slide()

func set_walking(value):
	animation_tree["parameters/conditions/is_walking"] = value
	animation_tree["parameters/conditions/idle"] =  not value

func update_blend_position():
	
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Walk/blend_position"] = direction
	
