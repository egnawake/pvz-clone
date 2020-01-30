extends Node2D

export var duration = 0.5

onready var hitbox = $Area/Hitbox
onready var duration_timer = $DurationTimer

func _ready():
    duration_timer.wait_time = duration
    duration_timer.connect("timeout", self, "finish_attack")

func attack():
    hitbox.disabled = false
    duration_timer.start()
    
func finish_attack():
    hitbox.disabled = true
