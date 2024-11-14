extends Node

func _ready() -> void:
	$CalcularRuta.connect("pressed", Callable(self, "on_calcular_ruta_button_pressed"))

func on_calcular_ruta_button_pressed():
	var origen = $SeleccionarRuta/Origen/listaEstaciones
	var destino = $SeleccionarRuta/Destino/listaEstaciones
	
	var id_origen = origen.get_selected_id()
	var id_destino = destino.get_selected_id()
	
	var python_call = preload("res://Scripts/python_call.gd").new()
	python_call.run_python_script(id_origen, id_destino)
	
