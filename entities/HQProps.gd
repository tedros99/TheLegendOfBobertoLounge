extends StaticBody2D

export (String, "Server", "Rails", "Lever", "Flammable", "Nuclear", "Station") var type

var inrange = false

func _ready():
	$Sprite.material.set_shader_param("alpha", 0)
	match type:
		"Server":
			$Sprite.frame = 0
			$Collision.disabled = false
		"Rails":
			$Sprite.frame = 1
			$Collision2.disabled = false
		"Lever":
			$Sprite.frame = 2
			$Collision3.disabled = false
		"Flammable":
			$Sprite.frame = 3
			$Collision4.disabled = false
		"Nuclear":
			$Sprite.frame = 4
			$Collision4.disabled = false
		"Station":
			$Sprite.frame = 5
			$Collision5.disabled = false
			$Sprite.material.set_shader_param("alpha", 1)

func _physics_process(delta):
	if inrange and (type == "Station"):
		if Input.is_action_just_pressed("grab"):
			get_parent().complete_objective()
			call_deferred('queue_free')


func _on_GrabRange_body_entered(body):
	if body.name == "Player":
		inrange = true

func _on_GrabRange_body_exited(body):
	if body.name == "Player":
		inrange = false
