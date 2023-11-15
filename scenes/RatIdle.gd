extends Sprite2D

var time_passed: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	pass


func _on_timer_timeout():
	frame = (frame + 1) % 4
	pass # Replace with function body.
