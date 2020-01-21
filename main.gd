extends Node2D

const melee_turret = preload("res://melee_turret.tscn")
const ranged_turret = preload("res://ranged_turret.tscn")

onready var unit_spawner = get_node("UnitSpawner")
onready var grid_placer = get_node("GridPlacer")

func _unhandled_input(event):
    if event.is_action_pressed("ui_accept"):
        var where = grid_placer.get_placement_pos()
        var t = unit_spawner.place_unit(melee_turret, where)
        add_child(t)