
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

export var gravity = 0
export var velocidad = 0
var let_move = true
var STATE
var jump_control = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("RigidBody2D").set_gravity_scale(gravity)
	set_process(true)
	pass

func _process(delta):
	check_move(let_move)
	check_jump(delta)

func check_move(x):
	if(x):
		if(Input.is_action_pressed("move_right")):
			get_node("RigidBody2D").move_local_x(velocidad, true)
			#print("funciona")
		if(Input.is_action_pressed("move_left")):
			get_node("RigidBody2D").move_local_x(-velocidad, true)
			

func check_jump(xdelta):
	if(Input.is_action_pressed("move_jump") && jump_control < 5):
		move_local_y(-5, true)#add_force(Vector2(0, -1), Vector2(0, 5))
		jump_control += xdelta
		print(jump_control)
		#print("funca")
	else: jump_control == 0
