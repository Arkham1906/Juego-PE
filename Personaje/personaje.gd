extends CharacterBody2D

@export var velocidad : float = 200.0

func _physics_process(delta):
	var direccion = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1
	if Input.is_action_pressed("ui_down"):
		direccion.y += 1
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1

	direccion = direccion.normalized()  # Para que no se mueva más rápido en diagonal

	velocity = direccion * velocidad  # velocity es la propiedad para mover el CharacterBody2D

	move_and_slide()
