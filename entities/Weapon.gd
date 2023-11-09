extends Node2D

var player_in_range = null

export (String, "Bolt M119", "Bubble Daryl", "SN S2000", "Baseball Bat", "Gordon Crowbar", "Rezac", "Mac") var weapon
var gun_id = 0

func _ready():
	match weapon:
		"Bolt M119":
			gun_id = 0
		"Bubble Daryl":
			gun_id = 1
		"SN S2000":
			gun_id = 2
		"Baseball Bat":
			gun_id = 3
		"Gordon Crowbar":
			gun_id = 4
		"Rezac":
			gun_id = 5
		"Mac":
			gun_id = 6
	$Sprite.frame = gun_id
	
func _physics_process(delta):
	if player_in_range != null:
		modulate = Color("24a7ee")
		$AnimationPlayer.play("grow")
	else:
		$AnimationPlayer.stop()
		scale = Vector2(1, 1)
		modulate = Color8(255, 255, 255)
	
	if Input.is_action_just_pressed("grab"):
		if player_in_range != null:
			if player_in_range.inventory.empty():
				player_in_range.inventory.append(gun_id)
				call_deferred("queue_free")
			else:
				player_in_range.spawn_weapon(player_in_range.inventory[0])
				player_in_range.inventory[0] = gun_id
				call_deferred("queue_free")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player_in_range = body

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player_in_range = null
