extends Area2D

@export var speed = 400 # Velocidad del jugador (pixels/seg).
var direction = 1 # Seteo en uno para que empiece disparando para la derecha.
var screen_size # Tamaño pantalla.
var can_fire = true
var bullet = preload("res://bullet.tscn")

func _get_position():
	return position

# Se llama cuando carga por primera vez.
func _ready():
	screen_size = get_viewport_rect().size

# Se llama en cada frame, delta es la velocidad de los frames.
func _process(delta):
	var velocity = Vector2.ZERO # Vector de jugador.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		direction = 1 # Disparo a la derecha.
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		direction = 0 # Disparo a la izquierda.
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
	
	#direction = Input.get_axis("ui_left", "ui_right") No me funcionó. Probar de nuevo.

func _physics_process(delta):
	if Input.is_action_just_pressed("fire") and can_fire:
		var bullet_instance = bullet.instantiate()
		if direction:
			bullet_instance._set_speed(abs(bullet_instance._get_speed()))
			bullet_instance._set_position(_get_position().x + 64, _get_position().y - 10) # Ver como poder obtener la ubicacion del arma, para no hardcodear.
		else:
			bullet_instance._set_speed(abs(bullet_instance._get_speed())*(-1))
			bullet_instance.get_child(0).flip_h = true
			bullet_instance._set_position(_get_position().x - 64,_get_position().y - 10) # Ver como poder obtener la ubicacion del arma, para no hardcodear.
		
		get_parent().add_child(bullet_instance)
		can_fire = false
		await(get_tree().create_timer(0.2))
		can_fire = true
