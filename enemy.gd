extends Area2D

@export var speed = 50

func _process(delta: float) -> void:
	position.y += speed * delta
	pass

func explode():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
