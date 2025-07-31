extends CanvasLayer


func _ready() -> void:
	var size =  Deck.DiscardPile.size()
	$ColorRect/DiscardPile.text = str(size)
	size = Deck.DrawPile.size()
	$ColorRect2/DrawPile.text = str(size)
