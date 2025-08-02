extends Enemy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HP = 80
	maxHP = 80
	Strentgh = 0
	basic_attack = 8 + Strentgh
	$HP.text = str(HP) + "/" + str(maxHP)
	Globals.Attack_Enemy.connect(take_hit)
	


	
