extends Node

signal score_changed(_score)
signal coffee_changed(_coffee)
signal suspicion_changed(_score)

var score : int :
	set(val):
		score += (val - score) * (1 - suspicion_level)
		score_changed.emit(score)

var coffee : int :
	set(val):
		coffee = val
		coffee_changed.emit(coffee)

var suspicion_level : float :
	set(val):
		suspicion_level = val
		suspicion_changed.emit(suspicion_level)

func _ready() -> void:
	await get_tree().create_timer(.02).timeout
	coffee = 50
	suspicion_level = 0.1
	score = 0
