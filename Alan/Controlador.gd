extends Node
var EntradaInputs = []
@export var Poder:PackedScene
signal controladoractivoplayer1
signal controladoractivoplayer2
var poderUno = ['abajo','atras','puño']
signal poder1()
var poderDos = ['abajo','abajo','puño']
signal poder2()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$"../TiempoCombo".start(1)
	pass # Replace with function body.

func _process(delta):
	$"../CharacterBody2D/Label".text = str(Global.player1 , Global.index_player1)
	if Global.player1 == 1 and Global.index_player1 == 2:
		emit_signal("controladoractivoplayer1")
	elif Global.player2 == 2 and Global.index_player1 == 2:
		emit_signal("controladoractivoplayer2")
	if EntradaInputs == poderUno:
		emit_signal('poder1')
		EntradaInputs = []
		$"../CharacterBody2D/Label".text = 'poder cabron'
	if EntradaInputs == poderDos:
		emit_signal('poder2')
		EntradaInputs = []
		
	if EntradaInputs == poderUno:
		var poderlanzado = Poder.instantiate()
		get_parent().add_child (poderlanzado)
		
		emit_signal('poder1')
		EntradaInputs = []
		$"../CharacterBody2D/Label".text = 'poder uno'
		
		
	if EntradaInputs == poderDos:
		emit_signal('poder2')
		EntradaInputs = []
		
	
	if EntradaInputs.size() > 0:
		await get_tree().create_timer(1).timeout
		print(EntradaInputs)

func _on_character_body_2d_abajo():
	$"../TiempoCombo".start(0.4)
	if EntradaInputs.size() < 4 :
		EntradaInputs.append('abajo')
		return EntradaInputs
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)



func _on_character_body_2d_adelante():
	$"../TiempoCombo".start(0.4)
	if EntradaInputs.size() < 4 :
		print("entre")
		EntradaInputs.append('adelante')
		print("entrada 1 :" +str(EntradaInputs))
		return EntradaInputs
		print("entrada 2 :" +str(EntradaInputs))
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)



func _on_character_body_2d_arriba():
	$"../TiempoCombo".start(0.4)
	if EntradaInputs.size() < 4 :
		print("salto efectivamente")
		EntradaInputs.append('arriba')
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)



func _on_character_body_2d_atras():
	$"../TiempoCombo".start(0.4)
	if EntradaInputs.size() < 4 :
		EntradaInputs.append('atras')
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)


func _on_character_body_2d_patada():
	$"../TiempoCombo".start(0.4)
	if EntradaInputs.size() < 4 :
		EntradaInputs.append('patada')
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)


func _on_character_body_2d_punetazo():
	$"../TiempoCombo".start(0.4)
	if EntradaInputs.size() < 4 :
		EntradaInputs.append('puño')
		print(EntradaInputs)
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)
	


func _on_tiempo_combo_timeout():
	EntradaInputs = []
	$"../TiempoCombo".start(0.4)
	pass # Replace with function body.


func _on_character_body_2d_patada_cuerpo():
	pass # Replace with function body.


func _on_character_body_2d_punetazo_cuerpo():
	pass # Replace with function body.
