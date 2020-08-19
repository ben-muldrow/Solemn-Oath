extends Node2D

onready var UINode = get_node("../../UI")

var spokenToOld = false
var canTalkToOld = true

func getDialogNode():
	var kids = UINode.get_children()
	var targetIndex = 0
	for i in range(kids.size()):
		if (kids[i].name == "Dialog"):
			targetIndex = i
	return kids[targetIndex]

func _on_Platform_body_entered(body):
	if body.name == "Player":
		DialogManager.openDialog(getDialogNode(), "Platform")


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if (canTalkToOld):
			var key = "Old"
			if (spokenToOld):
				key = "Old2"
			else:
				spokenToOld = true
				$OldNPC/ConvoCooldown.start()
				canTalkToOld = false
				# spawn the spirit
			DialogManager.openDialog(getDialogNode(), key)


func _on_ConvoCooldown_timeout():
	canTalkToOld = true
