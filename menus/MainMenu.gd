extends Control

export (PackedScene) var briefing

func _ready():
	pass

func _on_Start_pressed():
	Global.curr_level = 1
	get_tree().change_scene("res://menus/Briefing.tscn")

func _on_LevelSelect_pressed():
	get_tree().change_scene("res://menus/LevelSelect.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_MusicPlayer_pressed():
	get_tree().change_scene("res://menus/MusicPlayer.tscn")
