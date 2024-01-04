extends Node
@export var Sword_Ability: PackedScene
const MAX_RANGE = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(On_Timer_timeout)
	#when timer ran out run On_timer_timeout func

func On_Timer_timeout():
	var player = get_tree().get_first_node_in_group('player') as Node2D
	if player == null:
		return 
	
	var enemies = get_tree().get_nodes_in_group('enemy') 
	enemies = enemies.filter(func(enemy: Node2D): 
		return enemy.global_position.distance_squared_to(player.global_position) < pow(MAX_RANGE, 2) 
)
# this should make the sword spawn when the enemy is around certain distance from player

	enemies.sort_custom(func(a: Node2D, b: Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance
	)
	# this sort out first enemy in the array
	if enemies.size() == 0:
		return
	
	var sword_instance = Sword_Ability.instantiate() as Node2D
	player.get_parent().add_child(sword_instance)
	sword_instance.global_position = enemies[0].global_position
	# this will spawn the sword as the first enemy after sorted
