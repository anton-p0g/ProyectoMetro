extends Node2D 

@onready var button = $Button
@onready var target_nodes = [
	$"lineaA/conexiones/132",
	$"lineaA/conexiones/132/13201",
	$"lineaA/conexiones/132/13202",
	$"lineaA/conexiones/132/13203",
	$"lineaA/conexiones/156",
	$"lineaA/conexiones/156/LineaA8",
	$"lineaA/conexiones/182",
	$"lineaA/conexiones/182/LineaA7",
	$"lineaA/conexiones/210",
	$"lineaA/conexiones/210/LineaA6",
	$"lineaA/conexiones/240",
	$"lineaA/conexiones/240/24001",
	$"lineaA/conexiones/240/24002",
	$"lineaA/conexiones/240/24003",
	$"lineaA/conexiones/272",
	$"lineaA/conexiones/272/2720",
	$"lineaA/conexiones/306",
	$"lineaA/conexiones/306/306",
	$"lineaB/conexiones/462",
	$"lineaB/conexiones/462/462",
	$"lineaB/conexiones/506",
	$"lineaB/conexiones/506/506",
	$"lineaB/conexiones/552",
	$"lineaB/conexiones/552/552",
	$"lineaB/conexiones/600",
	$"lineaB/conexiones/600/600",
	$"lineaB/conexiones/650",
	$"lineaB/conexiones/650/650",
	$"lineaC/conexiones/1122",
	$"lineaC/conexiones/1122/11221",
	$"lineaC/conexiones/1122/11222",
	$"lineaC/conexiones/1122/11223",
	$"lineaC/conexiones/1190",
	$"lineaC/conexiones/1190/1190",
	$"lineaC/conexiones/1260",
	$"lineaC/conexiones/1260/12601",
	$"lineaC/conexiones/1322",
	$"lineaC/conexiones/1322/13221",
	$"lineaC/conexiones/1406",
	$"lineaC/conexiones/1406/14061",
	$"lineaC/conexiones/1406/14062",
	$"lineaC/conexiones/1406/14063",
	$lineaC/conexiones/LineaC,
	$lineaC/conexiones/LineaC2,
	$lineaC/conexiones/LineaC3,
	$lineaC/conexiones/LineaC4,
	$lineaC/conexiones/LineaC5,
	$lineaD/conexiones/LineaD,
	$lineaD/conexiones/LineaD2,
	$lineaD/conexiones/LineaD3,
	$lineaD/conexiones/LineaD4, 
	$lineaD/conexiones/LineaD5, 
	$lineaD/conexiones/LineaD6, 
	$lineaE/conexiones/LineaE, 
	$lineaE/conexiones/LineaE2, 
	$lineaE/conexiones/LineaE3,
	$lineaE/conexiones/LineaE4,
	$lineaE/conexiones/LineaE5, 
	$lineaE/conexiones/LineaE6, 
	$lineaE/conexiones/LineaE7, 
	$lineaE/conexiones/LineaE8
]

func _ready():
	button.connect("pressed", Callable(self, "_on_button_pressed"))
	
func _on_button_pressed():
	for node in target_nodes:
		if node:
			node.visible = false
		else:
			print("Node not found")