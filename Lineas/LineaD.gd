# Crear linea D 

extends Node

class_name  LineaD

const Linea = preload("res://Lineas//LineaClass.gd")
const Estacion = preload("res://Lineas/EstacionClass.gd")

func _ready():
    var facultad_medicina = Estacion.new("Facultad de Medicina", 41, [-34.5997570807639, -58.3979237555734], {}, {42: 2}, true, 3 )
    var callao = Estacion.new("Callao", 42, [-34.604419542860700, -58.392314235088700], {},{41: 2, 43: 2}, true, 5)
    var tribunales = Estacion.new("Tribunales", 43, [-34.6015871651394, -58.385142358801200], {}, {42: 2, 44: 1.5}, true, 5)
    var 9_de_julio = Estacion.new("9 de Julio", 44, [-34.6042452029629, -58.3805743428896], {"B": 23, "C":"(PlaceHolder Diagonal Norte)"}, {43:1.5, 45: 2.5}, false, 2)
    var catedral = Estacion.new("Catedral", 45, [-34.6078023364289, -58.3739558069511], {"E": "(PlaceHolder Bolívar)"}, {45: 2.5}, true, 1) 

    var horario = {"Lunes": "5:00 - 22:51", "Martes":"5:00 - 22:51", "Miércoles": "5:00 - 22:51", "Jueves": "5:00 - 22:51", "Viernes": "5:00 - 22:51", "Sábado": "5:00 - 22:51", "Domingo": "8:00 - 22:28"}
    var frecuencia = {"5:00 - 22:51": 3, "5:00 - 22:51": 7, "8:00 - 22:28": 7}

    var linea_d = LineaClass.new("D", Color(0, 1, 0), horario, frecuencia)

    linea_d.agregar_estacion(facultad_medicina)
    linea_d.agregar_estacion(callao)
    linea_d.agregar_estacion(tribunales)
    linea_d.agregar_estacion(9_de_julio)
    linea_d.agregar_estacion(catedral)