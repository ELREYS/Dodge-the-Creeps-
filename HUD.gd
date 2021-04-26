extends CanvasLayer

signal start_game

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer,"timeout")
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	#Make a onbe shot timer and wait for it to finish
	yield(get_tree().create_timer(1),"timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	
	


func _on_MessageTimer_timeout() -> void:
	$Message.hide()


func _on_StartButton_pressed() -> void:
	$StartButton.hide()
	emit_signal("start_game")
