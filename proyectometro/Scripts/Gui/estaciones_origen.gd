extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var estaciones_origen = $Origen/EstacionesOrigen

	# Verifica que el nodo existe
	if estaciones_origen:
		estaciones_origen.add_item("Línea A")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Opción A1")
		estaciones_origen.add_item("Opción A2")

		estaciones_origen.add_item("Línea B")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Opción B1")
		estaciones_origen.add_item("Opción B2")

		estaciones_origen.add_item("Línea C")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Opción C1")
		estaciones_origen.add_item("Opción C2")

		estaciones_origen.add_item("Línea D")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Opción D1")
		estaciones_origen.add_item("Opción D2")

		estaciones_origen.add_item("Línea E")
		estaciones_origen.set_item_disabled(estaciones_origen.get_item_count() - 1, true)
		estaciones_origen.add_item("Opción E1")
		estaciones_origen.add_item("Opción E2")
	else:
		print("Error: No se encontró el nodo EstacionesOrigen.")
