extends Node2D

##################################################
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print("Go to Main 1 Scene")
		SceneManager.change_scene("res://scenes/main_2/main_2.tscn")
