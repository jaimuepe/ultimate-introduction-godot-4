extends CharacterBody2D

signal laser(pos: Vector2, direction: Vector2)
signal grenade(pos: Vector2, direction: Vector2)

const speed: int = 500

var can_laser: bool = true
var can_grenade: bool = true

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _process(_delta):

	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	#rotate	
	look_at(get_global_mouse_position())

	if can_laser && Input.is_action_pressed("primary action"):
		shoot_laser()

	if can_grenade && Input.is_action_pressed("secondary action"):
		shoot_grenade()

func shoot_laser():
	
	can_laser = false
	$LaserTimer.start()
	
	var markers = $LaserStartPositions.get_children()
	var selected_marker = markers.pick_random()
	
	var pos = selected_marker.global_position
	var dir = (get_global_mouse_position() - position).normalized()
	
	laser.emit(pos, dir)

func shoot_grenade():
	
	can_grenade = false
	$GrenadeTimer.start()
	
	var selected_marker = $LaserStartPositions.get_children()[1]
	
	var pos = selected_marker.global_position
	var dir = (get_global_mouse_position() - position).normalized()
	
	grenade.emit(pos, dir)

func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
