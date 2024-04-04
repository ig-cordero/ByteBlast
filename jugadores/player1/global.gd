extends Node
var EntradaInputs = []

var poderUno = ['abajo','atras','puño']
signal poder1()
@export var poder :PackedScene

var poderDos = ['abajo','abajo','puño']
signal poder2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	
	if EntradaInputs == poderUno:
		emit_signal('poder1')
		EntradaInputs = []
	if EntradaInputs == poderDos:
		emit_signal('poder2')
		EntradaInputs = []
		
	
	if EntradaInputs.size() > 0:
		await get_tree().create_timer(1).timeout
		print(EntradaInputs)

func patada():
	pass


func _on_character_body_2d_abajo():
	$TiempoCombo.start(0.4)
	if EntradaInputs.size() < 4 :
		EntradaInputs.append('abajo')
		return EntradaInputs
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)



func _on_character_body_2d_adelante():
	$TiempoCombo.start(0.4)
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
	$TiempoCombo.start(0.4)
	if EntradaInputs.size() < 4 :
		print("salto efectivamente")
		EntradaInputs.append('arriba')
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)



func _on_character_body_2d_atras():
	$TiempoCombo.start(0.4)
	if EntradaInputs.size() < 4 :
		EntradaInputs.append('atras')
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)


func _on_character_body_2d_patada():
	$TiempoCombo.start(0.4)
	if EntradaInputs.size() < 4 :
		EntradaInputs.append('patada')
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)


func _on_character_body_2d_punetazo():
	$TiempoCombo.start(0.4)
	if EntradaInputs.size() < 4 :
		EntradaInputs.append('puño')
		print(EntradaInputs)
	elif EntradaInputs.size() >4:
		EntradaInputs = []
		print(EntradaInputs)
	


func _on_tiempo_combo_timeout():
	EntradaInputs = []
	$TiempoCombo.start(0.4)
	pass # Replace with function body.
