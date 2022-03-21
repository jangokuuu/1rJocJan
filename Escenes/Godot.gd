extends Area2D


export var velocitat := 3100
var direccio = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
#	rotation_degrees = 90
	position = Vector2(0,0)
#	scale = Vector2(1,1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direccio = Vector2.ZERO
	if Input.is_action_pressed('mou dreta'):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed('mou esquerra'):
		direccio += Vector2.LEFT
	if Input.is_action_pressed('mou abaix'):
		direccio += Vector2.DOWN
	if Input.is_action_pressed("mou adalt"):
		direccio += Vector2.UP
	position += direccio.normalized() * velocitat * delta


func _on_Personatge_area_entered(area :Area2D):
	print(area.name)
	if area.is_in_group('Final'):
		modulate = Color(1,0,0)
	elif area.is_in_group('Inici'):
		modulate = Color(0,1,0)
	
	$Godot.rotation_degrees = 180


func _on_Personatge_area_exited(area):
	modulate = Color(1,1,1)
	$Godot.rotation_degrees = 0
