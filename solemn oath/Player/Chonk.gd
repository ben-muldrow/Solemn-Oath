extends Character

onready var Player = get_node("../..")
var speedMod = 20

func _ready():
	sprite = get_node("../../Sprites/ChonkSprite")
	useSmallHitbox = false

func onEnter():
	Player.maxSpeed -= speedMod
	.onEnter()

func onExit():
	Player.maxSpeed += speedMod
	.onExit()
