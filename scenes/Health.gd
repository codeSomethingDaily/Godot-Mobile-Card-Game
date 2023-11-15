extends Node2D

@export
var _max_health := 3
@export
var _cur_health := _max_health

var healths: Array[Sprite2D]


func update_max_health():
	pass

func take_damage():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(_max_health):
		var heart : Sprite2D= $HeartFull.duplicate()
		heart.visible = true
		heart.position.x = i *  heart.get_rect().size.x * heart.scale.x
		print(heart.position.x)

		add_child(heart)
#		heart.reparent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
