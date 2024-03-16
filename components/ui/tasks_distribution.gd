extends PanelContainer

@onready var worker_selection: OptionButton = %WorkerSelection
@onready var worker_current_tasks: Label = %WorkerCurrentTasks

var blackboard 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	worker_selection.clear()
	var workers = get_tree().get_nodes_in_group("worker")
	if workers.size() > 0:
		blackboard = workers[0].bt_player.blackboard
		for worker in workers:
			worker_selection.add_item(worker.name)
		_on_worker_selection_item_selected(0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_worker_selection_item_selected(index: int) -> void:
	worker_current_tasks.text = "Current tasks:\n"
	var worker = worker_selection.get_item_text(index)
	var tasks = blackboard.get_var("tasks", null)
	if tasks == null:
		push_error("NO TASKS")
		return
	
	for task in tasks[worker]:
		worker_current_tasks.text += str(task) + "\n"
	
	
