extends Node2D

export var time_limit = 120

var objective = false
var fighting = []
var music = false
var timeleft = 30

func complete_objective():
	objective = true
	$Player.complete()

func _ready():
	fighting.resize(10)
	$AudioStreamPlayer.play()

func _physics_process(delta):
	for child in $Navigation2D.get_children().size():
		var x = $Navigation2D.get_children()[child]
		if x.is_in_group("enemies"):
			if x.state == "fight":
				fighting[child - 1] = 1
			else:
				fighting[child - 1] = 0
	
	if sum(fighting) > 0:
		music = true
	else:
		music = false

func sum(arr):
	var s = 0
	for x in arr:
		 s += x
	return s

func next_phase():
	Global.curr_level = 3
	get_tree().change_scene("res://menus/Briefing.tscn")
