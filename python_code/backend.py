import networkx as nx
import matplotlib.pyplot as plt
from math import radians, sin, cos, sqrt, atan2

dict_estaciones = {11: {"name": "Plaza de Mayo", "id": 11, "coordenadas": (-34.6088103091689, -58.3709684989674), "tiempo": 1},
                   12: {"name": "Perú", "id": 12, "coordenadas": (-34.6085590738532, -58.3742677264304), "tiempo": 1},
                   13: {"name": "Piedras", "id": 13, "coordenadas": (-34.608881721215, -58.3790851530908), "tiempo": 2},
                   14: {"name": "Lima", "id": 14, "coordenadas": (-34.6090998065519, -58.3822324010181), "tiempo": 1},
                   15: {"name": "Saenz Peña", "id": 15, "coordenadas": (-34.6094125865027, -58.3867771940873), "tiempo": 1},
                   16: {"name": "Congreso", "id": 16, "coordenadas": (-34.6092256843174, -58.3926688246648), "tiempo": 1},
                   17: {"name": "Pasco", "id": 17, "coordenadas": (-34.6096459617052, -58.3984269918123), "tiempo": 1},
                   18: {"name": "Alberti", "id": 18, "coordenadas": (-34.6098335784398, -58.401207534233), "tiempo": 0},
                   21: {"name": "Leandro N. Alem", "id": 21, "coordenadas": (-34.6029894966332, -58.369929850122300), "tiempo": 1},
                   22: {"name": "Florida", "id": 22, "coordenadas": (-34.603297285577500, -58.375071518263500), "tiempo": 1},
                   23: {"name": "Carlos Pellegrini", "id": 23, "coordenadas": (-34.6036371051817, -58.380714847140800), "tiempo": 1},
                   24: {"name": "Uruguay", "id": 24, "coordenadas": (-34.6040935531057, -58.387296133540700), "tiempo": 2},
                   25: {"name": "CallaoB", "id": 25, "coordenadas": (-34.604419542860700, -58.392314235088700), "tiempo": 1},
                   26: {"name": "Pasteur", "id": 26, "coordenadas": (-34.604642967919300, -58.399474256679), "tiempo": 0},
                   31: {"name": "Constitución", "id": 31, "coordenadas": (-34.6276194522548, -58.381434433934295), "tiempo": 1},
                   32: {"name": "San Juan", "id": 32, "coordenadas": (-34.6219167322081, -58.3799211788651), "tiempo": 2},
                   33: {"name": "IndependenciaC", "id": 33, "coordenadas": (-34.6181255992933, -58.380173610475204), "tiempo": 2},
                   34: {"name": "Moreno", "id": 34, "coordenadas": (-34.6126172798037, -58.38044446966), "tiempo": 1},
                   35: {"name": "Avenida de Mayo", "id": 35, "coordenadas": (-34.6089833148827, -58.3806107179579), "tiempo": 2},
                   36: {"name": "Diagonal Norte", "id": 36, "coordenadas": (-34.604843739913996, -58.3795299800739), "tiempo": 1},
                   37: {"name": "Lavalle", "id": 37, "coordenadas": (-34.601769923011396, -58.3781557828244), "tiempo": 2},
                   38: {"name": "San Martín", "id": 38, "coordenadas": (-34.5950574047792, -58.3778190509867), "tiempo": 1},
                   39: {"name": "Retiro", "id": 39, "coordenadas": (-34.5911938083332, -58.3740182164816), "tiempo": 0},
                   41: {"name": "Facultad de Medicina", "id": 41, "coordenadas": (-34.5997570807639, -58.3979237555734), "tiempo": 1},
                   42: {"name": "CallaoD", "id": 42, "coordenadas": (-34.604419542860700, -58.392314235088700), "tiempo": 2},
                   43: {"name": "Tribunales", "id": 43, "coordenadas": (-34.6015871651394, -58.385142358801200), "tiempo": 1},
                   44: {"name": "9 de Julio", "id": 44, "coordenadas": (-34.6042452029629, -58.3805743428896), "tiempo": 2},
                   45: {"name": "Catedral", "id": 45, "coordenadas": (-34.6078023364289, -58.3739558069511), "tiempo": 0},
                   51: {"name": "Pichincha", "id": 51, "coordenadas": (-34.62310987, -58.39706807), "tiempo": 1},
                   52: {"name": "Entre Ríos", "id": 52, "coordenadas": (-34.62271967, -58.3915116999715), "tiempo": 2},
                   53: {"name": "San José", "id": 53, "coordenadas": (-34.62233949, -58.38514855), "tiempo": 1},
                   54: {"name": "IndependenciaE", "id": 54, "coordenadas": (-34.61793739, -58.38153494), "tiempo": 2},
                   55: {"name": "Belgrano", "id": 55, "coordenadas": (-34.61284911, -58.37758089), "tiempo": 1},
                   56: {"name": "Bolívar", "id": 56, "coordenadas": (-34.60924243, -58.37368422), "tiempo": 0}}

