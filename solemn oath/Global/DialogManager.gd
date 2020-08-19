extends Node

var jsonData

#
# JSON dialog is structured as follows
# Type: (Main)
#	Stage: (Intro)
#		Encounter: (Platform, Old, Old2, etc...)
var type : String setget setType, getType
var stage : String setget setStage, getStage
var isDialogUp = false

func _ready():
	var file = File.new()
	file.open("res://assets/text/dialog.json", File.READ)
	var fileString = file.get_as_text()
	var jsonResult = JSON.parse(fileString)
	file.close()
	
	if (jsonResult.error != OK):
		print("error parsing JSON dialog: ", jsonResult.error_string)
	else:
		jsonData = jsonResult.result
		setType("Main")
		setStage("Intro")

func getDialog(key) -> Array:
	print(jsonData[type][stage][key][0])
	return jsonData[type][stage][key]

func openDialog(dialogNode, key):
	dialogNode.readDialog(key)

func initialize():
	# set the intial values for the dialog
	setType("Main")
	setStage("Intro")

func setType(newType):
	type = newType

func getType():
	return type

func setStage(newStage):
	stage = newStage

func getStage():
	return stage
