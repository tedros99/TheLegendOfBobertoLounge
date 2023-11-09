extends Node2D

export var time_limit = 60

var objective = false
var true_objective = 5
var fighting = []
var music = false
var timeleft = 30

func complete_objective():
	true_objective -= 1
	$Player.complete()

func _ready():
	fighting.resize(7)
	$AudioStreamPlayer.volume_db = -10

func _physics_process(delta):
	for child in $Navigation2D.get_children().size():
		var x = $Navigation2D.get_children()[child]
		if x.is_in_group("enemies"):
			if x.state == "fight":
				fighting[child - 1] = 1
			else:
				fighting[child - 1] = 0
	
	if true_objective == 0:
		next_phase()

func sum(arr):
	var s = 0
	for x in arr:
		 s += x
	return s

func next_phase():
	get_tree().change_scene("res://menus/MainMenu.tscn")
