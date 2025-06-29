extends CharacterBody2D

@export var velocidad: float = 201.0
@export var gravedad: float = 980.0
@export var salto: float = -500.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravedad * delta
	else:
		velocity.y = 0.0


	var direccion = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1

	velocity.x = direccion.x * velocidad



	move_and_slide()
