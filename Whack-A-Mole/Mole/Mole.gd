extends Node2D

var is_visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_mole()
	
func show_mole():
	$ColorRect.color = Color(1,0,0) # red
	is_visible = true
	
func hide_mole():
	$ColorRect.color = Color(1,1,1) # white
	is_visible = false

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and is_visible:
		if $CollisionShape2D.shape.point_is_inside(event.position):
			hide_mole()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
