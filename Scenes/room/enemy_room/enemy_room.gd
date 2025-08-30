extends TextureButton


func _on_pressed() -> void:
	pass


func _on_mouse_entered() -> void:
	self_modulate = "#000000"


func _on_mouse_exited() -> void:
	self_modulate = "#ffffff"
