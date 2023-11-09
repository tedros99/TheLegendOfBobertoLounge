extends StaticBody2D

export (String, "Coffin", "Computer", "Server", "Computer 2") var type

func _ready():
	match type:
		"Coffin":
			$Sprite.frame = 0
			$Collision.disabled = false
		"Computer":
			$Sprite.frame = 1
			$Collision2.disabled = false
		"Server":
			$Sprite.frame = 2
			$Collision3.disabled = false
		"Computer 2":
			$Sprite.frame = 3
			$Collision4.disabled = false
