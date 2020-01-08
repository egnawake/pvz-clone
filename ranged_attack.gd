extends Node2D

export var reach = 100
export var damage = 5

onready var ray = $Ray

func _ready():
    ray.cast_to = Vector2(reach, 0)
    
func attack():
    if ray.is_colliding():
        var ent = ray.get_collider().get_parent()
        if ent.has_method("take_damage"):
            ent.take_damage(damage)
    