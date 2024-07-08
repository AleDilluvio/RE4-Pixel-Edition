extends Area2D

@export var speed = 200
var direction = 1
var can_attack = true
var life_points = 6
var state_alert = false

func _ready():
	#$AnimatedSprite2D.play("walk")
	pass

func _process(delta):
	if life_points <= 0:
		# Falta animacion de muerte.
		#get_tree().create_timer(0.01).timeout
		#queue_free()
		pass
	
	_physics_process(delta)
	
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == 0:
		$AnimatedSprite2D.flip_h = true
	
	#$AnimatedSprite2D.flip_h = true # Ver como hacer para que mire hacia el personaje.
	var velocity = Vector2.ZERO
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

func _on_area_entered(area):
	if area.is_in_group("Ammo"): # Corregir.
		life_points -= 1
		# Falta animacion de recibir daño.
		position.x += 2.5 # Falta animacion de recibir daño.
		position.y -= 5
		await get_tree().create_timer(0.02).timeout
		position.x += 2.5
		position.y -= 5
		await get_tree().create_timer(0.05).timeout
		position.y += 5
		position.x += 2.5
		await get_tree().create_timer(0.02).timeout
		position.y += 5
		position.x += 2.5
		
func _physics_process(delta):
	if $Ray_Damage_Left.is_colliding() and $Ray_Damage_Left.get_collider(0).is_in_group("Ammo"):
		direction = 0
		
	if $Ray_Damage_Right.is_colliding() and $Ray_Damage_Right.get_collider(0).is_in_group("Ammo"):
		direction = 1
		position.x -= 5 # Falta animacion de recibir daño.
		position.y -= 10
		await get_tree().create_timer(0.1).timeout
		position.y += 10
		position.x -= 5
