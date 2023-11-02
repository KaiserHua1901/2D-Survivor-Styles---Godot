extends CharacterBody2D

const MAX_SPEED = 400 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity = direction * MAX_SPEED 
	move_and_slide()
	
func get_movement_vector(): 
	
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	# this line of code is to to get 1 and -1, if move_right is press, it be 1 
	# if move_left is press, it be -1, because 0 - 1 = -1  
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	# Same thing with the code above this, only that -y is going up and +y is going down
	
	return Vector2(x_movement, y_movement)
	
