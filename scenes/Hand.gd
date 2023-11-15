extends Node2D


var cardScene:= preload("res://scenes/card.tscn")

@export
var spread_curve: Curve
@export
var height_curve: Curve
@export
var angle_curve: Curve

@export
var spread_scale: float = 500
@export
var height_scale: float = 100
@export
var angle_scale: float = 15

var cards: Array[Area2D]


func _addExampleCards():
	for i in range(5):
		var newCard:Area2D = cardScene.instantiate()
		self.add_child(newCard)
		cards.push_back(newCard)


func _reposition_cards():
	for card in cards:
		var pos = (card.get_index()+1.0) / (self.get_child_count() +1)
		var target_position = Vector2(spread_curve.sample(pos)* spread_scale,-height_curve.sample(pos) * height_scale )
		var rotation_degrees = angle_curve.sample(pos)* angle_scale
		card.set_target_transfrom(target_position,rotation_degrees,true)
#		card.position = Vector2(spread_curve.sample(pos)* spread_scale,-height_curve.sample(pos) * height_scale )
#		card.rotation_degrees = angle_curve.sample(pos)* angle_scale


# Called when the node enters the scene tree for the first time.
func _ready():
	_addExampleCards()
	_reposition_cards()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

