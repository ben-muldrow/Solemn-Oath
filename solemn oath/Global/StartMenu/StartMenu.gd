extends Control

signal startGame()

func _on_Start_pressed():
	emit_signal("startGame")
	pass

func _on_Quit_pressed():
	print('quat')
	Global.quitGame()
