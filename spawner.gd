extends Node2D
#seleccion 
@onready var alan =load("res://Alan/alan.tscn")
@onready var danery = load("res://danery/danery.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
#esta logica se puede refactorisar para ser menos lineas con un array 
#player 1 spawner se pregunta todo al script global
	if Global.index_player1 == 1:
		var daneryPick = danery.instantiate()
		daneryPick.position = $Player1.position
		add_child(daneryPick)
	if Global.index_player1 == 2:
		var alanPick = alan.instantiate()
		alanPick.position =$Player1.position
		add_child(alanPick)
		
#player2 spawner se pregunta todo al script global
	if Global.index_player2 == 1:
		var daneryPick = danery.instantiate()
		daneryPick.position = $Player2.position
		add_child(daneryPick)
	if Global.index_player2 == 2:
		var alanPick = alan.instantiate()
		alanPick.position = $Player2.position
		add_child(alanPick)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
