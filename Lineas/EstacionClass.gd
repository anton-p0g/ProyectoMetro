# Estacion.gd

extends Node

# Defino la clase Estacion que usaremos para la clase Lineas

class_name Estacion

var nombre: String
var ID: String 
var coordenadas: Array  # Primera posicion lat, segunda long
var adyacentes: Dictionary # Clave = ID de estacion a la que conecta: Valor = distancia
var transbordos: Dictionary # Clave = Linea a la que conecta: Valor = ID de la estacion a la que conecta
var ascensores: bool
var horarios: Array
var frecuencia: Dictionary # Clave = franja horaria : Valor = frecuencia en minutos
var puertas: int

func _init(nombre: String, ID: String, coordenadas: Array = [], transbordos: Dictionary = {},
           adyacentes: Dictionary = {}, ascensores: bool = false, horarios: Array = [], frecuencia: Dictionary = {}, 
           puertas: int = 0):
    
    self.nombre = nombre
    self.ID = ID
    self.coordenadas = coordenadas
    self.transbordos = transbordos
    self.adyacentes = adyacentes
    self.ascensores = ascensores
    self.horarios = horarios
    self.frecuencia = frecuencia
    self.puertas = puertas