dict_estaciones_nombre_id = {
    "Plaza de Mayo": 11,
    "Perú": 12,
    "Piedras": 13,
    "Lima": 14,
    "Saenz Peña": 15,
    "Congreso": 16,
    "Pasco": 17,
    "Alberti": 18,
    "Leandro N. Alem": 21,
    "Florida": 22,
    "Carlos Pellegrini": 23,
    "Uruguay": 24,
    "CallaoB": 25,
    "Pasteur": 26,
    "Constitución": 31,
    "San Juan": 32,
    "IndependenciaC": 33,
    "Moreno": 34,
    "Avenida de Mayo": 35,
    "Diagonal Norte": 36,
    "Lavalle": 37,
    "San Martín": 38,
    "Retiro": 39,
    "Facultad de Medicina": 41,
    "CallaoD": 42,
    "Tribunales": 43,
    "9 de Julio": 44,
    "Catedral": 45,
    "Pichincha": 51,
    "Entre Ríos": 52,
    "San José": 53,
    "IndependenciaE": 54,
    "Belgrano": 55,
    "Bolívar": 56
}

def add_metro_network(graph) -> None:
    # Línea A
    for i in range(11, 18):
        graph.add_edge(dict_estaciones[i]["id"], dict_estaciones[i+1]["id"], weight=dict_estaciones[i]["tiempo"])
    # Línea B
    for i in range(21, 26):
        graph.add_edge(dict_estaciones[i]["id"], dict_estaciones[i+1]["id"], weight=dict_estaciones[i]["tiempo"])
    # Línea C
    for i in range(31, 39):
        graph.add_edge(dict_estaciones[i]["id"], dict_estaciones[i+1]["id"], weight=dict_estaciones[i]["tiempo"])
    # Línea D
    for i in range(41, 45):
        graph.add_edge(dict_estaciones[i]["id"], dict_estaciones[i+1]["id"], weight=dict_estaciones[i]["tiempo"])
    # Línea E
    for i in range(51, 56):
        graph.add_edge(dict_estaciones[i]["id"], dict_estaciones[i+1]["id"], weight=dict_estaciones[i]["tiempo"])

    # Correspondencias (peso de 5 min)
    graph.add_edge(dict_estaciones[44]["id"], dict_estaciones[23]["id"], weight=5)
    graph.add_edge(dict_estaciones[44]["id"], dict_estaciones[36]["id"], weight=5)
    graph.add_edge(dict_estaciones[14]["id"], dict_estaciones[35]["id"], weight=5)
    graph.add_edge(dict_estaciones[12]["id"], dict_estaciones[45]["id"], weight=5)
    graph.add_edge(dict_estaciones[12]["id"], dict_estaciones[56]["id"], weight=5)
    graph.add_edge(dict_estaciones[33]["id"], dict_estaciones[54]["id"], weight=5)

def show_metro_network(graph) -> None:
    plt.figure(figsize=(10, 8))
    nx.draw(graph, with_labels=True, node_color='lightblue', node_size=2000, font_size=10, font_weight='bold',
            edge_color='gray')
    plt.title("Mapa del Metro como Grafo")
    plt.show()


def heuristic_metro_stations(current, destination):
    def tiempo_haversine(lat1, lon1, lat2, lon2, velocidad_media):
        """
        Calcula el tiempo estimado de viaje entre dos puntos geográficos usando la fórmula de Haversine.

        Parameters:
        lat1, lon1: Coordenadas (latitud y longitud) del punto inicial en grados.
        lat2, lon2: Coordenadas (latitud y longitud) del punto final en grados.
        velocidad_media: Velocidad media en kilómetros por minuto.

        Returns:
        float: Tiempo estimado en minutos entre los dos puntos.
        """
        # Radio de la Tierra en kilómetros
        r = 6371.0

        # Convertir coordenadas de grados a radianes
        lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])

        # Aplicar la fórmula de Haversine para calcular la distancia
        dlat = lat2 - lat1
        dlon = lon2 - lon1
        a = sin(dlat / 2) ** 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) ** 2
        c = 2 * atan2(sqrt(a), sqrt(1 - a))
        distancia = r * c  # distancia en kilómetros

        # Calcular el tiempo estimado dividiendo la distancia por la velocidad media
        tiempo = distancia / velocidad_media

        return tiempo

    h = 0
    if current == destination:
        return h
    else:
        lat_current = dict_estaciones[current]["coordenadas"][0]
        long_current = dict_estaciones[current]["coordenadas"][1]
        lat_target = dict_estaciones[destination]["coordenadas"][0]
        long_target = dict_estaciones[destination]["coordenadas"][1]
        velocidad_heuristica = 0.8333333333333334 # 50 km/h
        return tiempo_haversine(lat_current, long_current, lat_target, long_target, velocidad_heuristica)

metro = nx.Graph()
add_metro_network(metro)
source = input("Ingrese la estación de partida: ")
true_source = dict_estaciones_nombre_id[source]
target = input("Ingrese la estación de destino: ")
true_target = dict_estaciones_nombre_id[target]

path_ids = nx.astar_path(metro, true_source, true_target, heuristic_metro_stations, weight='weight')
tiempo_path = nx.astar_path_length(metro, true_source, true_target, heuristic_metro_stations)

path_nombres = []
for elem in path_ids:
    path_nombres.append(dict_estaciones[elem]["name"])
print(path_nombres)
print(f"Tiempo estimado: {tiempo_path} minutos.")