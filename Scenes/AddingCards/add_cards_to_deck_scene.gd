extends CanvasLayer

var rng = RandomNumberGenerator.new()


@onready var container: HBoxContainer = $MarginContainer/HBoxContainer


func _ready() -> void:
	for id in range(1,4):
		var cards = Deck.CardsIDs.keys()
		print(cards)
		var index = rng.randi_range(0,cards.size() - 1)
		var cardid = cards[index]
		var card_scene = Deck.CardsIDs[cardid]
		var card = card_scene.instantiate()
		container.add_child(card)
		var button = Button.new()
		card.add_child(button)
		button.global_position = card.global_position
		button.size = card.size
		button.flat = true
		button.pressed.connect(choosen_card.bind(cardid))
		button.mouse_entered.connect(hover_card.bind(card))
		button.mouse_exited.connect(unhover_card.bind(card))

	
func choosen_card(index: int):
	print("you choose card with id:", index)
	Deck.deck.append(index)
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")

func hover_card(card):
	#var tween = get_tree().create_tween()
	card.scale *= 1.05
	print("hovering card: ", card)
	
	
func unhover_card(card):
	card.scale *= 0.95
	print("unhovering card:", card)
