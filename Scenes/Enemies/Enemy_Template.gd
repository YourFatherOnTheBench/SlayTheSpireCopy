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
var block: int = 0

func gain_block(value: int):
	block += value


func Attack_player(value: int):
	Globals.PlayerAttacked.emit(value)
	

func gain_strentgh(value: int):
	Strentgh += value
	basic_attack += Strentgh

func take_hit(dmg: int):
	HP -= dmg
	if HP < 0:
		print("Dead")
	
	
