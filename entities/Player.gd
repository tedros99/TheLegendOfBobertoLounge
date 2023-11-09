extends KinematicBody2D

var velocity = Vector2.ZERO
var move_speed = 200

var health = 1
var state = "normal"

onready var bullet = preload("res://entities/Bullet.tscn")
onready var portal = get_parent().get_node("Elevator")
onready var weapon = preload("res://entities/Weapon.tscn")

var inventory = []
var weapon_list = [
	"Bolt M119",
	"Bubble Daryl",
	"SN S2000",
	"Baseball Bat",
	"Gordon Crowbar",
	"Rezac",
	"Mac"
]

var anim_list = {
	"Mac": 2,
	"Rezac": 3,
	"Baseball Bat": 6,
	"Gordon Crowbar": 8,
	"Bolt M119": 10,
	"Bubble Daryl": 11,
	"SN S2000": 12,
}

func _ready():
	$CanvasLayer/HUD.show()
	$CanvasLayer/PauseMenu.hide()
	$CanvasLayer/ColorRect.show()
	$Timer.wait_time = get_parent().time_limit
	$Timer.start()
	
func _physics_process(delta):
	match state:
		"normal":
			var dir = Vector2.ZERO
			if Input.is_action_pressed("move_up"):
				dir.y -= 1
			if Input.is_action_pressed("move_left"):
				dir.x -= 1
			if Input.is_action_pressed("move_down"):
				dir.y += 1
			if Input.is_action_pressed("move_right"):
				dir.x += 1
				
			dir = dir.normalized()
			velocity = move_and_slide(dir * move_speed)
			
			look_at(get_global_mouse_position())
			
			if Input.is_action_just_pressed("fire"):
				fire()
				
			if Input.is_action_just_pressed("suicide"):
				die()
			
			if inventory.empty():
				$CanvasLayer/HUD/Label.text = "NO WEAPON"
				$Sprite.frame = 0
			else:
				$CanvasLayer/HUD/Label.text = weapon_list[inventory[0]]
				if !$AnimationPlayer.is_playing():
					$Sprite.frame = anim_list[weapon_list[inventory[0]]]
			
			var time = $Timer.time_left
			$CanvasLayer/HUD/Timer/Label.text = "%d:%02d" % [floor($Timer.time_left / 60), int($Timer.time_left) % 60]
			
			update()
		"dead":
			$Sprite.frame = 13

func _draw():
	if inventory.empty() != true:
		if inventory[0] == 2:
			draw_line(Vector2(), get_local_mouse_position() * 100, Color(0, 255, 0, 0.25), 1)
	
func fire():
	#print(inventory)
	if inventory.empty() != true:
		if inventory[0] < 3:
			if inventory[0] == 1:
				for angle in [-20, 0, 20]:
					var a = deg2rad(angle)
					var b = bullet.instance()
					b.transform = transform.rotated(a)
					b.global_position = global_position
					get_tree().current_scene.add_child(b)
					inventory.clear()
			else:
				var b = bullet.instance()
				b.bparent = "Player"
				b.transform = transform
				get_tree().current_scene.add_child(b)
				inventory.clear()
		else:
			$AnimationPlayer.play(weapon_list[inventory[0]])
			$SlashZone/Collision.disabled = false
			yield($AnimationPlayer, "animation_finished")
			$SlashZone/Collision.disabled = true
			inventory.clear()

func spawn_weapon(id):
	var w = weapon.instance()
	w.global_position = global_position
	w.gun_id = id
	get_tree().current_scene.add_child(w)

func _on_SlashZone_body_entered(body):
	if body is KinematicBody2D:
		if body.name != "Player":
			body.health -= 1
			body.spawn_weapon()

func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_GiveUp_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://menus/MainMenu.tscn")

func die():
	state = "dead"
	get_tree().paused = true
	$CanvasLayer/HUD.hide()
	$CanvasLayer/PauseMenu.show()

func _on_Timer_timeout():
	die()

func complete():
	$CanvasLayer/MissionComplete/AnimationPlayer.play("flash")
