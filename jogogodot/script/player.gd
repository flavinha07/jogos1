extends Area2D

signal hit
const SPEED := 400
@onready var screen_size = get_viewport_rect().size
@onready var anima__o: AnimatedSprite2D = $"animação"
@onready var colis_o: CollisionShape2D = $"colisão"

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	if velocity.x != 0:
		anima__o.play("move")
	elif velocity.y > 0:
		anima__o.play("move_up")
	elif  velocity.y <0:
		anima__o.play("move_down")
	else : 
		anima__o.play("idle")
	
	anima__o.flip_h = true if velocity.x >0 else false
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(body):
	hide()
	hit.emit()
	colis_o.set_deferred("disabled", true)
	
	
func start_pos(pos):
	position = pos
	show()
	colis_o.disabled = false
	
