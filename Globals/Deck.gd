extends Node

var CardsIDs = {1: preload("res://Scenes/Cards/Attack/attack_card.tscn"),
				100: preload("res://Scenes/Cards/Defense/defense_card.tscn"),
				101: preload("res://Scenes/Cards/Defense/draw_cards_card.tscn")
				}

var EnergyCosts = {1: 1, 100: 1, 101: 0} # id and then energy costs



var deck = [1,1,1,1,1,100,100,100,101,101]
var DiscardPile = []
	#get:
		#return DiscardPile
	#set(value):
		#DiscardPile = value
		#Globals.UpdateUI.emit()
var Hand = []
var DrawPile = []
	#get:
		#return DiscardPile
	#set(value):
		#DrawPile = value
		#Globals.UpdateUI.emit()
