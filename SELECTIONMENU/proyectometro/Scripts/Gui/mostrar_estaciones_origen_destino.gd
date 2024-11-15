extends Node

@onready var button = $Button
@onready var target_nodes = [
	$Mapa/lineaA/conexiones/LineaA,
	$Mapa/lineaA/conexiones/LineaA2,
	$Mapa/lineaA/conexiones/LineaA3,
	$Mapa/lineaA/conexiones/LineaA4,
	$Mapa/lineaA/conexiones/LineaA5,
	$Mapa/lineaA/conexiones/LineaA6,
	$Mapa/lineaA/conexiones/LineaA7,
	$Mapa/lineaA/conexiones/LineaA8,
	$Mapa/lineaA/conexiones/LineaA9,
	$Mapa/lineaA/conexiones/LineaA10,
	$Mapa/lineaA/conexiones/LineaA11,
	$Mapa/lineaB/conexiones/LineaB,
	$Mapa/lineaB/conexiones/LineaB2,
	$Mapa/lineaB/conexiones/LineaB3,
	$Mapa/lineaB/conexiones/LineaB4,
	$Mapa/lineaB/conexiones/LineaB5,
	$Mapa/lineaC/conexiones/LineaC,
	$Mapa/lineaC/conexiones/LineaC2,
	$Mapa/lineaC/conexiones/LineaC3,
	$Mapa/lineaC/conexiones/LineaC4,
	$Mapa/lineaC/conexiones/LineaC5,
	$Mapa/lineaC/conexiones/LineaC6,
	$Mapa/lineaC/conexiones/LineaC7,
	$Mapa/lineaC/conexiones/LineaC8,
	$Mapa/lineaC/conexiones/LineaC9,
	$Mapa/lineaC/conexiones/LineaC10,
	$Mapa/lineaC/conexiones/LineaC11,
	$Mapa/lineaC/conexiones/LineaC12,
	$Mapa/lineaC/conexiones/LineaC13,
	$Mapa/lineaC/conexiones/LineaC14,
	$Mapa/lineaD/conexiones/LineaD,
	$Mapa/lineaD/conexiones/LineaD2,
	$Mapa/lineaD/conexiones/LineaD3,
	$Mapa/lineaD/conexiones/LineaD4,
	$Mapa/lineaD/conexiones/LineaD5,
	$Mapa/lineaD/conexiones/LineaD6,
	$Mapa/lineaE/conexiones/LineaE,
	$Mapa/lineaE/conexiones/LineaE2,
	$Mapa/lineaE/conexiones/LineaE3,
	$Mapa/lineaE/conexiones/LineaE4,
	$Mapa/lineaE/conexiones/LineaE5,
	$Mapa/lineaE/conexiones/LineaE6,
	$Mapa/lineaE/conexiones/LineaE7,
	$Mapa/lineaE/conexiones/LineaE8
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
