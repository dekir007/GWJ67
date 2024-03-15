extends Node

@export var tasks : Array

@onready var character_body: CharacterBody2D = %CharacterBody2D
@onready var movement_curve: Curve2D = %Path2D.curve
@onready var bt_player: BTPlayer = $BTPlayer

var destination_index: int
var destination_position: Vector2

var stop : bool = false

func _ready():
	destination_position = movement_curve.get_point_position(destination_index)
	pass

func _process(_delta):
	#print(bt_player.blackboard.get_var("vending_machines"))
	if character_body.global_position == destination_position and !stop:
		if destination_index != movement_curve.point_count-1:
			destination_index += 1
			destination_position = movement_curve.get_point_position(destination_index)
			character_body.move_to(destination_position)
		else:
			stop = true
	elif !stop:
		character_body.move_to(destination_position)

func _on_vision_cone_area_body_entered(body):
	pass # Replace with function body.


func _on_vision_cone_area_body_exited(body):
	pass # Replace with function body.
