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
		#await(get_tree().create_timer(0.01))
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("Ammo"): # Corregir.
		life_points -= 1
		position.x -= -10
