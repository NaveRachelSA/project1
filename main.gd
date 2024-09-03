extends Node2D

var enemy = preload("res://enemy.tscn")
var slowzone = preload("res://slowzone.tscn")
var spawnable = true

func spawn_enemies():
	#if not spawnable:
	#	return
	#spawnable = false
	#$Timer.start()
	for x in 9:
		var e = enemy.instantiate()
		var pos = Vector2(x * (16 + 8) + 24, 0)
		add_child(e)
		e.position = pos
		

func spawn_slow(x, y):
	var s = slowzone.instantiate()
	var pos = Vector2(x, y)
	add_child(s)
	s.position = pos
			

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Timer.wait_time = 1
	spawn_slow(120, 100)
	spawn_slow(200, 200)
	
	
	
func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("enemies").size() == 0:
		spawn_enemies()

#func _on_timer_timeout() -> void:
#	spawnable = true
