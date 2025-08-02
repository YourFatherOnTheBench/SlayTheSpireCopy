extends CanvasLayer
@onready var discard_pile: Label = $ColorRect/DiscardPile
@onready var draw_pile: Label = $ColorRect2/DrawPile


func _ready() -> void:
	Globals.UpdateUI.connect(update)
	update()


func update():
	print("updated")
	var size =  Deck.DiscardPile.size()
	discard_pile.text = str(size)
	size = Deck.DrawPile.size()
	draw_pile.text = str(size)
