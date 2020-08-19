extends Node

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		get_tree().quit()

func quitGame():
	notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func pauseGame():
	get_tree().paused = true

func unPause():
	get_tree().paused = false
