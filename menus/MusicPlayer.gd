extends Control

func _ready():
	pass
	


func _on_Exit_pressed():
	get_tree().change_scene("res://menus/MainMenu.tscn")


func _on_Level1_pressed():
	$AudioStreamPlayer2.play()
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer3.stop()
	$AudioStreamPlayer4.stop()

func _on_Briefing_pressed():
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.stop()
	$AudioStreamPlayer3.stop()
	$AudioStreamPlayer4.stop()

func _on_MiniBoss_pressed():
	$AudioStreamPlayer3.play()
	$AudioStreamPlayer2.stop()
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer4.stop()
	
func _on_FinalBoss_pressed():
	$AudioStreamPlayer4.play()
	$AudioStreamPlayer2.stop()
	$AudioStreamPlayer3.stop()
	$AudioStreamPlayer.stop()
