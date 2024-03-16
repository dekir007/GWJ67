extends Node2D

func _ready() -> void:
	#print(worker.bt_player.blackboard.get_var("vending_machines"))
	#worker.bt_player.blackboard.set_var("vending_machines", Vector2(500, 1000))
	#var tasks = get_tree().get_first_node_in_group("worker").bt_player.blackboard.get_var("tasks")
	#tasks["Arthur"].append(10)
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		#var mouse_pos = get_global_mouse_position()
		#get_tree().get_first_node_in_group("worker").bt_player.blackboard.set_var("vending_machines", mouse_pos)
		
		var tasks = get_tree().get_first_node_in_group("worker").bt_player.blackboard.get_var("tasks")
		#tasks["Arthur"].append(10)
		#print(mouse_pos)
