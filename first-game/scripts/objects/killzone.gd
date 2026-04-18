extends Area2D

@onready var death_menu = $"../../../CanvasLayers/Death Menu"

func _on_body_entered(_body: Node2D) -> void:
	death_menu.show()
