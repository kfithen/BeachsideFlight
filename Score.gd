extends Control

@export var score = 0

@onready var player_scene = get_node("/root/Main/Player")

func _process(delta):
	if !player_scene.is_alive:
		return
	score += 10
	$Label.text = "Score: " + str(score)
