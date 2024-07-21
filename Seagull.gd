extends Area2D

var MOVE_SPEED = 5

@onready var player_scene = get_node("/root/Main/Player")

var game_over = preload("res://GameOver.tscn")

func _process(_delta):
	if global_position.x < -25:
		queue_free()

func _physics_process(_delta):
	global_position.x -= MOVE_SPEED

func _on_body_entered(body):
	if body.name == "Player":
		var instance = game_over.instantiate()
		get_node("/root/Main").add_child(instance)
		player_scene.is_alive = false
