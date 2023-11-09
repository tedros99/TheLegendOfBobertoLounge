extends Control

func _ready():
	pass

func _on_Return_pressed():
	get_tree().change_scene("res://menus/MainMenu.tscn")

func _on_E1F1_pressed():
	Global.curr_level = 1
	get_tree().change_scene("res://levels/E1F1.tscn")

func _on_E1F2_pressed():
	Global.curr_level = 1
	get_tree().change_scene("res://levels/E1F2.tscn")
	
func _on_E1F3_pressed():
	Global.curr_level = 1
	get_tree().change_scene("res://levels/E1F3.tscn")
	
func _on_E2F1_pressed():
	Global.curr_level = 2
	get_tree().change_scene("res://levels/E2F1.tscn")

func _on_E2F2_pressed():
	Global.curr_level = 2
	get_tree().change_scene("res://levels/E2F2.tscn")

func _on_E3F1_pressed():
	Global.curr_level = 3
	get_tree().change_scene("res://levels/E3F1.tscn")

func _on_E3F2_pressed():
	Global.curr_level = 3
	get_tree().change_scene("res://levels/E3F2.tscn")

func _on_E4F1_pressed():
	Global.curr_level = 4
	get_tree().change_scene("res://levels/E4F1.tscn")

func _on_E4F2_pressed():
	Global.curr_level = 4
	get_tree().change_scene("res://levels/E4F2.tscn")

func _on_E4F3_pressed():
	Global.curr_level = 4
	get_tree().change_scene("res://levels/E4F3.tscn")
