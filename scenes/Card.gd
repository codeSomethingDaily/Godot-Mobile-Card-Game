extends Area2D

var _is_hovering := false
var _is_dragging := false

@export
var curve2d := Curve2D.new()

var _target_position: Vector2
var _target_rotation_degrees: float


# Called when the node enters the scene tree for the first time.
func _ready():
	curve2d.point_count = 2
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseButton and _is_hovering:
		_is_dragging = true

	if event is InputEventMouseMotion and _is_dragging:
		var target :Vector2= event.position - $Line2D.global_position
		curve2d.set_point_position(0,$LineStartingPoint.position)
		curve2d.set_point_out(0,(target - $LineStartingPoint.position)* Vector2(1.5,0.5))
		curve2d.set_point_position(1,target)

		$Line2D.global_rotation = 0
		$Line2D.points = curve2d.get_baked_points()


func set_target_transfrom(position: Vector2, rotation_degrees: float, move: bool = false)->void:
	_target_position = position
	_target_rotation_degrees = rotation_degrees
	if move:
		var tween := create_tween()
		tween.set_parallel(true)
		tween.tween_property(self, "position",_target_position,0.15)
		tween.tween_property(self, "rotation_degrees",_target_rotation_degrees,0.15)

# Called every frame. 'delta' is the elapsed time since the previous frame.

var _is_last_hovering = false
func _process(delta):

	$Line2D.visible = _is_dragging
	if _is_last_hovering != _is_hovering:
		print(_is_hovering)
		_is_last_hovering = _is_hovering
		var tween := create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.set_parallel(true)
		if _is_hovering:
#			print("lol")
#			self.position = _target_position + Vector2(0,-10)
			tween.tween_property(self,"scale",Vector2(1.05,1.05),0.15)

#			var global_target_pos = _target_position + self.global_position

			tween.tween_property(self, "position",Vector2(_target_position.x,-95),0.15)
			tween.tween_property(self,"rotation_degrees",0,0.15)
#			scale = Vector2(1.1,1.1)
		else:
			tween.tween_property(self,"scale",Vector2.ONE,0.15)
			tween.tween_property(self, "position",_target_position,0.15)
			tween.tween_property(self, "rotation_degrees",_target_rotation_degrees,0.15)
			pass
#			tween.tween_property(self,"scale",Vector2(1.0,1.0),0.15)
#			tween.tween_property(self, "position",_target_position,0.15)


func _on_mouse_entered():
	_is_hovering = true


#	_is_hovering = true

	pass # Replace with function body.


func _on_mouse_exited():
	_is_hovering = false
#	_is_hovering = false
	pass # Replace with function body.
