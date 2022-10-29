extends Node2D


var level_count = 1
var level = 0
var time_left = 0
var score = 0
onready var GameOverTimer = Timer.new()

#importamo las gemas
export(PackedScene) var Gem

func _ready():
	OS.center_window()
	
	$HUD/GameOverLavel.visible = false
	#LLmanado al timerOver
	timer_settings()
	time_left = 20
	#Actualizar el HUD del tiempo
	$HUD.update_timer(time_left)
	#crea gemas aleatorias
	randomize()
	
	spawm_gems()
	
	
func timer_settings():
	GameOverTimer.wait_time = 2
	GameOverTimer.connect("timeout", self, "_onGameOverTimer_timeout")
	self.add_child(GameOverTimer)
	
func _onGameOverTimer_timeout():
	get_tree().change_scene("res://menu/Menu.tscn")
	
	
func _process(delta):
	#Se aumenta el nivel
	if $GemContainer.get_child_count() == 0:
		level += 1
		#se aumenta el tiempo
		time_left += 5
		spawm_gems()
		#Se aumenta el numero del nivel
		nivel()
		#emit_signal("levels")
		
		
			
	

func spawm_gems():
	for index in range(5 + level):
		var Gema = Gem.instance()
		Gema.position = Vector2(rand_range(0, 480), rand_range(0, 720))
		$GemContainer.add_child(Gema)



#Decrementar el tiempo
func _on_GameTimer_timeout():
	time_left -= 1
	$HUD.update_timer(time_left)
	if time_left <= 0:
		game_over()
	


func _on_Player_picked():
	score += 1
	$HUD.update_score(score)
	
func game_over():
	$GameTimer.stop()
	$HUD/GameOverLavel.visible = true
	$Player.game_over()
	GameOverTimer.start()
	


func _on_Main_levels():
	pass
	
func nivel():
	level_count += 1 
	$HUD.update_level(level_count)
