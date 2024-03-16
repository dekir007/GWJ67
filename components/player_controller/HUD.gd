extends CanvasLayer

@onready var tasks_distribution: PanelContainer = $TasksDistribution
@onready var start_distr: Button = $StartDistr
@onready var score_label: Label = %ScoreLabel
@onready var coffee_bar: ProgressBar = %CoffeeBar
@onready var suspicion_bar: ProgressBar = %SuspicionBar

func _ready() -> void:
	tasks_distribution.visibility_changed.connect(func():
		if tasks_distribution.visible:
			get_tree().call_group("ui_hide", &"hide")
			#start_distr.hide()
		else:
			get_tree().call_group("ui_hide", &"show")
			#start_distr.show()
		)
	
	Global.score_changed.connect(func(score):
		score_label.text = "Score: " + str(score)
		)
	Global.coffee_changed.connect(func(coffee):
		coffee_bar.value = coffee
		)
	Global.suspicion_changed.connect(func(suspicion):
		suspicion_bar.value = suspicion
		)

func _on_start_distr_pressed() -> void:
	tasks_distribution.show()
	pass # Replace with function body.
