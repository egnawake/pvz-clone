extends TileMap

onready var highlight = get_node("Highlight")

var tile_index = Vector2(0, 0)

func _process(delta):
    pass
    
func _input(event):
    if event is InputEventMouseMotion:
        tile_index = world_to_map(event.position)
        highlight.position = get_placement_pos()
        
func get_placement_pos():
    return map_to_world(tile_index) + cell_size/2