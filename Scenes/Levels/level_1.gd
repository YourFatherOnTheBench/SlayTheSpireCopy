extends Node2D

@onready var cards_scene = preload("res://Scenes/AddingCards/add_cards_to_deck_scene.tscn")

func _ready() -> void:
	Globals.EnemyDeafated.connect(enemyDeafated)

func enemyDeafated():
	var cards_add = cards_scene.instantiate()
	self.add_child(cards_add)
	
func _physics_process(delta: float) -> void:
	#print(Deck.deck)
	pass
	
