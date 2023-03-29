extends Node

onready var SM = get_parent()
onready var enemy = get_node("../..")

func start():
	enemy.set_animation("Idle")
