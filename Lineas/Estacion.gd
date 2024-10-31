# Estacion.gd

extends Node

# Defino la clase Estacion que usaremos para la clase Lineas

class_name Estacion

var nombre: String
var ID: String  # Formato: [Letra de linea]-[posicion en la linea]
var coordenadas: Dictionary # Clave = coordenada : Valor = valor de la coordenada
var conexiones: Dictionary # Clave = linea que conecta: Valor = estacion
var ascensores: bool
var horarios: Array
var frecuencia: Dictionary # Clave = franja horaria : Valor = frecuencia en minutos
var puertas: int

func _init(nombre: String, ID: String, coordenadas: Dictionary = {}, conexiones: Dictionary = {},
           ascensores: bool, horarios: Array = [], frecuencia: Dictionary = {}, puertas: int):
    
    self.nombre = nombre
    self.ID = ID
    self.coordenadas = coordenadas
    self.conexiones = conexiones
    self.ascensores = ascensores
    self.horarios = horarios
    self.frecuencia = frecuencia
    self.puertas = puertas
