@tool
extends Enemy


var rng = RandomNumberGenerator.new()
var choice: int:
	get:
		return choice
	set(value):
		choice = value
		match choice:
			1:
				$turn.text = str(basic_attack) + " attack"
			2:
				$turn.text = "10 block"
			3:
				$turn.text = "1 Strength"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HP = 80
	maxHP = 80
	Strentgh = 0
	basic_attack = 8 + Strentgh
	$HP.text = str(HP) + "/" + str(maxHP)
	Globals.Attack_Enemy.connect(take_hit)
	Globals.end_of_turn.connect(EnemyTurn)
	Globals.start_of_turn.connect(PlayerTurn)
	PlayerTurn()


func EnemyTurn():
	block = 0
	
	match choice:
		1:
			Attack_player(basic_attack)
		2:
			gain_block(10)
		3:
			gain_strentgh(2)

func PlayerTurn():
	choice = rng.randi_range(1, 3)
	
