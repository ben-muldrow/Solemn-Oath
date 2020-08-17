extends Node

class_name State

signal complete()
signal flip()

export (bool) var isActive = false
export (bool) var hasAnimation = false
export (String) var animationName = ""
var sprite = Sprite.new()
var fip_h = false

func _Ready():
	onEnter()

func onEnter():
	isActive = true
	if (hasAnimation && animationName.length() > 0):
		sprite.visible = true
		owner.get_node("AnimationPlayer").play(animationName)
	pass

func onExit():
	isActive = false
	if (hasAnimation && animationName.length() > 0):
		sprite.visible = false
	pass

func onFlip():
	emit_signal("flip")
