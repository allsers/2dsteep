extends TileMap

@onready var player = get_parent().get_node("Player")

var count = 0
var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var width = 128
var height = 128

func _ready() -> void:
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()

func _process(delta: float) -> void:
	generate_chunk(player.position)


func generate_chunk(pos):
	var tile_pos = local_to_map(position)

	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(tile_pos.x + x - width/2, tile_pos.y + y - height/2)*10
			var temp = temperature.get_noise_2d(tile_pos.x + x - width/2, tile_pos.y + y - height/2)*10
			var alt = altitude.get_noise_2d(tile_pos.x + x- width/2, tile_pos.y + y - height/2)*10
			if alt < 2:
				set_cell(0, Vector2i(tile_pos.x + x - width/2, tile_pos.y + y - height/2), 0, Vector2i(3, round(temp+10)/5))
			else:
				set_cell(0, Vector2i(tile_pos.x + x - width/2, tile_pos.y + y - height/2), 0, Vector2i(round(moist+10)/5, round(temp+10)/5))
			
