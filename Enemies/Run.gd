extends Node

onready var SM = get_parent()
onready var enemy = get_node("../..")


func _ready():
	yield(enemy, "ready")

func start():
	enemy.set_animation("Run")

func physics_process(_delta):
	var player = get_node_or_null("/root/Game/Player_Container/Player")
	if not enemy.is_on_floor():
		enemy.velocity.y += 50
	else: enemy.velocity.y = 0
	if player != null:
		if player.position.x > enemy.position.x:
			enemy.direction = -1
			enemy.velocity.x = 250
		if player.position.x < enemy.position.x:
			enemy.direction = 1
			enemy.velocity.x = -250
