extends KinematicBody2D

onready var nav_agent = $NavigationAgent2D
onready var weapon = preload("res://entities/Weapon.tscn")
onready var bullet = preload("res://entities/Bullet.tscn")

var health = 1
var player = null
var waypoints = []
var velocity = Vector2.ZERO
var state = "normal"
var move_speed = 150

export var enemy = 0

func _ready():
	add_to_group("enemies")
	if enemy == 1:
		$Timer.wait_time = 0.5
	
func _physics_process(delta):
	if player and state != "dead":
		nav_agent.set_target_location(player.global_position)
		var space_state = get_world_2d().direct_space_state
		var result = space_state.intersect_ray(global_position, player.global_position, [self], collision_mask)
		if result.collider.name == "Player":
			state = "fight"
		
	$Sprite.frame = enemy + 1
	
	match state:
		"normal":
			if health == 0: state = "dead"
		"fight":
			if nav_agent.is_navigation_finished():
				nav_agent.set_target_location(player.global_position)
				
			var direction = global_position.direction_to(nav_agent.get_next_location())
			
			var desired_velocity = direction * move_speed
			var steering = (desired_velocity - velocity) * delta * 4
			velocity += steering
			
			velocity = move_and_slide(velocity)
			
			look_at(player.global_position)
			
			if global_position.distance_to(player.global_position) < 200:
				if $Timer.is_stopped():
					$Timer.start()
			
			var space_state = get_world_2d().direct_space_state
			var result = space_state.intersect_ray(global_position, player.global_position, [self], collision_mask)
			if result.collider.name != "Player":
				state = "normal"
				
			if health == 0: state = "dead"
		"dead":
			z_index = -1
			$Sprite.frame = 4

func _on_Vision_body_entered(body):
	if state != "dead":
		if body.name == "Player":
			player = body

func _on_Vision_body_exited(body):
	if state != "dead":
		if body.name == "Player":
			player = null
			state = "normal"

func spawn_weapon():
	var w = weapon.instance()
	w.global_position = global_position
	if enemy == 0:
		w.gun_id = 0
	elif enemy == 1:
		w.gun_id = 1
	else:
		w.gun_id = 2
	get_tree().current_scene.add_child(w)
	$Collision.call_deferred("queue_free")

func _on_Timer_timeout():
	if state != "dead":
		if enemy == 1:
			for angle in [-20, 0, 20]:
				var a = deg2rad(angle)
				var b = bullet.instance()
				if Global.curr_level == 2:
					b.modulate = Color.blue
				b.bparent = name
				b.transform = transform.rotated(a)
				b.global_position = global_position
				get_tree().current_scene.add_child(b)
		else:
			var b = bullet.instance()
			if Global.curr_level == 2:
				b.modulate = Color.blue
			b.bparent = name
			b.transform = transform
			get_tree().current_scene.add_child(b)
