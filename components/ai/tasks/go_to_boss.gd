@tool
extends BTAction

## Note: Each method declaration is optional.
## At minimum, you only need to define the "_tick" method.

var target : Node

# Called to generate a display name for the task (requires @tool).
func _generate_name() -> String:
	return "GoToBoss"


# Called to initialize the task.
func _setup() -> void:
	pass


# Called when the task is entered.
func _enter() -> void:
	#target = Engine.get_main_loop().current_scene.get_tree().get_first_node_in_group("player")
	pass


# Called when the task is exited.
func _exit() -> void:
	pass


# Called each time this task is ticked (aka executed).
func _tick(delta: float) -> Status:
	
	
	return SUCCESS


# Strings returned from this method are displayed as warnings in the editor.
func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	return warnings

