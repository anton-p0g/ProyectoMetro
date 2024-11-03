# Crear linea A
extends Node

# Importamos las clases EstacionClass y LineaClass
const EstacionClass = preload("res://EstacionClass.gd")
const LineaClass = preload("res://LineaClass.gd")

func _ready():
    # Creamos las estaciones de la Línea A
    # Todas las distancias están en minutos
    # El array de horarios se corresponde al horario del subte cada día de la semana
    # Las frecuencias se corresponden con el horario de apertura del subte (ejemplo: si abre de 05:30 a 22:53 la frecuencia es de 4 min)
    # En transbordos faltan los IDs de las estaciones, se completarán cuando sepa cuáles son esos IDs.
    var plaza_de_mayo = EstacionClass.new("Plaza de Mayo", 11, [-34.6088103091689, -58.3709684989674], {}, {12: 1}, true, 0)
    var peru = EstacionClass.new("Perú", 12, [-34.6085590738532, -58.3742677264304], {"D": "(ID de Catedral)", "E": "(ID de Bolívar)"}, {11: 1, 13: 1}, true, 2)
    var piedras = EstacionClass.new("Piedras", 13, [-34.608881721215, -58.3790851530908], {}, {12: 1, 14: 2}, {}, false, 1)
    var lima = EstacionClass.new("Lima", 14, [-34.6090998065519, -58.3822324010181], {"C": "(ID de Avda. de Mayo)"}, {13: 2, 15: 1}, false, 1)
    var saenz_pena = EstacionClass.new("Saenz Peña", 15, [-34.6094125865027, -58.3867771940873], {}, {14: 1, 16: 1}, false, 2)
    var congreso = EstacionClass.new("Congreso", 16, [-34.6092256843174, -58.3926688246648], {}, {15: 1, 17: 1}, true, 2)
    var pasco = EstacionClass.new("Pasco", 17, [-34.6096459617052, -58.3984269918123], {}, {16: 1, 18: 1}, false, 0)
    var alberti = EstacionClass.new("Alberti", 18, [-34.6098335784398, -58.401207534233], {}, {17: 1}, false, 0)
    
    # Creamos la línea A y asignamos el color
    horario = {"Lunes": "05:30 - 22:53", "Martes": "05:30 - 22:53", "Miércoles": "05:30 - 22:53", "Jueves": "05:30 - 22:53", "Viernes": "05:30 - 22:53", "Sábado": "06:00 - 23:27", "Domingo": "08:00 - 22:01"}
    frecuencias = {"dia habil": 4, "fin de semana": 6, "festivo": 7}
    var Linea_a = LineaClass.new("A", Color(0, 0.69, 0.87), horario, frecuencias)
    
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
    Linea_a.conectar_estaciones(11, 12, 1)
    Linea_a.conectar_estaciones(12, 13, 1)
    Linea_a.conectar_estaciones(13, 14, 2)
    Linea_a.conectar_estaciones(14, 15, 1)
    Linea_a.conectar_estaciones(15, 16, 1)
    Linea_a.conectar_estaciones(16, 17, 1)
    Linea_a.conectar_estaciones(17, 18, 1)
    
    # Mostramos la línea completa
    Linea_a.pretty_print()
