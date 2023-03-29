extends KinematicBody2D

onready var SM = $StateMachine

var velocity = Vector2.ZERO
var direction = 1
var speed = 500


func _ready():
	SM.set_state("Idle")

func _physics_process(_delta):
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if direction < 0 and not $AnimatedSprite.flip_h: 
		$AnimatedSprite.flip_h = true
	if direction > 0 and $AnimatedSprite.flip_h: 
		$AnimatedSprite.flip_h = false


	var player = get_node_or_null("/root/Game/Player_Container/Player")

	if player!= null:
		if player.position.x == position.x:
			SM.set_state("Active")
		elif player.position.y < 100:
			SM.set_state("Idle")
		elif player.position.x > 3000 and position.x > 3000:
			SM.set_state("Active")
		elif player.position.x > 1550:
			SM.set_state("Run")
		elif player.position.x > 1375:
			SM.set_state("Active")
		elif player.position.x < 1375:
			SM.set_state("Idle")


		
func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()


func _on_Area2D_body_entered(body):
	print("hit")
	if body.has_method("die"):
		body.die()
