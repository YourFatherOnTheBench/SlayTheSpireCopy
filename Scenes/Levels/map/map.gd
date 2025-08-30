extends Control



const number_of_rooms: int = 10
const max_rooms_connected: int = 3
const min_rooms_connected: int = 1
var rng = RandomNumberGenerator.new()

var enemyroom_scene = preload("res://Scenes/room/enemy_room/enemy_room.tscn")
var explanation_mark_scene


var current_row: int = 0



var rooms = {1: enemyroom_scene}

var map = {}







func generete():
	pass
	
