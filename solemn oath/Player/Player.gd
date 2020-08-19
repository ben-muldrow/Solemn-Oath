extends KinematicBody2D

signal change_character()
signal interact()

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
var transformationLevitation = 10
var fallAcceleration = .1
var jumpBufferTime = .1		# how long after leaving a ledge you can jump
var flip_h = false

onready var explodyLight = preload("res://Resources/ExplodyLight.tscn")
onready var jumpBuffer = Timer.new()

onready var sprites = [
	$Sprites/SkullSprite,
	$Sprites/OldSprite,
	$Sprites/DuckSprite,
	$Sprites/ChonkSprite,
	$Sprites/ArcherSprite,
	$Sprites/KingSprite
]

func _ready():
	jumpBuffer.one_shot = true
	add_child(jumpBuffer)
	jumpBuffer.connect("timeout", self, "_on_jumpBufferTimeout")

func _process(delta):
	$InputManager.process_input()

# Physics handling
func _physics_process(delta):
	if (!is_on_floor() && canJump && jumpBuffer.is_stopped()):
		jumpBuffer.start(jumpBufferTime)
	if (is_on_floor()):
		canJump = true
#		velocity.y = 2
		jumping = false
	velocity.x = lerp(velocity.x, direction.x * maxSpeed, acceleration)
	velocity.y = clamp(velocity.y + 9, -jumpSpeed, maxFallSpeed)
	if (!jumping and jumpInput and canJump):
		jumping = true
		velocity.y = -jumpSpeed
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# handle sprite flip
	if (velocity.x > 0 && flip_h):
		onFlip()
	elif (velocity.x < 0 && !flip_h):
		onFlip()

func jump(vel: Vector2) -> Vector2:
	return Vector2(vel.x, -400)

# Character handling
func changeCharacter():
	if ($RayCast2D.get_collider() == null):
		var particleEffect = explodyLight.instance()
		position.y += 2
		particleEffect.position = position
		owner.add_child(particleEffect)
		emit_signal("change_character")

func onFlip():
	flip_h = !flip_h
	for i in sprites:
		i.flip_h = !i.flip_h

func swapHitbox():
	$smallBox.disabled = !$smallBox.disabled
	$bigBox.disabled = !$bigBox.disabled

func _on_jumpBufferTimeout():
	canJump = false

func _on_CharacterManager_change_hitbox(small):
	$smallBox.disabled = !small
	$bigBox.disabled = small

func _on_InputManager_player_special():
	changeCharacter()


func _on_InputManager_player_interact():
	emit_signal("interact")
