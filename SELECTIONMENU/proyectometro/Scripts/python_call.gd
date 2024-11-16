extends Node

var DIR = OS.get_executable_path().get_base_dir()
var interpreter_path = DIR.path_join("Scripts/PythonFiles/venv/Scripts/python")
var script_path = DIR.path_join("Scripts/PythonFiles/backend.py")

func run_python_script(source_id, target_id):
	# var python_path = get_python_path()
	
	if !OS.has_feature("template"):
		print("B")
		interpreter_path = ProjectSettings.globalize_path("res://Scripts/PythonFiles/venv/Scripts/python")
		script_path = ProjectSettings.globalize_path("res://Scripts/PythonFiles/backend.py")
	
	var python_path = interpreter_path
	print(python_path)
	if python_path == "":
		print("Error: Unable to find Python executable.")
		return
		
	var output = []	
	#var python_file = ProjectSettings.globalize_path("res://Scripts/backend.py")
	var python_file = script_path
	var result = OS.execute(python_path, [python_file, str(source_id), str(target_id)], output, true, false)
	
	if result == 0:
		var parsedOutput = JSON.parse_string(output[0])
		
		GlobalData.path = parsedOutput["estaciones_path"]
		print(GlobalData.path)
		GlobalData.total_time = parsedOutput["time"]
		print(GlobalData.total_time)
		GlobalData.path_ids = parsedOutput["path_ids"]
		print(GlobalData.path_ids)
		
	else:
		print("Error running Python script:", result)
