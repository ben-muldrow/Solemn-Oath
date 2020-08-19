extends Node

class_name State

signal complete()

export (bool) var isActive = false
export (bool) var hasAnimation = false
export (String) var animationName = ""
onready var sprite = Sprite.new()
var fip_h = false

func _Ready():
	onEnter()

func onEnter():
	isActive = true
	if (hasAnimation && animationName.length() > 0):
		owner.get_node("AnimationPlayer").play(animationName)
	pass

func onExit():
	isActive = false
	pass
