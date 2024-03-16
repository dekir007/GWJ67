extends Node

signal score_changed(score)

var score :
	set(val):
		score = val
		score_changed.emit(score)

var coffee : float

var suspicion_level : float
