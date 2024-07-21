extends AudioStreamPlayer

var game_music = preload("res://Airship_Serenity.mp3")

func _ready():
	stream = game_music
	play()

func _on_finished():
	_ready()
