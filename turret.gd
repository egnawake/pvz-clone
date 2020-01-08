extends Node2D

export var attack_rate = 1.0 # attacks per second
export var is_ranged = false

onready var attack_timer = $AttackTimer
onready var attack_ray = $AttackRay

func _ready():
    start_attack_timer()

func start_attack_timer():
    var attack_type = "ranged_attack" if is_ranged else "attack"
    attack_timer.wait_time = 1.0 / attack_rate
    attack_timer.connect("timeout", self, attack_type)
    attack_timer.start()

func attack():
    $Animator.play("attack")

func ranged_attack():
    if attack_ray.is_colliding():
        var enemy = attack_ray.get_collider().get_parent()
        if enemy.has_method('take_damage'):
            enemy.take_damage(5)
    