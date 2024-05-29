extends Node2D

var vida = 3
@export var speed = 200
var direction = 1
var can_attack = true

func _set_speed(value):
	speed = value

func _get_speed():
	return speed
	
func _get_position(property):
	return position

func _set_position(x,y):
	position.x = x
	position.y = y

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Acá seteo posicion random?


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
