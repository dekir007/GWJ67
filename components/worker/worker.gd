extends CharacterBody2D

@export var speed : float = 30000
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var bt_player: BTPlayer = $BTPlayer
@onready var idle_particles: GPUParticles2D = $IdleParticles
@onready var work_particles: GPUParticles2D = $WorkParticles

var is_nav : bool = false # because check agent property "nav_agent.is_navigation_finished()" doesnt work

var tasks

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	#is_nav = nav_agent.is_navigation_finished()
	if !is_nav:
		return
	#nav_agent.target_position = target_global_position is called in btplayer
	
	var dir = global_position.direction_to(nav_agent.get_next_path_position())
	var vel = dir * speed * delta
	nav_agent.set_velocity(vel)

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	nav_agent.is_target_reachable() # i dunno but this magic makes it work
	#print(global_position, " ", nav_agent.target_position, " ", velocity)
	move_and_slide()

func move_to(destination: Vector2):
	#if destination.distance_to(global_position) < nav_agent.target_desired_distance+ 10:
		#return
	nav_agent.target_position = destination
	is_nav = true

func emit_idle(e:bool):
	idle_particles.emitting = e

func emit_work(e:bool):
	work_particles.emitting = e

func _on_navigation_agent_2d_target_reached() -> void:
	#print("reached")
	is_nav = false
	pass # Replace with function body.
