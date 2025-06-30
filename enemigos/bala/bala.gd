extends Area2D

var velocidad = -2000  

func _process(delta):
	position.x += velocidad * delta  

func _on_body_entered(body):
	if body is CharacterBody2D: 
		get_tree().reload_current_scene()  
		queue_free()  
