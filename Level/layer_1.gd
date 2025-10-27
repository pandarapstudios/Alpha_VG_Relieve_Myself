extends TileMapLayer
@onready var player = get_parent().get_node("/root/GameLevel/CharacterBody2D") # Adjust the path as needed
var last_tile_coords = Vector2i(-1, -1)
var new_source_id = 0       # The source ID of your new tile
var new_atlas_coords = Vector2i(2, 3) # The atlas coordinates of your new tile
var old_source_id = 0       # The source ID of the old tile
var old_atlas_coords = Vector2i(3, 1) # The atlas coordinates of the old tile
var tilemap_layer = 1
var counter = 0;

func _physics_process(_delta):
	var current_tile_coords = local_to_map(to_local(player.global_position))
	
	# Check if the player has moved to a new tile
	if Input.get_action_strength("shift"):
		
		# Change the old tile back to its original state
		#set_cell(last_tile_coords, old_source_id, old_atlas_coords)
		
		if(get_cell_atlas_coords(current_tile_coords)!= new_atlas_coords):
			set_cell(current_tile_coords, new_source_id, new_atlas_coords);
			counter+=1
			print(counter)
		# Update the last tile position
		#last_tile_coords = current_tile_coords
	if(counter == 120):
		$"../../GameOver2".game_over()
	 
