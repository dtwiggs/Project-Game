extends Control


func _on_resume_button_pressed() -> void:
	Engine.time_scale = 1
	hide()

func _on_options_button_pressed() -> void:
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	get_tree().quit()
