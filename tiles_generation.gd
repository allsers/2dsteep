extends TileMap

@onready var player = get_parent().get_node("Player")

var background_tiles = null
var count = 0

func _ready() -> void:
	background_tiles = null #sett in tiles

func set_cell(tilemap, x, y, id):
	tilemap.set_cell(x, y, id, false, false, false, get_subtile_with_priority(id,tilemap))

func get_subtile_with_priority(id, tilemap: TileMap):
	var tiles = tilemap.tile_set
	var rect = tilemap.tile_set.tile_get_region(id)
	var size_x = rect.size.x / tiles.autotile_get_sized(id).x
	var size_y = rect.size.y / tiles.autotile_get_sized(id).y
	var tile_array = []
	for x in range(size_x):
		for y in range(size_y):
			var priority = tiles.autotile_get_subtile_priority(id, Vector2(x,y))
			for p in priority:
				tile_array.append(Vector2(x,y))
	return tile_array[randi() % tile_array.size()]

func generate_tile_boundary(pos):
	var boundaries = [pos]
	for x in 13:
		for y in 8:
			boundaries.append({
				"x": pos.x + x,
				"y": pos.y + y
			})
			boundaries.append({
				"x": pos.x - x,
				"y": pos.y - y
			})
			boundaries.append({
				"x": pos.x - x,
				"y": pos.y + y
			})
			boundaries.append({
				"x": pos.x + x,
				"y": pos.y - y
			})
	return boundaries

func draw_background_tiles():
	var player_position = background_tiles.world_to_map(player.position)
	var boundaries = generate_tile_boundary(player_position)
	
	for i in boundaries:
		var tile = background_tiles.get_cell(i.x, i.y)
		var has_tile = tile > -1
		if (!has_tile): set_cell(background_tiles, i.x, i.y, 0)
		
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count += 1
	if (count % 15 == 0):
		draw_background_tiles()
