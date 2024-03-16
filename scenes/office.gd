extends Node2D

@onready var vending_machines_node2d: Node2D = %VendingMachines
var vending_machines : Array
func _ready() -> void:
	#print(worker.bt_player.blackboard.get_var("vending_machines"))
	#worker.bt_player.blackboard.set_var("vending_machines", Vector2(500, 1000))
	#var tasks = get_tree().get_first_node_in_group("worker").bt_player.blackboard.get_var("tasks")
	#tasks["Arthur"].append(10)
	var w = get_tree().get_first_node_in_group("worker")
	var b = w.bt_player.blackboard
	var p = get_tree().get_first_node_in_group("player")
	b.set_var("player", p)
	vending_machines = b.get_var("vending_machines")
	#var vending_machines_occupied : Array = b.get_var("vending_machines_occupied")
	for vending_machine in vending_machines_node2d.get_children():
		vending_machines.append(vending_machine.marker.global_position)
		#vending_machines_occupied.append(false)
	
	#print(w.bt_player.blackboard.get_var("player"))
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		#var mouse_pos = get_global_mouse_position()
		#get_tree().get_first_node_in_group("worker").bt_player.blackboard.set_var("vending_machines", mouse_pos)
		
		var tasks = get_tree().get_first_node_in_group("worker").bt_player.blackboard.get_var("tasks")
		#tasks["Arthur"].append(10)
		#print(mouse_pos)
