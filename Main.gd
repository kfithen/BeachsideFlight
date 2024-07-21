extends Node2D

var fuel_container = preload("res://FuelContainer.tscn")
var seagull = preload("res://Seagull.tscn")

var timer: Timer

func _ready():
	timer = Timer.new()
	timer.wait_time = 10
	timer.one_shot = false
	add_child(timer)
	timer.start()
	timer.connect("timeout", spawn_fuel)
	timer.connect("timeout", spawn_seagull)

func spawn_fuel():
	var instance = fuel_container.instantiate()
	instance.position = Vector2(600, randi_range(60, 420))
	add_child(instance)

func spawn_seagull():
	var instance = seagull.instantiate()
	instance.position = Vector2(600, randi_range(60, 420))
	add_child(instance)
