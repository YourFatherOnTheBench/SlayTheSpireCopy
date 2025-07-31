extends Node
class_name Enemy

var HP: int
var Strentgh: int
var basic_attack: int

func take_hit(dmg: int):
	HP -= dmg
	if HP < 0:
		print("Dead")
