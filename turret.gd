extends Node2D

export var attack_rate = 1.0 # attacks per second

func _ready():
    setup()

func setup():
    $AttackTimer.wait_time = 1.0 / attack_rate
    $AttackTimer.connect("timeout", self, "attack")
    $Attack/EffectTimer.connect("timeout", self, "finish_attack")
    $AttackTimer.start()

func attack():
    $Attack/AttackHitbox.disabled = false
    $Attack/AttackEffect.visible = true
    $Attack/EffectTimer.start()

func finish_attack():
    $Attack/AttackHitbox.disabled = true
    $Attack/AttackEffect.visible = false