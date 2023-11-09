extends Control

var info = {
	1: ["Welcome Boberto Lounge. I need you to infiltrate a secret office in the U.S.A and find files that may lead us to the Grading Sloth."],
	2: ["According to files you got, we have reasons to believe that the Palace King may be involved in the Grading Sloth's plans. Head to Poland and steal his electronics."],
	3: ["After sifting through the Palace King's electronics, we have found intel that there is a secret Grading Sloth base at the Taj Mahal. Head there immediately!"],
	4: ["We have finally found the Grading Sloth's HQ. It's time to end this once and for all."]
}

func _ready():
	$VBoxContainer/Info.text = info[Global.curr_level][0]
	match Global.curr_level:
		1:
			$HBoxContainer/Boss2.show()
			$HBoxContainer/Boss3.hide()
		2:
			$HBoxContainer/Boss2.hide()
			$HBoxContainer/Boss3.show()
		3:
			$HBoxContainer/Boss2.show()
			$HBoxContainer/Boss3.hide()
		4:
			$HBoxContainer/Boss2.show()
			$HBoxContainer/Boss3.hide()

func _on_Begin_pressed():
	match Global.curr_level:
		1:
			get_tree().change_scene("res://levels/E1F1.tscn")
		2:
			get_tree().change_scene("res://levels/E2F1.tscn")
		3:
			get_tree().change_scene("res://levels/E3F1.tscn")
		4:
			get_tree().change_scene("res://levels/E4F1.tscn")

func _on_Quit_pressed():
	get_tree().change_scene("res://menus/MainMenu.tscn")
