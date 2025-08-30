extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.start_of_turn.connect(Turn_started)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("endturn"):
		endturn()


func Turn_started():
	$MarginContainer/Button.text = "EndTurn"

func _on_button_pressed() -> void:
	endturn()


func endturn():
	Globals.end_of_turn.emit()
	$MarginContainer/Button.text = "EnemyTurn"
