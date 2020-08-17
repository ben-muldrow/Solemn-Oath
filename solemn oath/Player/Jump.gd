extends State

var direction = Vector2()
onready var jumpBuffer = Timer.new()
var jumpBufferTime = .1 # how long the jump input lasts

func _init():
	isActive = false
	hasAnimation = true
	animationName = "Jump"
	pass

func _ready():
	sprite = owner.get_node("PlayerSprite")
	jumpBuffer.one_shot = true
	add_child(jumpBuffer)
	jumpBuffer.connect("timeout", self, "_onBufferTimeout")

func onEnter():
	handleInput()
	.onEnter()
	pass

func handleInput():
	owner.jumpInput = true
	if (jumpBuffer.is_stopped()):
		jumpBuffer.start(jumpBufferTime)

func _physics_process(delta):
	if (isActive):
		owner.direction = direction
		if (!jumpBuffer.time_left > 0 && owner.is_on_floor()):
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

func _onBufferTimeout():
	owner.jumpInput = false
