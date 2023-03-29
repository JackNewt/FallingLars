extends AudioStreamPlayer


func _physics_process(_delta):
	if playing == false:
		playing = true
