extends Control


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_options_button_pressed() -> void:
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	get_tree().quit()
