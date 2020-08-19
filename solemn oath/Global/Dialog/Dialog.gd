extends Control

var canContinue = false
var currentKey = ""
var content = []
var index = 0
var alreadyReadKeys = []
var cooldown = 1

func _ready():
	visible = false

func _input(event):
	if (visible && event.is_pressed() && canContinue):
		next()

func readDialog(key, oneTime = true):
	if (alreadyReadKeys.find(key) == -1):
		visible = true
		content = DialogManager.getDialog(key)
		currentKey = key
		Global.pauseGame()
		render(index)

func render(index):
	print('render', content[index])
	$Label.text = content[index]
	$Cooldown.start(cooldown)
	canContinue = false
	$ContinueButton.visible = false

func next():
	if (canContinue):
		if (index < content.size() - 1):
			index += 1
			render(index)
		else:
			exit()

func exit():
	$Label.text = ""
	$ContinueButton.visible = false
	visible = false
	alreadyReadKeys.push_back(currentKey)
	currentKey = ""
	index = 0
	Global.unPause()

func _on_Cooldown_timeout():
	canContinue = true
	$ContinueButton.visible = true
