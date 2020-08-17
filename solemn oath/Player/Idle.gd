extends State

func _init():
	isActive = false
	hasAnimation = true
	animationName = "Idle"
	pass

func _ready():
	sprite = owner.get_node("PlayerSprite")

func onEnter():
	.onEnter()
	pass

func onExit():
	.onExit()
	pass

func onFlip():
	.onFlip()
	pass
