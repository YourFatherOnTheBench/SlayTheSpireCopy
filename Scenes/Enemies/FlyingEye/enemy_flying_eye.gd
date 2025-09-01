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
				$turn.text = str(basic_attack) 
				$Icon.texture = load("res://Assets/UI/icons/swordicon.png")
			2:
				$turn.text = str(basic_block)
				$Icon.texture = load("res://Assets/UI/icons/blockicon.png")
			3:
				$Icon.texture = load("res://Assets/UI/icons/buff.png")
				$turn.text = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HP = maxHP
	basic_attack += Strentgh
	$HP.text = str(HP) + "/" + str(maxHP)
	Globals.Attack_Enemy.connect(take_hit)
	Globals.end_of_turn.connect(EnemyTurn)
	Globals.start_of_turn.connect(PlayerTurn)
	PlayerTurn()


func EnemyTurn():
	block = 0
	
	match choice:
		1:
			
			$AnimatedSprite2D.play("attack")
			await $AnimatedSprite2D.animation_finished
			$AnimatedSprite2D.play("idle")
			Attack_player(basic_attack)
		2:
			gain_block(10)
		3:
			gain_strentgh(2)

func PlayerTurn():
	choice = rng.randi_range(1, 3)
	
