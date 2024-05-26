extends Area2D

@export var speed = 1500

func _ready():
	pass # Replace with function body.

func _process(delta):
	position += (Vector2.RIGHT*speed) * delta # no estoy seguro de q esto funcione
	
func _physics_process(delta):
	await(get_tree().create_timer(0.01))
	set_physics_process(false)


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free() # La bala desaparece si abandona la pantalla.

func _on_body_entered(_body):
	queue_free() # La bala desaparece si le pega a alguien.
