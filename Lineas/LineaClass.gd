# Linea.gd

extends Node 

# Defino la clase Linea que usaremos para construir las lineas de metro

class_name LineaClass

# Importamos la clase Estacion

const Estacion = preload("res://Lineas//EstacionClass.gd")  # Asegurate de que esta ruta sea correcta

var nombre: String
var color: Color
var estaciones: Array

# Constructor de la clase
func _init(_nombre: String, _color: Color, _estaciones: Array = []):
    self.nombre = _nombre
    self.color = _color
    self.estaciones = _estaciones


# Metodo para agregar una estacion a la linea
func agregar_estacion(estacion: Estacion):
    estaciones.append(estacion)


# Metodo para obtener una estacion por su ID
func obtener_estacion_ID(ID: String) -> Estacion:
    for estacion in estaciones:
        if estacion.ID == ID:
            return estacion
    return null


# Metodo para conectar dos estaciones
func conectar_estaciones(ID1: String, ID2: String, distancia: float):
    var estacion1 = obtener_estacion_ID(ID1)
    var estacion2 = obtener_estacion_ID(ID2)

    if estacion1 and estacion2:
        estacion1.adyacentes[estacion2.ID] = distancia
        estacion2.adyacentes[estacion1.ID] = distancia
    else:
        print("Error: Una o ambas estaciones no se encontraron")


# Metodo para mostrar todas las estaciones de una linea
func pretty_print():
    for estacion in estaciones:
        print("Estacion: ", estacion.nombre, " - ID: ", estacion.ID)
