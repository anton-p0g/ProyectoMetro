extends Node


const LineaA = preload("res://Scripts/Lineas/LineaA.gd")
const LineaB = preload("res://Scripts/Lineas/LineaB.gd")
const LineaC = preload("res://Scripts/Lineas/LineaC.gd")
const LineaD = preload("res://Scripts/Lineas/LineaD.gd")
const LineaE = preload("res://Scripts/Lineas/LineaE.gd")

var grafo_astar = AStar2D.new()

var estaciones_globales = {}

func _ready():
	pass
