extends Node2D


@export var health: int = 80
var block: int = 0
var strength: int = 0

func _ready() -> void:
	Globals.UsedCard.connect(CardPlayed)


func CardPlayed():
	pass
