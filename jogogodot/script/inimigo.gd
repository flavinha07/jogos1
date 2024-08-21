extends RigidBody2D

@onready var anim: AnimatedSprite2D = $anim

# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy_trypes = anim.sprite_frames.get_animation_names()
	anim.play(enemy_trypes[randi() % enemy_trypes.size()])
	print(enemy_trypes)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_screen_exited():
	queue_free()
