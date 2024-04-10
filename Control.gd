extends Control

var turno = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if turno == 3 :
		get_tree().change_scene_to_file("res://mundo.tscn")
	pass

#esta logica se puede refactorisar para ser menos lineas con un array
func _on_danery_button_down():
	#turno del player 1 selecciona danery
	if turno == 1:
		#aqui el index de personaje danery es el numero uno  y se lo asignamos a player 1
		Global.index_player1 = 1
		Global.player1 = 1
		turno += 1
	#turno del player 2 selecciona danery
	elif turno == 2 :
		#aqui el index de personaje danery es el numero uno y se lo asignamos a player 2
		Global.index_player2 = 1
		Global.player2 = 2
		turno +=1
	pass # Replace with function body.


func _on_alan_button_down():
	#turno del player 1 selecciona alan
	if turno == 1:
		#aqui el index de personaje alan es el numero dos  y se lo asignamos a player 1
		Global.player1 = 1
		Global.index_player1 = 2
		turno += 1
	#turno del player 2 selecciona alan
	elif turno == 2 :
		#aqui el index de personaje alan es el numero dos  y se lo asignamos a player 2
		Global.index_player2 = 2
		Global.player2 = 2
		turno +=1
