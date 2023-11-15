@tool
extends Node2D

@export
var col_count :int = 5
@export
var row_count :int = 3
@export
var x_displacement :float = 30
@export
var y_displacement :float = 30

@export
var card_holders_container: Node2D

@export
var refresh = false : set = _on_refresh_pressed, get = dummy_getter

func dummy_getter():
	return false

func _on_refresh_pressed(l:bool):
	_refresh()

func _refresh():
	var children = card_holders_container.get_children()
	assert(children.size() == col_count * row_count)
	for j in range(row_count):
		for i in range(col_count):
			var holder:Node2D = children[j * col_count + i]
			holder.position = Vector2(i * x_displacement, j * y_displacement)

# Called when the node enters the scene tree for the first time.
func _ready():
	_refresh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
