extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Personatge/AnimatedSprite.posicio_inici = Vector2(400,400)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
