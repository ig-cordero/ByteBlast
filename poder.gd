extends StaticBody2D

var velocidad = 500
var impactado = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !impactado:
		global_position.x += velocidad * delta
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("saco"):
		impactado = true
		$Label.text = 'poder impactado'
		await get_tree().create_timer(1).timeout
		queue_free()
		
	pass # Replace with function body.

func poder():
	pass
