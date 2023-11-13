extends Node2D

var mole_scene = preload("res://Mole/Mole.tscn")
var moles = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(5): # number of moles
		var mole = mole_scene.instantiate()
		mole.position = Vector2(randf_range(0, 800), randf_range(0, 600)) # Random position
		add_child(mole)
		moles.append(mole)
	
	$Timer.wait_time = 1.0 # Time between mole appearances
	$Timer.start()
	
func _on_Timer_timeout():
	for mole in moles:
		if mole.is_visible:
			pass# mole.hide_mole()
		else:
			mole.show_mole()
			
func _unhandled_input(event):
	if event is InputEventKey and event.pressed and event.scancode == KEY_SPACE:
		for mole in moles:
			if mole.isVisible and mole.global_position.distance_to(get_global_mouse_position()) < 50: # 50 is the radius of the mole
				mole.hide_mole()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
