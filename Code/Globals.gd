extends Node

var health = 10
var energy = 5




func _unhandled_key_input(event):
	if event.is_action_pressed("f_fullscreen"):
		toggle_fullscreen()


func toggle_fullscreen():
	match DisplayServer.window_get_mode():
		3 : DisplayServer.window_set_mode(0)
		0 : DisplayServer.window_set_mode(3)

