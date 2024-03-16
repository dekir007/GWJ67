extends Resource
class_name WorkTask

enum TaskTypes { FillOutPapers, ProjectPlanning, OfficeErrands, TeamMeeting }

@export var type: TaskTypes
@export var duration : float
@export var cost : float
