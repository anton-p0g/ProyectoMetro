# Linea.gd

extends Node 

# Defino la clase Linea que usaremos para construir las lineas de metro

class_name LineaClass

var grafo: AStar2D
var nombre: String
var color: Color
var estaciones: Dictionary
#var horarios: Dictionary # Clave = Día semana Valor = Hora
#var frecuencia: Dictionary # Clave = franja horaria : Valor = frecuencia en minutos



# Constructor de la clase
func _init(nombre_linea: String):
	grafo = AStar2D.new()
	self.nombre = nombre_linea
	self.estaciones = {}


# Metodo para agregar una estacion a la linea
func agregar_estacion(estacion: EstacionClass):
	estaciones[estacion.ID] = estacion
	grafo.add_point(estacion.ID, Vector2(estacion.coordenadas[0], estacion.coordenadas[1]))


func conectar_estaciones(id1: int, id2: int, peso: float):
	grafo.connect_points(id1, id2, true)
