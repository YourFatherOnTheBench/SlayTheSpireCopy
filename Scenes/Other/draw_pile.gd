extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var size =  Deck.DrawPile.size()
	$ColorRect/Label.text = str(size)
