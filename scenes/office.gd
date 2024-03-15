extends Node2D

@onready var worker: CharacterBody2D = $Worker


func _ready() -> void:
	print(worker.bt_player.blackboard.get_var("vending_machines"))
	#worker.bt_player.blackboard.set_var("vending_machines", Vector2(500, 1000))
	var tasks : Array = worker.bt_player.blackboard.get_var("tasks")
	tasks.append(10)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_pos = get_global_mouse_position()
		worker.bt_player.blackboard.set_var("vending_machines", mouse_pos)
		print(mouse_pos)
