# Estacion.gd

extends Node

# Defino la clase Estacion que usaremos para la clase Lineas

class_name EstacionClass

var nombre: String
var ID: String 
var coordenadas: Array  # Primera posicion lat, segunda long
var adyacentes: Dictionary # Clave = ID de estacion a la que conecta: Valor = distancia
var transbordos: Dictionary # Clave = Linea a la que conecta: Valor = ID de la estacion a la que conecta
var ascensores: bool
var horarios: Array
var frecuencia: Dictionary # Clave = franja horaria : Valor = frecuencia en minutos
var puertas: int

func _init(_nombre: String, _ID: String, _coordenadas: Array = [], _transbordos: Dictionary = {},
           _adyacentes: Dictionary = {}, _ascensores: bool = false, _horarios: Array = [], _frecuencia: Dictionary = {}, 
           _puertas: int = 0):
    
    self.nombre = _nombre
    self.ID = _ID
    self.coordenadas = _coordenadas
    self.transbordos = _transbordos
    self.adyacentes = _adyacentes
    self.ascensores = _ascensores
    self.horarios = _horarios
    self.frecuencia = _frecuencia
    self.puertas = _puertas
