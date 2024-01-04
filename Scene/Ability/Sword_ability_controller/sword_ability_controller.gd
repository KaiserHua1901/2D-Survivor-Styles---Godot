extends Node
@export var Sword_Ability: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(On_Timer_timeout)
	#when timer ran out run On_timer_timeout func

func On_Timer_timeout():
	var player = get_tree().get_first_node_in_group('player') as Node2D
	if player == null:
		return
	var sword_instantiate = Sword_Ability.instantiate() as Node2D
	player.get_parent().add_child(sword_instantiate)
	# add sword_ability as a instance and add as a child of main node
	
	sword_instantiate.global_position = player.global_position
	# this will appear in player postion when timer ran out 
