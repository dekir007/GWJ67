extends Node

@onready var character_body: CharacterBody2D = %CharacterBody2D
@onready var movement_curve: Curve2D = %Path2D.curve
var destination_index: int
var destination_position: Vector2


func _ready():
	destination_position = movement_curve.get_point_position(destination_index)
	pass

func _process(_delta):
	if character_body.position == destination_position:
		if destination_index != movement_curve.point_count-1:
			destination_index += 1
			destination_position = movement_curve.get_point_position(destination_index)
			character_body.move_to(destination_position)
	else:
		character_body.move_to(destination_position)

func _on_vision_cone_area_body_entered(body):
	pass # Replace with function body.


func _on_vision_cone_area_body_exited(body):
	pass # Replace with function body.
