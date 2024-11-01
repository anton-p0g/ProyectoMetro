# Linea.gd

extends Node 

# Defino la clase Linea que usaremos para construir las lineas de metro

class_name LineaClass

# Importamos la clase Estacion

const Estacion = preload("res://Lineas//EstacionClass.gd")  # Asegurate de que esta ruta sea correcta

var nombre: String
var color: Color
var estaciones: Dictionary
var horarios: Dictionary # Clave = Día semana Valor = Hora
var frecuencia: Dictionary # Clave = franja horaria : Valor = frecuencia en minutos

# Constructor de la clase
func _init(p_nombre: String, p_color: Color, p_horarios: Dictionary, p_frecuencia: Dictionary, p_estaciones: Dictionary = {}):
	self.nombre = p_nombre
	self.color = p_color
	self.horarios = p_horarios
	self.frecuencia = p_frecuencia
	self.estaciones = p_estaciones


# Metodo para agregar una estacion a la linea
func agregar_estacion(estacion: Estacion):
	self.estaciones[estacion.ID] = estacion


# Metodo para obtener una estacion por su ID
func obtener_estacion_ID(ID: String) -> Estacion:
	return self.estaciones[ID]


# Metodo para conectar dos estaciones
func conectar_estaciones(ID1: String, ID2: String, distancia: float):
	var estacion1 = obtener_estacion_ID(ID1)
	var estacion2 = obtener_estacion_ID(ID2)
	
	if estacion1 == null:
		print("Estación con ID %s no encontrada" % ID1)
		return
	
	if estacion2 == null:
		print("Estación con ID %s no encontrada" % ID2)
		return
		
	if !estacion1.adyacentes.has(estacion2.ID):
		estacion1.adyacentes[estacion2.ID] = distancia
		estacion2.adyacentes[estacion1.ID] = distancia
		print("Conectadas: %s y %s a una distancia de %s minutos." % [estacion1.nombre, estacion2.nombre, distancia])
	else:
		print("%s ya tiene a %s como adyacente." % [estacion1.nombre, estacion2.nombre])


# Metodo para mostrar todas las estaciones de una linea
func pretty_print():
	for estacion in estaciones:
		print("Estacion: ", estacion.nombre, " - ID: ", estacion.ID)
