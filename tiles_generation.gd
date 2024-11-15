extends TileMap

@onready var player = get_parent().get_node("Player")
var world_node: Node2D

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var width = 0
var height = 38
var blank_tiles = [Vector2i(1,4), Vector2i(2,4)]
var last_random_tile = 0
var styled_tiles = [Vector2i(0,0),Vector2i(0,1),Vector2i(0,2),Vector2i(0,3),Vector2i(0,4),Vector2i(0,5),Vector2i(0,6), Vector2i(1,0), Vector2i(1,1),Vector2i(1,2),Vector2i(1,3),Vector2i(1,5),Vector2i(1,6),Vector2i(2,0), Vector2i(2,1),Vector2i(2,2),Vector2i(2,3),Vector2i(2,5),Vector2i(2,6)]



func _ready() -> void:
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()
	world_node = get_parent()
	width = world_node.MAX_WIDTH



func _process(delta: float) -> void:
	generate_chunk(player.position)


func generate_chunk(pos):
	var tile_pos = local_to_map(pos)

	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(tile_pos.x + x - width/2, tile_pos.y + y - height/2)*10
			var temp = temperature.get_noise_2d(tile_pos.x + x - width/2, tile_pos.y + y - height/2)*10
			var alt = altitude.get_noise_2d(tile_pos.x + x- width/2, tile_pos.y + y - height/2)*10

			if get_cell_source_id(0, Vector2i(tile_pos.x + x - width/2, tile_pos.y + y - height/2), false) == -1:

				if (randi_range(0,14) == 10) or last_random_tile >= 18:
					set_cell(0, Vector2i(tile_pos.x + x - width/2, tile_pos.y + y - height/2), 0, styled_tiles.pick_random())
					last_random_tile = 0
				else:
					set_cell(0, Vector2i(tile_pos.x + x - width/2, tile_pos.y + y - height/2), 0, blank_tiles.pick_random())
					last_random_tile += 1
		
