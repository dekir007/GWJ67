extends PanelContainer

@onready var worker_selection: OptionButton = %WorkerSelection
@onready var worker_current_tasks: Label = %WorkerCurrentTasks
@onready var tasks: HBoxContainer = %Tasks

var blackboard 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	upd_workers()
	
	for task in tasks.get_children():
		task.assigned.connect(func(task_resource):
			var worker = worker_selection.get_item_text(worker_selection.get_selected_id())
			var tasks = blackboard.get_var("tasks", null)
			if tasks == null:
				push_error("NO TASKS")
				return
			
			tasks[worker].append(task_resource)
			worker_current_tasks.text += str(task_resource.name) + "\n"
			print(tasks[worker].size())
			)
	
	pass # Replace with function body.

func upd_workers():
	worker_selection.clear()
	var workers = get_tree().get_nodes_in_group("worker")
	if workers.size() > 0:
		blackboard = workers[0].bt_player.blackboard
		for worker in workers:
			worker_selection.add_item(worker.name)
		_on_worker_selection_item_selected(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_worker_selection_item_selected(index: int) -> void:
	worker_current_tasks.text = "Current tasks:\n"
	var worker = worker_selection.get_item_text(index)
	var tasks = blackboard.get_var("tasks", null)
	if tasks == null:
		push_error("NO TASKS")
		return
	
	for task in tasks[worker]:
		worker_current_tasks.text += str(task.name) + "\n"
	
	
func _on_hide_button_button_up() -> void:
	hide()
	pass # Replace with function body.


func _on_visibility_changed() -> void:
	if visible:
		upd_workers()
	pass # Replace with function body.
