@tool
extends BTAction

var cur_task : WorkTask
var done : bool = false
# Called to generate a display name for the task (requires @tool).
func _generate_name() -> String:
	return "DoWork"

var tasks : Dictionary
# Called to initialize the task.
func _setup() -> void:
	tasks = blackboard.get_var("tasks")
	pass


# Called when the task is entered.
func _enter() -> void:
	#var tasks : Dictionary = blackboard.get_var("tasks")
	cur_task = tasks[agent.name][0]
	#tasks[agent.name].remove_at(0)
	print(cur_task.name)
	Engine.get_main_loop().current_scene.get_tree().create_timer(cur_task.duration).timeout.connect(func():
		done = true
		)
	pass


# Called when the task is exited.
func _exit() -> void:
	tasks[agent.name].remove_at(0)
	done = false
	pass


# Called each time this task is ticked (aka executed).
func _tick(_delta: float) -> Status:
	#if cur_task > 0:
		#cur_task -= 1
		#print(cur_task)
		#return RUNNING
	if !done:
		return RUNNING
	
	return SUCCESS


# Strings returned from this method are displayed as warnings in the editor.
func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	return warnings

