extends KinematicBody2D

var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var jumping = false
var jumpInput = false
var wasJustOnFloor = false
var canJump = true
var maxSpeed = 100
var acceleration = .2
var maxFallSpeed = 200
var jumpSpeed = 200
var fallAcceleration = .1
var jumpBufferTime = .2		# how long after leaving a ledge you can jump

onready var jumpBuffer = Timer.new()
onready var sprites = [$PlayerSprite]

func _ready():
	jumpBuffer.one_shot = true
	add_child(jumpBuffer)
	jumpBuffer.connect("timeout", self, "_on_jumpBufferTimeout")

func _process(delta):
	$InputManager.process_input()

func _physics_process(delta):
	if (!is_on_floor() && canJump && jumpBuffer.is_stopped()):
		jumpBuffer.start(jumpBufferTime)
	if (is_on_floor()):
		canJump = true
		velocity.y = 2
		jumping = false
	velocity.x = lerp(velocity.x, direction.x * maxSpeed, acceleration)
	velocity.y = clamp(velocity.y + 9, -jumpSpeed, maxFallSpeed)
	if (!jumping and jumpInput and canJump):
		jumping = true
		velocity.y = -jumpSpeed
	move_and_slide(velocity, Vector2.UP)

func jump(vel: Vector2) -> Vector2:
	return Vector2(vel.x, -400)

func onFlip():
	for i in sprites:
		i.flip_h = !i.flip_h

func _on_Walk_flip():
	onFlip()

func _on_Jump_flip():
	onFlip()

func _on_jumpBufferTimeout():
	canJump = false
