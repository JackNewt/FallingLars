extends Area2D


func _on_Exit_to_2_body_entered(body):
	if body.name == "Player":
		if name == "Exit_to_2":
			var _target = get_tree().change_scene("res://Levels/Level2.tscn")
		if name == "Exit_to_Menu":
			var _target = get_tree().change_scene("res://Menu.tscn")
