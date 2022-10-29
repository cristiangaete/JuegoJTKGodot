extends Area2D
#signals
signal picked


var velocity = Vector2.ZERO
var speed = 350


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1 
	if velocity.length() > 0:
		velocity = velocity.normalized() * delta * speed
	position += velocity
	
	position.x = clamp(position.x, 0, 480)
	position.y = clamp(position.y, 0, 720)
	
	#MARGENES PARA QUE NO SALGA EL PERSONAJe
	#if position.x >= 480:
	#	position.x = 480
	#if position.x <= 0:
	#	position.x = 0
	#if position.y >= 720:
	#	position.y = 720
	#if position.y <= 0:
	#	position.y = 0
	


func _on_Player_area_entered(area):
	if area.is_in_group("gem"):
		if area.has_method("pickup"):
			area.pickup()
			emit_signal("picked")

func game_over():
	set_process(false)
	$AnimatedSprite.animation = "hurt"
			
			

	

