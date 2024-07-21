extends Area2D

var MOVE_SPEED = 2.5

@onready var fuel_scene = get_node("/root/Main/Fuel")

func _process(_delta):
	if global_position.x < -25:
		queue_free()

func _physics_process(_delta):
	global_position.x -= MOVE_SPEED

func _on_body_entered(_body):
	fuel_scene.fuel = 100
	queue_free()
