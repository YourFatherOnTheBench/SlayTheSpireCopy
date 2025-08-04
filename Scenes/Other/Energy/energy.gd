extends CanvasLayer

func _ready() -> void:
	update(-1)
	Globals.UsedCard.connect(update)
	Globals.start_of_turn.connect(start_of_turn)
	
	
	
func update(index: int):
	$CurrentEnergy.text = str(Globals.CurrentEnergy) + "/" + str(Globals.MaxEnergy)

func start_of_turn():
	Globals.CurrentEnergy = Globals.MaxEnergy
	update(-1)
