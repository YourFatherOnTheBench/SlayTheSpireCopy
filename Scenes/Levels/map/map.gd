extends Control



const number_of_rooms: int = 5
const max_rooms_connected: int = 3
const min_rooms_connected: int = 1
var rng = RandomNumberGenerator.new()

var enemyroom_scene = preload("res://Scenes/room/enemy_room/enemy_room.tscn")
var explanation_mark_scene


var current_row: int = 1



var rooms = {1: enemyroom_scene}

var map = {}

func _ready() -> void:
	Globals.generateMap.connect(generate)
	if !Globals.MapGenereted:
		Globals.generateMap.emit()
		Globals.MapGenereted = true


func generate():
	for i in range(number_of_rooms):
		var enemy_room = enemyroom_scene.instantiate()
		enemy_room.global_position = $"RoomSpawningPoints/1".global_position + (i * Vector2(275,0))
		if i > 0:
			generate_lines(enemy_room.global_position - Vector2(275,0), enemy_room.global_position)
		$Rooms.add_child(enemy_room)
		
	
func generate_lines(pos_before: Vector2, current_pos: Vector2):
	var spacing := 30   # distance between dashes
	var dash_len := 15  # length of each dash (make this smaller!)
	var distance := current_pos - pos_before - Vector2(50,0)
	var num_lines := int(distance.x / spacing)

	for i in range(num_lines):
		var start_x := pos_before.x + i * spacing + 60
		var end_x := start_x + dash_len
		var y := pos_before.y + 25

		var line := Line2D.new()
		line.width = 7
		line.default_color = Color.BLACK
		line.add_point(Vector2(start_x, y))
		line.add_point(Vector2(end_x, y))
		$Lines.add_child(line)


	
