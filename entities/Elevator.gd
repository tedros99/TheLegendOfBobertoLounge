extends Node2D

var ready = false

func _ready():
	ready = false
	$Sprite.frame = 0

func _physics_process(delta):
	if owner.objective == true:
		ready = true
		$Sprite.frame = 1

func _on_Area2D_body_entered(body):
	if body.name == "Player" and ready:
		get_tree().current_scene.next_phase()
