extends Area2D

var velocity = Vector2.ZERO

var bparent = "Player"

var move_speed = 500

func _ready():
	pass
	
func _physics_process(delta):
	position += transform.x * move_speed * delta
	
func _on_Bullet_body_entered(body):
	if body.name != bparent:
		if body is KinematicBody2D:
			body.health -= 1
			if body.is_in_group("enemies"):
				body.spawn_weapon()
			if body.name == "Player":
				body.die()
		if bparent == "PalaceKing":
			if "type" in body:
				if body.type != "Armor":
					call_deferred("queue_free")
			else:
				call_deferred("queue_free")
		else:
			call_deferred("queue_free")
