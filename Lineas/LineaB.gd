# Crear linea B
extends Node

# Declaro Clase
class_name  LineaB

# Inicio Linea y Estacion
const Linea = preload("res://Lineas//LineaClass.gd")
const Estacion = preload("res://Lineas/EstacionClass.gd")



func _ready():
	var leandro_n_alem = Estacion.new("Leandro N. Alem", 31, [-34.6029894966332, -58.369929850122300], {}, {32: 1.0758}, false, 2)
	var florida = Estacion.new("Florida", 32, [-34.603297285577500, -58.375071518263500], {}, {31: 1.0758, 33: 1.180}, false, 4)
	var carlos_pellegrim = Estacion.new("Carlos Pellegrim", 33, [-34.6036371051817, -58.380714847140800], {"D": "(PlaceHolder ID 9 de Julio)"}, {32: 1.180, 34: 1.166, "(PlaceHolder ID 9 de Julio)": 2}, false, 2)
	var uruguay = Estacion.new("Uruguay", 34, [-34.6040935531057, -58.387296133540700], {}, {33: 1.166, 35: 1.254}, true, 2)
	var callao = Estacion.new("Callao", 35, [-34.604419542860700, -58.392314235088700], {}, {34: 1.254, 36:1.5}, true, 3)
	var pasteur = Estacion.new("Pasteur", 36, [-34.604642967919300, -58.399474256679], {}, {35: 1.5}, false, 4)


	var horario = {"Lunes": "5:00 - 22:49", "Martes":"5:00 - 22:49", "Miércoles": "5:00 - 22:49", "Jueves": "5:00 - 22:49", "Viernes": "5:00 - 22:49", "Sábado": "5:00 - 22:49", "Domingo": "8:00 - 22:25"}
	var frecuencia = {"5:00 - 22:49": 4, "5:00 - 22:49": 7, "8:00 - 22:25": 7}
	var linea_b = LineaClass.new("C", Color(1, 0, 0), horario, frecuencia)

	# Añadir estaciones a la linea
	linea_b.agregar_estacion(leandro_n_alem)
	linea_b.agregar_estacion(florida)
	linea_b.agregar_estacion(carlos_pellegrim)
	linea_b.agregar_estacion(uruguay)
	linea_b.agregar_estacion(callao)
	linea_b.agregar_estacion(pasteur)

	
