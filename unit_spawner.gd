extends Node2D

func place_unit(packed_unit, position):
    var unit = packed_unit.instance()
    unit.position = position
    return unit
