extends Control


var PositionOfUsedCard: float = 430
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.end_of_turn.connect(end_turn)
	Globals.start_of_turn.connect(draw_cards)
	Globals.DrawCard.connect(draw_cards)
	
	
	Deck.DrawPile = Deck.deck.duplicate()
	Deck.DiscardPile = []
	Deck.Hand = []
	draw_cards()
	print(Deck.DrawPile)
	
		
	






func draw_cards(number_of_cards:int = Globals.NumberOfCardsDraw):
	if Deck.DrawPile.size() < Globals.NumberOfCardsDraw:
		for card in Deck.DiscardPile:
			Deck.DrawPile.append(card)
		Deck.DiscardPile = []
		Deck.DrawPile.shuffle()
		
		
	
	var new_cards = []	
	for Card in number_of_cards:
		var id = Deck.DrawPile.pop_at(rng.randi_range(0,Deck.DrawPile.size()-1))
		Deck.Hand.append(id)
		new_cards.append(id)
	for id in new_cards:
		var card = Deck.CardsIDs[id].instantiate()
		$GCardHandLayout.add_child(card)
	Globals.UpdateUI.emit()


func _Used_Card(card: Control, index: int) -> void:
	var check_card = Deck.Hand[index]
	if card.global_position.y < PositionOfUsedCard and Globals.CurrentEnergy >= Deck.EnergyCosts[check_card]:
		var used_card = Deck.Hand.pop_at(index)
		Globals.CurrentEnergy -= Deck.EnergyCosts[check_card]
		Deck.DiscardPile.append(used_card)
		Globals.UsedCard.emit(used_card)
		
		print(used_card)
		print(Deck.DiscardPile)
		Globals.UpdateUI.emit()
		
		var global_pos = card.global_position   # Save current global position
		var parent = card.get_parent()
		
		parent.remove_child(card)
		get_tree().current_scene.add_child(card)

		card.global_position = global_pos  # Restore the visual position

		
		
		
		
		var tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property(card,"position", Vector2(850,410), 0.1)
		tween.tween_property(card, "modulate:a", 0, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property(card, "scale", Vector2(0,0), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		
		await tween.finished
		card.queue_free()
		
		
		
func end_turn():
	var length = Deck.Hand.size()
	for id in range(length):
		var cardID = Deck.Hand.pop_back()
		Deck.DiscardPile.append(cardID)
	for child in $GCardHandLayout.get_children():
		child.queue_free()
	await get_tree().create_timer(1).timeout
		
	Globals.start_of_turn.emit()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		var key_string = OS.get_keycode_string(event.keycode)
		if key_string.is_valid_int():
			var index = int(key_string) - 1
			if index >= 0 and index < $GCardHandLayout.get_child_count():
				$GCardHandLayout.hover_by_number = true
				$GCardHandLayout._set_hovered_index(index)
