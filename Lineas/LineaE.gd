# Crear linea E
extends Node

# Declaro Clase
class_name LineaE

# Inicio Linea y Estacion
const Linea = preload("res://Lineas//LineaClass.gd")
const Estacion = preload("res://Lineas/EstacionClass.gd")



func _ready():
    var pichincha = Estacion.new("Pichincha", 51, [-34.62310987, -58.39706807], {}, {52: 1.6}, false, 2)
    var entre_rios = Estacion.new("Entre Rios", 52, [-34.62271967, -58.3915116999715], {}, {51: 1.6, 53: 1.33333}, false, 2)
    var san_jose = Estacion.new("San Jose", 53, [-34.62233949, -58.38514855], {}, {52: 1.33333, 54: 1.86667}, false, 2)
    var independencia = Estacion.new("Independencia", 54, [-34.61793739, -58.38153494], {"C": 18}, {53: 1.86667, 55: 1.86667} false, 3)
    var belgrano = Estacion.new("Belgrano", 55, [-34.61284911, -58.37758089], {}, {54: 1.86667, 56: 1.6}, false, 3)
    var bolivar = Estacion.new("Bolivar", 56, [-34.60924243, -58.37368422], {"D": 69}, {55: 1.6}, false, 5)


    var horario = {"Lunes": "5:30 - 22:50" , "Martes": "5:30 - 22:50" , "Miercoles": "5:30 - 22:50", "Jueves": "5:30 - 22:50",
                   "Viernes": "8:00 - 21:52", "Sabado": "8:00 - 21:52" , "Domingo": "8:00 - 21:52" }
    var frecuencia = {"dia habil": 7, "fin de semana": 9, "festivo": 9}
    var linea_e = LineaClass.new("C", Color(0.5, 0, 0.5), horario, frecuencia)

    # Agregar estaciones a la linea
    linea_e.agregar_estacion(pichincha)
    linea_e.agregar_estacion(entre_rios)
    linea_e.agregar_estacion(san_jose)
    linea_e.agregar_estacion(independencia)
    linea_e.agregar_estacion(belgrano)
    linea_e.agregar_estacion(bolivar)

    
    # Conectamos las estaciones
    linea_e.agregar_estacion(51, 52, 1.6)
    linea_e.agregar_estacion(52, 53, 1.33333)
    linea_e.agregar_estacion(53, 54, 1.86667)
    linea_e.agregar_estacion(54, 55, 1.8667)
    linea_e.agregar_estacion(55, 56, 1.6)
