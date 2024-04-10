extends CharacterBody2D
@export var player_index = 0 
@onready var pata = $pata/CollisionShape2D
@onready var puno = $puno/CollisionShape2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
#creacion de señales segun accion
signal patada()
signal punetazo()
signal abajo()
signal arriba()
signal atras()
signal adelante()

#se crean señales el cual ocuparemos si este estan colicionando
signal patadaCuerpo()
signal punetazoCuerpo()

var playerControl = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	pata.disabled = true
	puno.disabled = true
	pass
	

func _physics_process(delta):
	if playerControl == 1:
		$Label.text = 'soy jugador 1 '
		if not is_on_floor():
			velocity.y += gravity * delta
		#Tracker de inputs y emicion de señales para ocuparlo en otro script 
		if Input.is_action_just_pressed("pata"):
			pata.disabled = false
			emit_signal('patada')
			await  get_tree().create_timer(0.5).timeout
			pata.disabled = true
			await  get_tree().create_timer(1).timeout
			
		if Input.is_action_just_pressed("puno"):
			emit_signal('punetazo')
			puno.disabled = false
			await  get_tree().create_timer(0.5).timeout
			puno.disabled = true
			await  get_tree().create_timer(1).timeout
			
		if Input.get_joy_axis(player_index,JOY_AXIS_LEFT_Y) and is_on_floor():
			velocity.y = JUMP_VELOCITY
			
		if Input.is_action_just_pressed("ui_up"):
			emit_signal("arriba")
			
		if Input.is_action_just_pressed("ui_left"):
			emit_signal("atras")
			
		if Input.is_action_just_pressed("ui_right"):
			emit_signal("adelante")
		if Input.is_action_just_pressed("ui_down"):
			emit_signal("abajo")
		var direction = Input.get_axis("ui_left","ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
	elif playerControl == 2 :
		$Label.text = 'soy jugador 2 '
		if not is_on_floor():
			velocity.y += gravity * delta
		#Tracker de inputs y emicion de señales para ocuparlo en otro script 
		if Input.is_action_just_pressed("pata"):
			pata.disabled = false
			emit_signal('patada')
			await  get_tree().create_timer(0.5).timeout
			pata.disabled = true
			await  get_tree().create_timer(1).timeout
			
		if Input.is_action_just_pressed("puno"):
			emit_signal('punetazo')
			puno.disabled = false
			await  get_tree().create_timer(0.5).timeout
			puno.disabled = true
			await  get_tree().create_timer(1).timeout
			
		if Input.get_joy_axis(player_index,JOY_AXIS_LEFT_Y) and is_on_floor():
			velocity.y = JUMP_VELOCITY
			
		if Input.is_action_just_pressed(""):
			emit_signal("arriba")
			
		if Input.is_action_just_pressed(""):
			emit_signal("atras")
			
		if Input.is_action_just_pressed(""):
			emit_signal("adelante")
		if Input.is_action_just_pressed(""):
			emit_signal("abajo")
		var direction = Input.get_axis("ui_left","ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()


func _on_pata_body_entered(body):
	if body.has_method("saco"):
		emit_signal("patadaCuerpo")
	pass # Replace with function body.


func _on_puno_body_entered(body):
	if body.has_method("saco"):
		emit_signal("punetazoCuerpo")
	pass # Replace with function body.


func _on_node_poder_1():
	print ("lanza poder 1")
	pass # Replace with function body.


func _on_controlador_controladoractivoplayer_1():
	playerControl = 1 
	pass # Replace with function body.


func _on_controlador_controladoractivoplayer_2():
	playerControl = 2
	pass # Replace with function body.
