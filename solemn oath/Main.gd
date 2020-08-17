extends Node

onready var StartMenu = load("Global/StartMenu/StartMenu.tscn")
onready var World = load("World/World.tscn")

var currentMenu = null
var currentWorld = null

func _ready():
	# game is loaded, set the UI to the main menu
	switchMenu(StartMenu.instance())

func switchMenu(newMenu):
	if (newMenu != null):
		$UI.remove_child(currentMenu)
	$UI.add_child(newMenu)
	print(newMenu.name)
	match newMenu.name:
		"StartMenu":
			newMenu.connect("startGame", self, "startGame")
			print(newMenu)
		_:
			pass
	currentMenu = newMenu

func removeMenu():
	if (currentMenu != null):
		$UI.remove_child(currentMenu)
		currentMenu = null

func switchWorld(newWorld):
	if (currentWorld != null):
		$World.remove_child(currentWorld)
	$World.add_child(newWorld)
	currentWorld = newWorld

func removeWorld():
	if (currentWorld != null):
		$UI.remove_child(currentWorld)
		currentWorld = null
	
func startGame():
	switchWorld(World.instance())
	removeMenu()
