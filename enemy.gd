extends Node2D

export (float) var speed = 1.0
export var max_health = 25

const direction = Vector2(-1, 0) # left
var health = max_health
var can_move = true

func _ready():
    self.can_move = false
    $Hurtbox.connect("area_entered", self, "handle_area_entered")

func take_damage(amount):
    if self.health - amount <= 0:
        die()
    else:
        self.health -= amount

func die():
    self.queue_free()

func move(direction, speed):
    self.position += direction.normalized() * speed

func handle_area_entered(area):
    take_damage(5)
    print('Entered ', area)

func fix_hitbox_collision():
    self.position = self.position

func _process(delta):
    fix_hitbox_collision()
    if self.can_move:
        self.move(self.direction, self.speed * delta)
