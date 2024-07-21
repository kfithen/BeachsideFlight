extends CharacterBody2D

const GRAVITY = 500
const MOVE_SPEED = 2.5
const MAX_VELOCITY = 1000
const THRUST_SOUND = preload("res://Placeholder_Thrust.mp3")
const FUEL_DRAIN = 35

@onready var fuel_scene = get_node("/root/Main/Fuel")

var is_alive = true
var is_audio_playing = false

func _ready():
	velocity = Vector2.ZERO

func _process(delta):
	$Thrust.hide()
	if !is_alive:
		return
	if is_audio_playing == false:
		$AudioStreamPlayer.stop()
	var mouse_position = get_local_mouse_position()
	global_position.x += mouse_position.x * MOVE_SPEED * delta
	if Input.is_action_pressed("jetpack"):
		if fuel_scene.fuel <= 0:
			return
		$Thrust.show()
		fuel_scene.fuel -= FUEL_DRAIN * delta
		if !$AudioStreamPlayer.is_playing() and fuel_scene.fuel > 0:
			$AudioStreamPlayer.stream = THRUST_SOUND
			$AudioStreamPlayer.play()
			is_audio_playing = true
	else:
		is_audio_playing = false

func _physics_process(delta):
	if !is_alive:
		return
	if Input.is_action_pressed("jetpack") and fuel_scene.fuel > 0:
			velocity.y -= 50
		
	velocity.y += GRAVITY * delta
	if velocity.y > MAX_VELOCITY:
		velocity.y = MAX_VELOCITY
	move_and_collide(velocity * delta)
