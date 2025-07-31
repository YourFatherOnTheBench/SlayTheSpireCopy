extends Node

var CardsIDs = {1: preload("res://Scenes/Cards/Attack/attack_card.tscn"),
				2: preload("res://Scenes/Cards/Defense/defense_card.tscn")
				}


var deck = [1,1,1,1,1,2,2,2,2,2]
var DiscardPile = []
var Hand = []
var DrawPile = []
