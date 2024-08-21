extends Node2D

@export var bug_scene: PackedScene
var score


func _ready():
	new_game()
	
func game_over() -> void:
	$BugTime.stop()
	$ScoreTime.stop()
	
func new_game():
	$StartTime.start()
	$player.start_pos($StartPosition.position)
	score = 0

func _on_score_time_timeout() -> void:
	score += 1


func _on_start_time_timeout() -> void:
	$BugTimer.start()
	$ScoreTime.start()
	
func _on_bug_time_timeout() -> void:
	var bug = bug_scene.instantiate()
	var bug_location = $BugPath/BugPathLocation
	bug_location.progress_ratio = randf()
	
	var direction = bug_location.rotation + PI / 2
	bug.position = bug_location.position
	direction += randf_range(-PI /4,PI /4)
	bug.rotation = direction
	
	var velocity = Vector2(randf_range(150.0,250.0),0.0)
	bug.linear_velocity = velocity.rotated(direction)
	add_child(bug)

	
