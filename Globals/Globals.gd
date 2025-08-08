extends Node


var NumberOfCardsDraw: int = 5
var CurrentEnergy: int = 3
var MaxEnergy: int = 3

signal start_of_turn
signal end_of_turn
signal UsedCard(CardId:int)
signal UpdateUI

signal EnemyDeafated
signal PlayerAttacked(damage: int)
signal Attack_Enemy(damage: int)


		
