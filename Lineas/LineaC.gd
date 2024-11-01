# Crear linea C
extends Node

# Declaro Clase
class_name  LineaC

# Inicio Linea y Estacion
const Linea = preload("res://Lineas//LineaClass.gd")
const Estacion = preload("res://Lineas/EstacionClass.gd")



func _ready():
	var constitucion = Estacion.new("Constitución", "Co", [-34.6276194522548, -58.381434433934295], {}, {"SJ": 1}, true, 2)
	var san_juan = Estacion.new("San Juan", "SJ", [-34.6219167322081, -58.3799211788651], {}, {"Co": 1, "Ind1": 1}, false, 2)
	var independencia = Estacion.new("Independencia", "Ind1", [-34.6181255992933, -58.380173610475204], {"E": "(PlaceHolder ID Independencia 2)"}, {"SJ": 1, "Mor":1}, false, 2)
	var moreno = Estacion.new("Moreno", "Mor", [-34.6126172798037, -58.38044446966], {}, {"Ind1": 1, "AdM": 1}, false, 2)
	var avenida_de_mayo = Estacion.new("Avenida de Mayo", "AdM", [-34.6089833148827, -58.3806107179579], {"A": "LI"}, {"Mo": 1, "DN":1}, false, 3)
	var diagonal_norte = Estacion.new("Diagonal Norte", "DN", [-34.604843739913996, -58.3795299800739], {"D": "(PLACEHOLDER ID 9 de Julio)"}, {"AdM": 1, "Lav": 1}, false, 4)
	var lavalle = Estacion.new("Lavalle", "Lav", [-34.601769923011396, -58.3781557828244], {}, {"DN": 1, "GSM": 1}, false, 4)
	var general_san_martin = Estacion.new("San Martín", "GSM", [-34.5950574047792, -58.3778190509867], {}, {"Lav": 1, "Ret":1}, false, 3)
	var retiro = Estacion.new("Retiro", "Ret", [-34.5911938083332, -58.3740182164816], {}, {"GSM": 1}, false, 2)

	var horario = {"Lunes": "5:00 - 22:47", "Martes":"5:00 - 22:47", "Miércoles": "5:00 - 22:47", "Jueves": "5:00 - 22:47", "Viernes": "5:00 - 22:47", "Sábado": "5:00 - 22:47", "Domingo": "8:00 - 22:23"}
	var frecuencia = {"5:00 - 22:47": 4, "8:00 - 22:23": 7}
	var linea_c = LineaClass.new("C", Color(0, 0.41, 0.68), horario, frecuencia)

	# Añadir estaciones a la linea
	linea_c.agregar_estacion(constitucion)
	linea_c.agregar_estacion(san_juan)
	linea_c.agregar_estacion(independencia)
	linea_c.agregar_estacion(moreno)
	linea_c.agregar_estacion(avenida_de_mayo)
	linea_c.agregar_estacion(diagonal_norte)
	linea_c.agregar_estacion(lavalle)
	linea_c.agregar_estacion(general_san_martin)
	linea_c.agregar_estacion(retiro)

	linea_c.conectar_estaciones(moreno.ID, retiro.ID, 1)


	
