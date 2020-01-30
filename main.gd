extends Node2D

const melee_turret = preload("res://melee_turret.tscn")
const ranged_turret = preload("res://ranged_turret.tscn")

onready var unit_spawner = get_node("UnitSpawner")
onready var grid_placer = get_node("GridPlacer")
onready var placement_highlight = get_node("PlacementHighlight")

var is_placing = false

func _unhandled_input(event):
    if event.is_action_pressed("ui_down"):
        is_placing = !is_placing
        var mouse_pos = get_viewport().get_mouse_position()
        var tile = grid_placer.world_to_map(mouse_pos)
        placement_highlight.position = grid_placer.tile_center_pos(tile)
        placement_highlight.visible = is_placing
    if event.is_action_pressed("ui_accept"):
        if is_placing:
            var where = placement_highlight.position
            var t = unit_spawner.place_unit(melee_turret, where)
            add_child(t)
    if event is InputEventMouseMotion:
        if is_placing:
            var tile = grid_placer.world_to_map(event.position)
            placement_highlight.position = grid_placer.tile_center_pos(tile)
