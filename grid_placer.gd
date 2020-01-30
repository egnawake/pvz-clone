extends TileMap

func tile_center_pos(tile_index):
    return map_to_world(tile_index) + cell_size/2
