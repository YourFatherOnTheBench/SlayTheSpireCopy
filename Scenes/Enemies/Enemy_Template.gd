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



func take_hit(dmg: int):
	HP -= dmg
	if HP < 0:
		print("Dead")
	
	
