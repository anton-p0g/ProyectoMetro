extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var estaciones_origen = $listaEstaciones

	# Verifica que el nodo existe
	if estaciones_origen:
		estaciones_origen.add_item("Línea A")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Plaza de Mayo")
		estaciones_origen.add_item("Perú")
		estaciones_origen.add_item("Piedras")
		estaciones_origen.add_item("Lima")
		estaciones_origen.add_item("Saenz Peña")
		estaciones_origen.add_item("Congreso")
		estaciones_origen.add_item("Pasco")
		estaciones_origen.add_item("Alberti")

		estaciones_origen.add_item("Línea B")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Leandro N. Alem")
		estaciones_origen.add_item("Florida")
		estaciones_origen.add_item("Carlos Pellegrini")
		estaciones_origen.add_item("Uruguay")
		estaciones_origen.add_item("Callao")
		estaciones_origen.add_item("Pasteur")

		estaciones_origen.add_item("Línea C")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Constitución")
		estaciones_origen.add_item("San Juan")
		estaciones_origen.add_item("Independencia")
		estaciones_origen.add_item("Moreno")
		estaciones_origen.add_item("Avenida de Mayo")
		estaciones_origen.add_item("Diagonal Norte")
		estaciones_origen.add_item("Lavalle")
		estaciones_origen.add_item("San Martín")
		estaciones_origen.add_item("Retiro")

		estaciones_origen.add_item("Línea D")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Facultad de Medicina")
		estaciones_origen.add_item("Callao")
		estaciones_origen.add_item("Tribunales")
		estaciones_origen.add_item("9 de Julio")
		estaciones_origen.add_item("Catedral")

		estaciones_origen.add_item("Línea E")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Pichincha")
		estaciones_origen.add_item("Entre Ríos")
		estaciones_origen.add_item("San José")
		estaciones_origen.add_item("Independencia")
		estaciones_origen.add_item("Belgrano")
		estaciones_origen.add_item("Bolívar")
	else:
		print("Error: No se encontró el nodo EstacionesOrigen.")
