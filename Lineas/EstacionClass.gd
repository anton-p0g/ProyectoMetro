# Estacion.gd

extends Node

# Defino la clase Estacion que usaremos para la clase Lineas

class_name EstacionClass

var nombre: String
var ID: String 
var coordenadas: Array  # Primera posicion lat, segunda long
var transbordos: Dictionary # Clave = Linea a la que conecta: Valor = ID de la estacion a la que conecta
var adyacentes: Dictionary # Clave = ID de estacion a la que conecta: Valor = distancia
var ascensores: bool
var puertas: int

func _init(p_nombre: String, p_ID: String, p_coordenadas: Array = [], p_transbordos: Dictionary = {},
           p_adyacentes: Dictionary = {}, p_ascensores: bool = false, p_puertas: int = 0):
    
    self.nombre = p_nombre
    self.ID = p_ID
    self.coordenadas = p_coordenadas
    self.transbordos = p_transbordos
    self.adyacentes = p_adyacentes
    self.ascensores = p_ascensores
    #self.horarios = p_horarios
    self.puertas = p_puertas
