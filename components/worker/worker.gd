extends CharacterBody2D

@export var speed : float = 30000
@export var want_coffee : bool = true :
	set(val):
		want_coffee = val
		if !val: #when false
			coffee_timer.start()

@onready var coffee_timer: Timer = $CoffeeTimer
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var bt_player: BTPlayer = $BTPlayer
@onready var idle_particles: GPUParticles2D = $IdleParticles
@onready var work_particles: GPUParticles2D = $WorkParticles

var is_nav : bool = false # because check agent property "nav_agent.is_navigation_finished()" doesnt work

var tasks

var player_spotted : bool = false
var increase_sus : bool = true

var vm_oc : Vector2 = Vector2.ZERO

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	#is_nav = nav_agent.is_navigation_finished()
	if !is_nav:
		return
	#nav_agent.target_position = target_global_position is called in btplayer
	
	var dir = global_position.direction_to(nav_agent.get_next_path_position())
	var ang = dir.angle()
	rotation = lerp(rotation, ang, 0.2)
	var vel = dir * speed * delta
	nav_agent.set_velocity(vel)
	
	if player_spotted and increase_sus:
		#print(Global.suspicion_level)
		Global.suspicion_level += delta / 50

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	nav_agent.is_target_reachable() # i dunno but this magic makes it work
	#print(global_position, " ", nav_agent.target_position, " ", velocity)
	move_and_slide()

func move_to_vending_machines():
	#if destination.distance_to(global_position) < nav_agent.target_desired_distance+ 10:
		#return
	var vm = bt_player.blackboard.get_var("vending_machines")
	#var vm_oc = bt_player.blackboard.get_var("vending_machines_occupied")
	nav_agent.target_position = vm[0]
	vm_oc = vm[0]
	vm.remove_at(0)
	is_nav = true

func move_to_player():
	nav_agent.target_position = get_tree().get_first_node_in_group("player").global_position
	#print(nav_agent.target_position.distance_to(global_position), " " , nav_agent.target_position, " ", global_position)
	is_nav = true

func emit_idle(e:bool):
	idle_particles.emitting = e

func emit_work(e:bool):
	work_particles.emitting = e

func _on_navigation_agent_2d_target_reached() -> void:
	print("reached ")
	velocity = Vector2.ZERO
	nav_agent.set_velocity(Vector2.ZERO)
	is_nav = false
	
	if vm_oc != Vector2.ZERO:
		var vm = bt_player.blackboard.get_var("vending_machines")
		vm.append(vm_oc)
		vm_oc = Vector2.ZERO
	pass # Replace with function body.


func _on_vision_cone_area_body_entered(body: Node2D) -> void:
	#print(name)
	if body.is_in_group("player"):
		player_spotted = true
	pass # Replace with function body.


func _on_vision_cone_area_body_exited(body: Node2D) -> void:
	#print(name)
	if body.is_in_group("player"):
		player_spotted = false
	pass # Replace with function body.


func _on_coffee_timer_timeout() -> void:
	want_coffee = true
	pass # Replace with function body.
