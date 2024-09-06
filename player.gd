extends Area2D

@export var speed = 150
@export var cooldown = 0.25
var can_shoot = true
@export var bullet_scene : PackedScene
@onready var screensize = get_viewport_rect().size
@export var health = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = cooldown
	
func shoot():
	if not can_shoot:
		return
	can_shoot = false
	$Timer.start()
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.start(position + Vector2(0, -20))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		shoot()
	var input = Input.get_vector("left", "right", "up", "down")
	position += input * speed * delta
	if input.x > 0:
		$Sprite2D.frame = 2
		$AnimatedSprite2D.animation = "right"
	elif input.x < 0:
		$Sprite2D.frame = 0
		$AnimatedSprite2D.animation = "left"
	else:
		$Sprite2D.frame = 1
		$AnimatedSprite2D.animation = "forward"
	position = position.clamp(Vector2.ZERO, screensize)

func explode():
	queue_free()

func _on_timer_timeout() -> void:
	can_shoot = true
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		explode()
