extends Resource
class_name WorkTask

enum TaskTypes { FillOutPapers, ProjectPlanning, OfficeErrands, TeamMeeting }

@export var type: TaskTypes
@export var duration : float
@export var cost : float

# godot needs export or else spams with errors
@export var name : String : 
	get:
		return TaskTypes.keys()[type]
