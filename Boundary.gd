extends Area2D

@onready var player_scene = get_node("/root/Main/Player")

var game_over = preload("res://GameOver.tscn")

func _on_body_entered(body):
	if body.name == "Player":
		var instance = game_over.instantiate()
		add_child(instance)
		player_scene.is_alive = false
