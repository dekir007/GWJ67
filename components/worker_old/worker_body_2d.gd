extends CharacterBody2D

@export var SPEED:float = 300.0
const DELTA:float = 2.0

var destination_position: Vector2


func move_to(destination):
	destination_position = destination

func _physics_process(_delta):
	if destination_position == Vector2(0,0):
		pass
	elif _difference_more_than_delta():
		var direction: Vector2 = (destination_position - position).normalized()
		velocity = direction * SPEED
		_rotate(direction)
		move_and_slide()
	else:
		global_position = destination_position

func _difference_more_than_delta() -> bool:
	return abs(destination_position.x - global_position.x) >= DELTA or abs(destination_position.y - global_position.y) >= DELTA

func _rotate(direction: Vector2):
	match direction:
		Vector2(0,-1):
			rotation_degrees = 180
		Vector2(0,1):
			rotation_degrees = 0
		Vector2(-1, 0):
			rotation_degrees = 90
		Vector2(1,0):
			rotation_degrees = -90
		_:
			rotation = direction.angle() - 90
			print(rotation)
