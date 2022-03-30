extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500
var salts_disponibles = 2
var aigua = false

func _physics_process(delta):
	velocitat.x = 0
	if is_on_wall():
		velocitat += Vector2.UP * 40
	if salts_disponibles <= 0 and is_on_floor():
		salts_disponibles = 2
	if Input.is_action_pressed('mou dreta'):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed('mou esquerra'):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed('mou adalt') and salts_disponibles > 0:
		velocitat.y = 0
		velocitat += salt
		salts_disponibles -= 1
	if position.y >= 1000:
		position = Vector2(100,100)
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat,Vector2.UP)
	
	anima(velocitat)

func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	if velocitat.x > 0:
		animacio.flip_h = false
		if aigua:
			animacio.play('nedar')
		else:
			animacio.play('camina')
	elif velocitat.x < 0:
		animacio.flip_h = true
		if aigua:
			animacio.play('nedar')
		else:
			animacio.play('camina')
	if is_on_wall():
		animacio.play('escala')
		return
	if velocitat.y <-0.1:
		animacio.play('salta')
		return
		
	if abs(velocitat.x) < 0.1:
		animacio.play('quiet')
		

func tocat():
	position = Vector2(100,100)
		
func aigua():
	aigua = true

func fora_aigua():
	aigua = false

	
func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://mon2.tscn")
