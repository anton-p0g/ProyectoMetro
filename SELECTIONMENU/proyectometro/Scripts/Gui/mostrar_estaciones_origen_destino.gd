
extends Node

@onready var button = $Button
@onready var target_nodes = [
	$"Mapa/conexiones/2652",
	$"Mapa/conexiones/2756",
	$"Mapa/conexiones/2862",
	$"Mapa/conexiones/2970",
	$"Mapa/conexiones/3080",
	$"Mapa/conexiones/158400",
	$"Mapa/conexiones/178200",
	$"Mapa/conexiones/101200",
	$"Mapa/conexiones/252000",
	$"Mapa/conexiones/67200",
	$"Mapa/conexiones/54000",
	$"Mapa/conexiones/49000",
	$"Mapa/conexiones/1722",
	$"Mapa/conexiones/1806",
	$"Mapa/conexiones/1892",
	$"Mapa/conexiones/1980",
	$"Mapa/conexiones/992",
	$"Mapa/conexiones/1057",
	$"Mapa/conexiones/1123",
	$"Mapa/conexiones/1190",
	$"Mapa/conexiones/1260",
	$"Mapa/conexiones/1332",
	$"Mapa/conexiones/1406",
	$"Mapa/conexiones/1482",
	$"Mapa/conexiones/462",
	$"Mapa/conexiones/650",
	$"Mapa/conexiones/600",
	$"Mapa/conexiones/552",
	$"Mapa/conexiones/506",
	$"Mapa/conexiones/240",
	$"Mapa/conexiones/306",
	$"Mapa/conexiones/272",
	$"Mapa/conexiones/210",
	$"Mapa/conexiones/182",
	$"Mapa/conexiones/156",
	$"Mapa/conexiones/132",
]

func _ready() -> void:
	$CalcularRuta.connect("pressed", Callable(self, "_button_combined"))

func on_calcular_ruta_button_pressed():
	var origen = $SeleccionarRuta/Origen/listaEstaciones
	var destino = $SeleccionarRuta/Destino/listaEstaciones
	
	var id_origen = origen.get_selected_id()
	var id_destino = destino.get_selected_id()
	
	var python_call = preload("res://Scripts/python_call.gd").new()
	python_call.run_python_script(id_origen, id_destino)
	
	
func _on_button_pressed():
	for node in target_nodes:
		if node:
			node.visible = false
		else:
			print("Node not found")
			
			
func _button_combined():
	_on_button_pressed()
	on_calcular_ruta_button_pressed()
