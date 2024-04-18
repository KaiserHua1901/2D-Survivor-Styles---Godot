extends Node
@export var mob_scene:PackedScene

@onready var mob_spawn_location = $MobPath/MobSpawnLocation
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	mob_spawn_location.progress_ratio = randf()
	
	mob.position = mob_spawn_location.position
	
	add_child(mob)
	
	
