extends Control

#actualizar el tiempo
func update_timer(new_val):
	$MarginContainer/LavelTimer.text = str(new_val)

#actualizar el score	
func update_score(new_val):
	$MarginContainer/LavelScore.text = str(new_val)
	
#actualiza el nivel
func update_level(new_val):
	$MarginContainer/LabelCountLevel.text = str(new_val)
