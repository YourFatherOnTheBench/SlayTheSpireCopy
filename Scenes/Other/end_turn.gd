extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.start_of_turn.connect(Turn_started)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func Turn_started():
	$MarginContainer/Button.text = "EndTurn"

func _on_button_pressed() -> void:
	Globals.end_of_turn.emit()
	$MarginContainer/Button.text = "EnemyTurn"
