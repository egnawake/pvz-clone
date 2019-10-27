extends Node2D

export var attack_rate = 1.0 # attacks per second

func _ready():
    setup()

func setup():
    $AttackTimer.wait_time = 1.0 / attack_rate
    $AttackTimer.connect("timeout", self, "attack")
    $AttackTimer.start()

func attack():
    $Animator.play("attack")
