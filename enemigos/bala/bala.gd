extends Area2D

var velocidad = -2000  # pixeles por segundo

func _process(delta):
	position.x += velocidad * delta  # o cambiar la dirección si es vertical, por ejemplo

func _on_body_entered(body):
	if body.name == "Jugador":  # o verifica si tiene una etiqueta
		body.morir()  # Asumiendo que el jugador tiene un método para morir
		queue_free()
