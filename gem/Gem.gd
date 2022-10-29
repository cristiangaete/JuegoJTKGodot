extends Area2D
#Recoge las gemas
func pickup():
	call_deferred("queue_free")
	queue_free()

