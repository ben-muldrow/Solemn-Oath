extends Node

class_name Character

var useSmallHitbox = true
var sprite = Sprite.new()

func onEnter():
	sprite.visible = true
	pass

func onExit():
	sprite.visible = false
	pass
