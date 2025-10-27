extends Node2D
@onready var main = get_tree().get_root().get_node("GameLevel")
@onready var projectile = load("res://Level/projectile.tscn")

func _ready():
	shoot()

func _physics_process(delta):
	var num = randf_range(100,300)
	rotation_degrees += num * delta

func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	main.add_child.call_deferred(instance)

func _on_timer_timeout():
	shoot()
