extends CharacterBody2D
@onready var sample_character: CharacterBody2D = $"."


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var strength : float

var center : Vector2

func _ready() -> void:
	center = sample_character.global_position

func _physics_process(delta: float) -> void:

	input_functions(delta)
	move_and_slide()

func input_functions(delta: float) -> void: 
	var button : String = ""
	
	if Input.is_action_pressed("d_down"):
		button = "d_down"
		velocity.y += SPEED * delta
	if  Input.is_action_pressed("d_up"):
		button = "d_up"
		velocity.y -= SPEED * delta
	if  Input.is_action_pressed("d_left"):
		button = "d_left"
		velocity.x -= SPEED * delta
	if  Input.is_action_pressed("d_right"):
		button = "d_right"
		velocity.x += SPEED * delta
	
	
	if Input.is_action_pressed("controller_b"):
		button = "STOP VELOCITY!!!"
		velocity.x = 0
		velocity.y = 0
	
	if Input.is_action_pressed("controller_x"):
		button = "RESET POSITION!!!"
		sample_character.position.x = center.x
		sample_character.position.y = center.y
	
	if Input.is_action_pressed("controller_a"):
		button = "RESET POSITION AND VELOCITY!!!"
		velocity.x = 0
		velocity.y = 0
		sample_character.position.x = center.x
		sample_character.position.y = center.y
		
		print_button(button)

func print_button(button : String) -> void:
	print(button)
	pass
