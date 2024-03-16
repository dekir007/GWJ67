extends CharacterBody2D

@export var speed : float = 10000

@onready var body: Sprite2D = $Body

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down") * (1.5 if Input.is_action_pressed("shift") else 1)
	if dir.length_squared() > 0:
		rotation = lerp(rotation, dir.angle(), 0.2)
	velocity = dir * speed * delta
	move_and_slide()
