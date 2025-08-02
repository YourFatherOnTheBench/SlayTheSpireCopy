extends Node2D


@export var health: int = 80:
	get:
		return health
	set(value):
		health = value
		$HP.text = str(health) + "/" + str(maxHealth)

@export var maxHealth: int = 80
var block: int = 0:
	get:
		return block
	set(value):
		block = value
		if block <= 0:
			health = health
		else:
			$HP.text = str(block)
var strength: int = 0
var dexterity: int = 0

func _ready() -> void:
	Globals.UsedCard.connect(CardPlayed)
	Globals.start_of_turn.connect(turn_started)


func CardPlayed(id: int):
	Cards(id)


func gainBlock(value: int):
	block += value
	print("blok is 6")
	
func gain_strength(value:int ):
	strength += value
	
func gain_dexterity(value: int):
	dexterity += value
	
func heal(value: int ):
	health += value
	if health > maxHealth:
		health = maxHealth
		
func turn_started():
	block = 0


func Cards(id:int):
	match id:
		1:
			var damage = 6 + strength
			Globals.Attack_Enemy.emit(damage)
		
		100:
			gainBlock(6)
	
