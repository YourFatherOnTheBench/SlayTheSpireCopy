extends CanvasLayer

var can_end: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.start_of_turn.connect(Turn_started)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("endturn") and can_end:
		endturn()


func Turn_started():
	$MarginContainer/Button.text = "EndTurn"
	can_end = true

func _on_button_pressed() -> void:
	endturn()


func endturn():
	can_end = false
	Globals.end_of_turn.emit()
	$MarginContainer/Button.text = "EnemyTurn"
