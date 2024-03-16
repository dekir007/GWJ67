extends StaticBody2D

@onready var marker: Marker2D = $Marker2D
@onready var timer: Timer = $Timer

var can : bool = true

var player_nearby : bool = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("worker"):
		use()
	if body.is_in_group("player"):
		player_nearby = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_nearby = false
	pass # Replace with function body.

func _unhandled_key_input(event: InputEvent) -> void:
	if event.keycode == KEY_E:
		use()
		Global.coffee += 50
		pass

func use():
	can = false
	# sfx
	timer.start()

func _on_timer_timeout() -> void:
	can = true
	pass # Replace with function body.
