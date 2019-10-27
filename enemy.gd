extends Node2D

export var speed = 20;

func _process(delta):
    var direction = Vector2(-1, 0);
    position += direction * speed * delta;
