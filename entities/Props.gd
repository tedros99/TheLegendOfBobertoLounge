extends StaticBody2D

export (String, "Desk", "Table", "Chair", "Office Desk", "Round Table", "Plant") var type

func _ready():
	match type:
		"Desk":
			$Sprite.frame = 0
			$Collision.disabled = false
		"Table":
			$Sprite.frame = 1
			$Collision2.disabled = false
		"Chair":
			$Sprite.frame = 2
			$Collision3.disabled = false
		"Office Desk":
			$Sprite.frame = 3
			$Collision4.disabled = false
		"Round Table":
			$Sprite.frame = 4 
			$Collision5.disabled = false
		"Plant":
			$Sprite.frame = 5
			$Collision6.disabled = false
