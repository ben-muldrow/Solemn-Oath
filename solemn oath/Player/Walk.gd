extends State

var direction = Vector2()

func _init():
	isActive = false
	hasAnimation = true
	animationName = "Walk"
	pass

func _ready():
	sprite = owner.get_node("PlayerSprite")

func onEnter():
	.onEnter()
	pass

func _physics_process(delta):
	if (isActive):
		owner.direction = direction
		if (direction == Vector2.ZERO):
			emit_signal("complete")
		elif (direction.x < 0 && !sprite.flip_h):
			onFlip()
		elif (direction.x > 0 && sprite.flip_h):
			onFlip()

func onExit():
	.onExit()
	pass

func onFlip():
	.onFlip()
	pass
