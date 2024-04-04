extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass





func _on_character_body_2d_punetazo_cuerpo():
	$Label.text = 'PUÑETAZO'
	await get_tree().create_timer(1).timeout
	$Label.text = ' '
	pass # Replace with function body.


func _on_character_body_2d_atras():
	pass # Replace with function body.


func _on_character_body_2d_punetazo():
	pass # Replace with function body.


func _on_timer_timeout():
	pass # Replace with function body.


func _on_character_body_2d_patada_cuerpo():
	$Label.text = 'PATADA'
	await get_tree().create_timer(1).timeout
	$Label.text = ' '
	pass # Replace with function body.


func _on_node_poder_1():
	$Label.text = 'PODER 1'
	await get_tree().create_timer(1).timeout
	$Label.text = ' '
	pass # Replace with function body.


func _on_node_poder_2():
	$Label.text = 'PODER 2'
	await get_tree().create_timer(1).timeout
	$Label.text = ' '
	pass # Replace with function body.
