
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

export var gravity = 0
export var velocidad = 0
export var jump_force = 0

var let_move = true
var readytojump = true
var body
var STATE #ya lo voy a usar para una maquina de estados...

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	body = get_node("Body")
	body.set_gravity_scale(gravity)
	body.set_rot(0)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	body.set_rot(0)
	check_move(let_move)
	check_jump()	
	

func check_move(x):
	if(x):
		if(Input.is_action_pressed("move_right")):
			body.move_local_x(velocidad, false)
			#print("funciona")
		if(Input.is_action_pressed("move_left")):
			body.move_local_x(-velocidad, false)
			
			

func check_jump():
	if(Input.is_action_pressed("move_jump") and readytojump):
		move_local_y(-jump_force, true)#add_force(Vector2(0, -1), Vector2(0, 5))
		readytojump = false
		#print("funca")
