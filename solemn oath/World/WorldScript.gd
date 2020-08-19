extends Node2D

onready var UINode = get_node("../../UI")

var spokenToOld = 0
var canTalkToOld = true
var playerNearOld = false

func getDialogNode():
	var kids = UINode.get_children()
	var targetIndex = 0
	for i in range(kids.size()):
		if (kids[i].name == "Dialog"):
			targetIndex = i
	return kids[targetIndex]

#initial dialog
func _on_Platform_body_entered(body):
	if body.name == "Player":
		DialogManager.openDialog(getDialogNode(), "Platform")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if (canTalkToOld):
			var key = "Old"
			if (spokenToOld == 1):
				key = "Old2"
				spokenToOld = 2
			if (spokenToOld == 0):
				spokenToOld = 1
				$OldNPC/ConvoCooldown.start()
				canTalkToOld = false
				$SpiritNPC.visible = true
				$SpiritNPC/SpiritArea2D/CollisionShape2D.disabled = false
				$SpiritNPC/AnimationPlayer.play("SpiritAnimation")
				$SpiritNPC/Sprite/Particles2D.emitting = true
			if (spokenToOld == 2):
				playerNearOld = true
			DialogManager.openDialog(getDialogNode(), key)
			
			#then...
#			if (key == "Old2"):
#				$OldNPC/CollisionShape2D.disabled

func _on_Area2D_body_exited(body):
	if (body.name == "Player"):
		playerNearOld = false

func _on_ConvoCooldown_timeout():
	canTalkToOld = true

func _on_SpiritArea2D_body_entered(body):
	print('oopa')
	if body.name == "Player":
		if (spokenToOld == 1):
			DialogManager.openDialog(getDialogNode(), "Spirit")

func _on_Player_interact():
	if (playerNearOld):
		print('gobble gobble')
		$OldNPC.queue_free()
