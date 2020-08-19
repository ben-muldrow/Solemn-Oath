extends State

var direction = Vector2()

onready var CharacterManager = get_node("../../CharacterManager")

func _init():
	isActive = false
	hasAnimation = true
	animationName = "Walk"
	pass

func _ready():
	sprite = CharacterManager.getSprite()

func onEnter():
	.onEnter()
	pass

func _physics_process(delta):
	if (isActive):
		owner.direction = direction
		if (direction == Vector2.ZERO):
			emit_signal("complete")

func onExit():
	.onExit()
	pass
