extends CharacterBody2D

@export var velocidad: float = 200.0
@export var gravedad: float = 980.0
@export var salto: float = -500.0

var monedas: int = 0
var label_monedas: Label

func _ready():
	label_monedas = get_node("../UI/ContadorMonedas")  # Ajusta esta ruta

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravedad * delta
	else:
		velocity.y = 0.0

	if global_position.y > 1000:
		get_tree().reload_current_scene()

	var direccion = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1

	velocity.x = direccion.x * velocidad

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = salto

	move_and_slide()

func aumentar_salto():
	salto *= 1.5
	print("Nuevo valor de salto:", salto)

func agregar_moneda():
	monedas += 1
	label_monedas.text = str(monedas)
	print("¡Moneda agarrada!")
	aumentar_salto()
	label_monedas = get_node("../UI/ContadorMonedas")
