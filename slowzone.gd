extends Area2D

@export var speed = 100
@export var left = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(120, 160)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if left:
		position.x -= speed * delta
	else:
		position.x += speed * delta
	if position.x <= 0:
		left = false
	if position.x >= 240:
		left = true

func _on_area_entered(area: Area2D) -> void:
	area.speed *= 0.25


func _on_area_exited(area: Area2D) -> void:
	area.speed /= 0.25
