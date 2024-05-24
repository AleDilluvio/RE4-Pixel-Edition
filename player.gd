extends Area2D

@export var speed = 400 # Velocidad del jugador (pixels/seg).
var screen_size # Tamaño pantalla.

# Se llama cuando carga por primera vez.
func _ready():
	screen_size = get_viewport_rect().size


# Se llama en cada frame, delta es la velocidad de los frames.
func _process(delta):
	var velocity = Vector2.ZERO # Vector de jugador.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0 # Voltea la imagen si la vel es < 0.
