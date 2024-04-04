extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta



func saco():
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("poder"):
		get_tree().quit()
		$Label.text ='Impactado popr poder 1'
	pass # Replace with function body.
