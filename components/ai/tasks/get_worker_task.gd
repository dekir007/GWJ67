@tool
extends BTAction

# Called to generate a display name for the task (requires @tool).
func _generate_name() -> String:
	return "GetWorkerTask"


# Called to initialize the task.
func _setup() -> void:
	var t : Dictionary = blackboard.get_var("tasks")
	if agent.name not in t:
		t[agent.name] = []
	pass


# Called when the task is entered.
func _enter() -> void:
	pass


# Called when the task is exited.
func _exit() -> void:
	pass


# Called each time this task is ticked (aka executed).
func _tick(_delta: float) -> Status:
	var tasks : Dictionary = blackboard.get_var("tasks", null)
	if tasks == null or (agent.name not in tasks) or tasks[agent.name].size() == 0:
		return FAILURE
	if "tasks" not in agent:
		push_error("no tasks var in agent")
		return FAILURE
	agent.tasks = tasks
	return SUCCESS


# Strings returned from this method are displayed as warnings in the editor.
func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	return warnings

