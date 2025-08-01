extends Node

var CardsIDs = {1: preload("res://Scenes/Cards/Attack/attack_card.tscn"),
				100: preload("res://Scenes/Cards/Defense/defense_card.tscn")
				}


var deck = [1,1,1,1,1,100,100,100,100,100]
var DiscardPile = []
var Hand = []
var DrawPile = []
