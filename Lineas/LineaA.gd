# Crear linea A
extends Node

# Importamos las clases EstacionClass y LineaClass
const EstacionClass = preload("res://EstacionClass.gd")
const LineaClass = preload("res://LineaClass.gd")

func _ready():
    # Creamos las estaciones de la Línea A
    # Todas las distancias están en km
    # El array de horarios se corresponde al horario del subte cada día de la semana
    # Las frecuencias se corresponden con el horario de apertura del subte (ejemplo: si abre de 05:30 a 22:53 la frecuencia es de 4 min)
    var plaza_de_mayo = EstacionClass.new("Plaza de Mayo", "PM", [-58.3709684989674, -34.6088103091689], {"PE": 0.3}, {}, false, ["05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "06:00 - 23:27", "08:00 - 22:01"], {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7}, 1)
    var peru = EstacionClass.new("Perú", "PE", [-58.3742677264304,-34.6085590738532], {"PM": 0.3, "PI": 0.4}, {"D": "(ID de Catedral)", "E": "(ID de Bolívar)"}, false, ["05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "06:00 - 23:27", "08:00 - 22:01"], {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7}, 1)
    var piedras = EstacionClass.new("Piedras", "PI", [-58.3790851530908,-34.608881721215], {"PE": 0.4, "LI": 0.3}, {}, false, ["05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "06:00 - 23:27", "08:00 - 22:01"], {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7}, 1)
    var lima = EstacionClass.new("Lima", "LI", [-58.3822324010181,-34.6090998065519], {"PI": 0.3, "SP": 0.4}, {"C": "(ID de Avda. de Mayo)"}, false, ["05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "06:00 - 23:27", "08:00 - 22:01"], {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7}, 1)
    var saenz_pena = EstacionClass.new("Saenz Peña", "SP", [-58.3867771940873,-34.6094125865027], {"LI": 0.4, "CO": 0.6}, {}, false, ["05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "06:00 - 23:27", "08:00 - 22:01"], {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7}, 1)
    var congreso = EstacionClass.new("Congreso", "CO", [-58.3926688246648,-34.6092256843174], {"SP": 0.6, "PA": 0.5}, {}, false, ["05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "06:00 - 23:27", "08:00 - 22:01"], {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7}, 3)
    var pasco = EstacionClass.new("Pasco", "PA", [-58.3984269918123,-34.6096459617052], {"CO": 0.5, "AL": 0.2}, {}, false, ["05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "06:00 - 23:27", "08:00 - 22:01"], {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7}, 1)
    var alberti = EstacionClass.new("Alberti", "AL", [-58.401207534233,-34.6098335784398], {"PA": 0.2}, {}, false, ["05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "05:30 - 22:53", "06:00 - 23:27", "08:00 - 22:01"], {"05:30 - 22:53": 4, "06:00 - 23:27": 6, "08:00 - 22:01": 7}, 1)
    
    # Creamos la línea A y asignamos el color
    var Linea_a = LineaClass.new("Línea A", Color(0, 0.69, 0.87))
    
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
    Linea_a.conectar_estaciones("PM", "PE", 0.3)
    Linea_a.conectar_estaciones("PE", "PI", 0.4)
    Linea_a.conectar_estaciones("PI", "LI", 0.3)
    Linea_a.conectar_estaciones("LI", "SP", 0.4)
    Linea_a.conectar_estaciones("SP", "CO", 0.6)
    Linea_a.conectar_estaciones("CO", "PA", 0.5)
    Linea_a.conectar_estaciones("PA", "AL", 0.2)
    
    # Mostramos la línea completa
    Linea_a.pretty_print()
