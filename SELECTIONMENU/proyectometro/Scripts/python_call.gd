extends RefCounted

signal values_updated

func run_python_script(source_id, target_id):
	var output = []
	var python_file = ProjectSettings.globalize_path("res://Scripts/backend.py")
	var result = OS.execute("/opt/anaconda3/bin/python", [python_file, str(source_id), str(target_id)], output, true, false)
	
	if result == 0:
		var parsedOutput = JSON.parse_string(output[0])
		
		GlobalData.path = parsedOutput["estaciones_path"]
		GlobalData.total_time = parsedOutput["time"]
		GlobalData.path_ids = parsedOutput["path_ids"]
		
	else:
		print("Error running Python script:", result)
