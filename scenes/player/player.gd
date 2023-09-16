extends CharacterBody2D

const speed: int = 500

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _process(_delta):

	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	# laser shooting input
	if Input.is_action_pressed("primary action"):
		print('shoot laser')

	if Input.is_action_pressed("secondary action"):
		print('shoot grenade')
