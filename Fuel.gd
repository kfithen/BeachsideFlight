extends Node

@export var fuel = 100

func _process(delta):
	if fuel < 0:
		fuel = 0
	$Label.text = "Fuel: " + str(round(fuel))
