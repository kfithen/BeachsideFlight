extends CanvasLayer

@onready var score_scene = get_node("/root/Main/Score")

func _ready():
	$ScoreLabel.text = "Score: " + str(score_scene.score)

func _on_retry_button_button_down():
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_main_menu_button_button_down():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
