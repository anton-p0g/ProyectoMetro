extends Node2D

var source_id = 11
var target_id = 17

func _ready():
	var output = []
	var python_file = "backend.py"
	var result = OS.execute("python", [python_file, str(source_id), str(target_id)], output, true, false)

	if result == 0:
		var parsedOutput = JSON.parse_string(output[0])
		print("Path: ", parsedOutput["estaciones_path"])
		print("Total time: ", parsedOutput["time"], " minutes")
		print("Path ids: ", parsedOutput["path_ids"])
	else:
		print("Error running Python script:", result)

