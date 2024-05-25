extends Area2D

@export var speed = 2000

func _ready():
	pass # Replace with function body.

func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation) * delta # que hace esto?
	
