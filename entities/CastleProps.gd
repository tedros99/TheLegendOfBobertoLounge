extends StaticBody2D

export (String, "Throne", "Table", "Armor", "Chest", "Open Chest", "Chair", "Rug 1", "Rug 2", "Rug 3", "Rug 4") var type

func _ready():
	match type:
		"Throne":
			$Sprite.frame = 0
			$Collision.disabled = false
		"Table":
			$Sprite.frame = 1
			$Collision2.disabled = false
		"Armor":
			$Sprite.frame = 2
			$Collision3.disabled = false
		"Chest":
			$Sprite.frame = 3
			$Collision4.disabled = false
		"Open Chest":
			$Sprite.frame = 4 
			$Collision5.disabled = false
		"Chair":
			$Sprite.frame = 5
			$Collision6.disabled = false
		"Rug 1":
			$Sprite.frame = 6
			z_index = -1
		"Rug 2":
			$Sprite.frame = 7
			z_index = -1
		"Rug 3":
			$Sprite.frame = 8
			z_index = -1
		"Rug 4":
			$Sprite.frame = 9
			z_index = -1
