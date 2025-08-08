extends Node
class_name Enemy



signal updateHP(value)

var maxHP: int
var HP: int:
	get:
		return HP
	set(value):
		HP = value
		$HP.text = str(value) + "/" + str(maxHP)
		
		
var Strentgh: int
var basic_attack: int
var block: int = 0:
	get:
		return block
	set(value):
		block = value
		$HP.text = str(value)
		if block <= 0:
			HP = HP

func gain_block(value: int):
	print("gain block")
	block += value


func Attack_player(value: int):
	print("attack player")
	Globals.PlayerAttacked.emit(value)
	

func gain_strentgh(value: int):
	print("gained strength")
	Strentgh += value
	basic_attack += Strentgh

func take_hit(dmg: int):
	var value = dmg
	if block > 0:
		dmg -= block
	block -= value
	if block <= 0:
		HP -= dmg
		if HP <= 0:
			print("Dead")
			Globals.EnemyDeafated.emit()
	
	
