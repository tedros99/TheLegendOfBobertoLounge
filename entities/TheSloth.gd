extends KinematicBody2D

var player_in_range = null
onready var bullet = preload("res://entities/Bullet.tscn")

func _ready():
	add_to_group("enemies")

func _physics_process(delta):
	if player_in_range:
		$Sprite.frame = 1
		look_at(player_in_range.global_position)
		if $Timer.is_stopped():
			$Timer.start()
	else:
		$Sprite.frame = 0
		get_parent().offset += 5

func _on_Vision_body_entered(body):
	if body.name == "Player":
		player_in_range = body

func _on_Vision_body_exited(body):
	if body.name == "Player":
		player_in_range = null

func _on_Timer_timeout():
	var b = bullet.instance()
	b.bparent = name
	b.global_position = global_position
	b.global_rotation = global_rotation
	get_tree().current_scene.add_child(b)
