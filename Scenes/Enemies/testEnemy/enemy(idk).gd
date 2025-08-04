extends Enemy

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HP = 80
	maxHP = 80
	Strentgh = 0
	basic_attack = 8 + Strentgh
	$HP.text = str(HP) + "/" + str(maxHP)
	Globals.Attack_Enemy.connect(take_hit)
	Globals.start_of_turn.connect(TurnStarted)


func TurnStarted():
	var choice = rng.randi_range(1, 3)
	match choice:
		1:
			Attack_player(basic_attack)
		2:
			gain_block(10)
		3:
			gain_strentgh(2)


	
