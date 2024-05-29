extends Area2D

@export var speed = 1500

func _set_speed(value):
	speed = value

func _get_speed():
	return speed
	
func _get_position():
	return position

func _set_position(x,y):
	position.x = x
	position.y = y

func _ready():
	pass # Replace with function body.

func _process(delta):
	position += (Vector2.RIGHT*speed) * delta # No estoy seguro de q esto funcione.

func _physics_process(_delta):
	await(get_tree().create_timer(0.01))
	set_physics_process(false)

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free() # La bala desaparece si abandona la pantalla.

func _on_body_entered(_body):
	queue_free() # La bala desaparece si le pega un Nodo2D.

func _on_area_entered(area):
	if not area.is_in_group("Player"): # No me dejaba correr y disparar al mismo tiempo sin esto.
		queue_free()
