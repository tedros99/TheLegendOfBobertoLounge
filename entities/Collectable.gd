extends Node2D

var player_in_range = false

export (String, "file", "laptop") var type

func _ready():
	match type:
		"file":
			$Sprite.frame = 0
		"laptop":
			$Sprite.frame = 1
			
func _physics_process(delta):
	if player_in_range == true:
		if Input.is_action_just_pressed("grab"):
			get_parent().complete_objective()
			call_deferred("queue_free")
			
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player_in_range = true

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player_in_range = false
