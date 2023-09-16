extends CharacterBody2D

const speed: int = 200

var direction: Vector2 = Vector2.RIGHT

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _process(delta):
	velocity = speed * direction
	move_and_slide()
