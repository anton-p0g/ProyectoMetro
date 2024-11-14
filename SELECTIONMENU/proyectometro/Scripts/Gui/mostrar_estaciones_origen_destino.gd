extends Node

func _ready() -> void:
	$CalcularRuta.connect("pressed", Callable(self, "on_calcular_ruta_button_pressed"))

func on_calcular_ruta_button_pressed():
	var origen = $SeleccionarRuta/Origen/listaEstaciones
	var destino = $SeleccionarRuta/Destino/listaEstaciones
	
	var id_origen = origen.get_selected_id()
	var id_destino = destino.get_selected_id()
	
	print("ID de la estacion de origen selecccionada: ", id_origen)
	print("ID de la estación de destino seleccionada: ", id_destino)
	print([id_origen, id_destino])
