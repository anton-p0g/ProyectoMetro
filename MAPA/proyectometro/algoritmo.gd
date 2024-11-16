# Crear linea A
extends Node

# Importamos las clases EstacionClass y LineaClass
const EstacionClass = preload("res://Scripts/Lineas/EstacionClass.gd")
const LineaClass = preload("res://Scripts/Lineas/LineaClass.gd")

func _ready():
	# Creamos las estaciones de la Línea A
	# Todas las distancias están en minutos
	# El array de horarios se corresponde al horario del subte cada día de la semana
	# Las frecuencias se corresponden con el horario de apertura del subte (ejemplo: si abre de 05:30 a 22:53 la frecuencia es de 4 min)
	# En transbordos faltan los IDs de las estaciones, se completarán cuando sepa cuáles son esos IDs.
	var plaza_de_mayo = EstacionClass.new("Plaza de Mayo", "PM", [-34.6088103091689, -58.3709684989674], {}, {"PE": 1}, true, 0)
	var peru = EstacionClass.new("Perú", "PE", [-34.6085590738532, -58.3742677264304], {"D": "(ID de Catedral)", "E": "(ID de Bolívar)"}, {"PM": 1, "PI": 1}, true, 2)
	var piedras = EstacionClass.new("Piedras", "PI", [-34.608881721215, -58.3790851530908], {}, {"PE": 1, "LI": 2}, false, 1)
	var lima = EstacionClass.new("Lima", "LI", [-34.6090998065519, -58.3822324010181], {"C": "(ID de Avda. de Mayo)"}, {"PI": 2, "SP": 1}, false, 1)
	var saenz_pena = EstacionClass.new("Saenz Peña", "SP", [-34.6094125865027, -58.3867771940873], {}, {"LI": 1, "CO": 1}, false, 2)
	var congreso = EstacionClass.new("Congreso", "CO", [-34.6092256843174, -58.3926688246648], {}, {"SP": 1, "PA": 1}, true, 2)
	var pasco = EstacionClass.new("Pasco", "PA", [-34.6096459617052, -58.3984269918123], {}, {"CO": 1, "AL": 1}, false, 0)
	var alberti = EstacionClass.new("Alberti", "AL", [-34.6098335784398, -58.401207534233], {}, {"PA": 1}, false, 0)
	
	# Creamos la línea A y asignamos el color
	var Linea_a = LineaClass.new("A", Color(0, 0.69, 0.87), {"Lunes": "05:30 - 22:53", "Martes": "05:30 - 22:53", "Miércoles": "05:30 - 22:53", "Jueves": "05:30 - 22:53", "Viernes": "05:30 - 22:53", "Sábado": "06:00 - 23:27", "Domingo": "08:00 - 22:01"}, {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7})
	
	# Agregamos las estaciones a la línea A
	Linea_a.agregar_estacion(plaza_de_mayo)
	Linea_a.agregar_estacion(peru)
	Linea_a.agregar_estacion(piedras)
	Linea_a.agregar_estacion(lima)
	Linea_a.agregar_estacion(saenz_pena)
	Linea_a.agregar_estacion(congreso)
	Linea_a.agregar_estacion(pasco)
	Linea_a.agregar_estacion(alberti)
	
	# Conectamos las estaciones de forma secuencial con distancias 
	Linea_a.conectar_estaciones("PM", "PE", 1)
	Linea_a.conectar_estaciones("PE", "PI", 1)
	Linea_a.conectar_estaciones("PI", "LI", 2)
	Linea_a.conectar_estaciones("LI", "SP", 1)
	Linea_a.conectar_estaciones("SP", "CO", 1)
	Linea_a.conectar_estaciones("CO", "PA", 1)
	Linea_a.conectar_estaciones("PA", "AL", 1)
	
	# Mostramos la línea completa
	Linea_a.pretty_print()
