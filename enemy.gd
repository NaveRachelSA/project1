extends Area2D

@export var speed = 50

@export var cooldown = 1

@export var bullet_scene : PackedScene

func shoot():
	$Timer.start()
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.start(position + Vector2(0, 20))
	b.speed = 250

func _ready() -> void:
	$Timer.wait_time = cooldown
	$Timer.start()

func _process(delta: float) -> void:
	position.y += speed * delta

func explode():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
  

func _on_timer_timeout() -> void:
	shoot()
