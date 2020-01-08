extends Node2D

export var attack_rate = 1.0 # attacks per second

onready var attack_timer = get_node("AttackTimer")
onready var attack_node = get_node("Attack")
onready var animator = get_node("AnimationPlayer")

func _ready():
    start_attack_timer()

func start_attack_timer():
    attack_timer.wait_time = 1.0 / attack_rate
    attack_timer.connect("timeout", self, "attack")
    attack_timer.start()

func attack():
    attack_node.attack()
    animator.play("attack")
