extends KinematicBody

export var invertCamera : bool = false
export var regularMoveSpeed : float = 5.0
export var sprintSpeed : float = 10.0
export var isThirdPerson : bool = false

var moveSpeed : float = regularMoveSpeed
var jumpForce : float = 10.0
var gravity : float = 15.0
var maxSpeed : float = 8
var sensitivity : float = 0.002

var vel : Vector3 = Vector3()

onready var camera : Camera = get_node("Camera")

func _ready():
	pass

func _process(_delta):
	var env = get_node("/root/GlobalEnvironment")
	
	invertCamera = env.invertCamera
	
	if Input.is_action_pressed("Click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if Input.is_action_pressed("Exit"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.is_action_just_pressed("Toggle_Third_Person"):
		isThirdPerson = !isThirdPerson
	
	if isThirdPerson:
		camera.translation = Vector3(-2, 4, -6)
	else:
		camera.translation = Vector3(0, 0.5, 1)

func _physics_process(delta):
	vel.x = 0
	vel.z = 0
	
	var input = Vector3()
	
	if Input.is_action_pressed("Movement_Sprint"):
		moveSpeed = sprintSpeed
	else:
		moveSpeed = regularMoveSpeed
	
	if Input.is_action_pressed("Movement_Forward"):
		input.z += 1
	
	if Input.is_action_pressed("Movement_Backward"):
		input.z -= 1
	
	if Input.is_action_pressed("Movement_Left"):
		input.x += 1
	
	if Input.is_action_pressed("Movement_Right"):
		input.x -= 1
	
	input = input.normalized()
	
	var dir = (transform.basis.z * input.z + transform.basis.x * input.x)
	
	vel.x = dir.x * moveSpeed
	vel.z = dir.z * moveSpeed
	vel.y -= gravity * delta
	
	if Input.is_action_pressed("Movement_Up") and is_on_floor():
		vel.y = jumpForce
	
	if not is_on_floor():
		vel.y -= gravity * delta
	
	if Input.is_action_pressed("Movement_Down") and not is_on_floor():
		vel.y -= jumpForce
	
	vel = move_and_slide(vel, Vector3.UP)

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * sensitivity)

		if invertCamera:
			camera.rotate_x(-event.relative.y * sensitivity)
		else:
			camera.rotate_x(event.relative.y * sensitivity)
		
		camera.rotation.x = clamp(camera.rotation.x, -1.2, 1.2)
