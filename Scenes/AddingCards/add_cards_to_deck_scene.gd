extends CanvasLayer

var rng = RandomNumberGenerator.new()

@onready var btn1: TextureButton = $"MarginContainer/HBoxContainer/1"
@onready var btn2: TextureButton = $"MarginContainer/HBoxContainer/2"
@onready var btn3: TextureButton = $"MarginContainer/HBoxContainer/3"



func _ready() -> void:
	for id in range(1,4):
		var cards = Deck.CardsIDs.keys()
		print(cards)
		var index = rng.randi_range(0,cards.size() - 1)
		var cardid = cards[index]
		var card_scene = Deck.CardsIDs[cardid]
		var card = card_scene.instantiate()
		var button_path = "MarginContainer/HBoxContainer/%d" % id
		var button = get_node(button_path)
		
		button.texture_normal = card.texture
		button.pressed.connect(choosen_card.bind(cardid))
		button.mouse_entered.connect(hover_card.bind(button))
		button.mouse_exited.connect(unhover_card.bind(button))

	
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
