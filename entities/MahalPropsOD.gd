extends StaticBody2D

export var type = 0

func _ready():
	$Sprite.frame = type
