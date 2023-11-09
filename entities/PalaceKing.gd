extends KinematicBody2D

var bullet = preload("res://entities/Bullet.tscn")
var collect = preload("res://entities/Collectable.tscn")

var state = "normal"
var health = 1
var player

func _ready():
	$Sprite.frame = 1
	add_to_group("enemies")
	
func _physics_process(delta):
	match state:
		"normal":
			if health == 0: state = "dead"
			if player:
				$Sprite.frame = 0
				look_at(player.global_position)
				if $Timer.is_stopped():
					$Timer.start()
			else:
				$Sprite.frame = 1
		"dead":
			$Sprite.frame = 2

func _on_Sight_body_entered(body):
	if health > 0 and body.name == "Player":
		player = body

func _on_Sight_body_exited(body):
	if health > 0 and body.name == "Player":
		player = null

func die():
	pass

func spawn_weapon():
	var c = collect.instance()
	c.global_position = global_position
	c.type = "laptop"
	get_tree().current_scene.add_child(c)
	
func _on_Timer_timeout():
	if health > 0:
		for angle in [-40, -20, 0, 20, 40]:
			var a = deg2rad(angle)
			var b = bullet.instance()
			b.modulate = Color.blue
			b.bparent = name
			b.transform = transform.rotated(a)
			b.global_position = global_position
			get_tree().current_scene.add_child(b)
