extends Area2D

@export_enum("Cooldown","HitOnce","DisableHitBox") var HurtBoxType = 0
#

@onready var collision = $CollisionShape2D
@onready var disable_timer = $DisableTimer



