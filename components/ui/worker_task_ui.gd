@tool
extends PanelContainer

signal assigned(task_resource)

@export var task : WorkTask

@onready var header: Label = %Header
@onready var duration: Label = %Duration
@onready var cost: Label = %Cost
#@onready var worker_selection: OptionButton = %WorkerSelection

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if task == null:
		return
	#var names = WorkTask.TaskTypes.keys()
	header.text = task.name#names[task.type]
	duration.text = "Takes time: " + str(task.duration) + " seconds"
	cost.text = "Costs : " + str(task.cost) + " of a cup of coffee"
	
	#worker_selection.clear()
	#var workers = get_tree().get_nodes_in_group("worker")
	#for worker in workers:
		#worker_selection.add_item(worker.name)
	
	pass # Replace with function body.

func _on_assign_button_up() -> void:
	assigned.emit(task)
	pass # Replace with function body.
