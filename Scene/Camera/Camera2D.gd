extends Camera2D
var target_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_tree().get_first_node_in_group("player") as Node2D
	#global_position = player.global_position
	global_position = player.global_position.lerp(target_position, 1.0 - exp(-delta * 15))
	print(global_position)
	#Target_player_node()
	#global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 10))
#func Target_player_node():
	#var player_node = get_tree().get_nodes_in_group("player")
	#if player_node.size() > 0:
		#var player = player_node[0] as Node2D
		#global_position = player.global_position

