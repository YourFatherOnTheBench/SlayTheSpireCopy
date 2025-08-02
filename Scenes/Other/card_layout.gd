extends Control

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.end_of_turn.connect(end_turn)
	Globals.start_of_turn.connect(draw_cards)
	
	
	
	Deck.DrawPile = Deck.deck
	Deck.DiscardPile = []
	Deck.Hand = []
	draw_cards()

		
	



func draw_cards():
	for Card in Globals.NumberOfCardsDraw:
		var id = Deck.DrawPile.pop_at(rng.randi_range(0,Deck.DrawPile.size()-1))
		Deck.Hand.append(id)
	for id in Deck.Hand:
		var card = Deck.CardsIDs[id].instantiate()
		$GCardHandLayout.add_child(card)



func _Used_Card(card: Control, index: int) -> void:
	if card.global_position.y < 430:
		var used_card = Deck.Hand.pop_at(index)
		Deck.DiscardPile.append(used_card)
		Globals.UsedCard.emit(used_card)
		print(used_card)
		print(Deck.DiscardPile)
		Globals.UpdateUI.emit()
		card.queue_free()
		
		
func end_turn():
	for id in Deck.Hand:
		var cardID = Deck.Hand.pop_back()
		Deck.DiscardPile.append(cardID)
	for child in $GCardHandLayout.get_children():
		child.queue_free()
	await get_tree().create_timer(1).timeout
		
	Globals.start_of_turn.emit()
