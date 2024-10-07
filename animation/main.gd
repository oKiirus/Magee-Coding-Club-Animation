extends Node2D

@onready var timer = %SpawnBall
@onready var balls = %Balls 
var image = preload("res://godot_sprite.tscn")
var preloadBall = preload("res://ball.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(timer.time_left)
	if timer.time_left == 0:
		var ball = preloadBall.instantiate()
		ball.position = Vector2(randf() * 1920, -400)
		balls.add_child(ball)
		timer.start()
	
	for ball in balls.get_children():
		if ball.position.y > 2000:
			balls.remove_child(ball)

