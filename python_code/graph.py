import networkx as nx
import matplotlib.pyplot as plt
import math

dict_estaciones_A = {11: {"name": "San Pedrito", "coordenadas": (-34.6088103091689, -58.3709684989674)},
                     12: {"name": "Perú", "coordenadas": (-34.6085590738532, -58.3742677264304)},
                     13: {"name": "Piedras", "coordenadas": (-34.608881721215, -58.3790851530908)},
                     14: {"name": "Lima", "coordenadas": (-34.6090998065519, -58.3822324010181)},
                     15: {"name": "Saenz Peña", "coordenadas": (-34.6094125865027, -58.3867771940873)},
                     16: {"name": "Congreso", "coordenadas": (-34.6092256843174, -58.3926688246648)},
                     17: {"name": "Pasco", "coordenadas": (-34.6096459617052, -58.3984269918123)},
                     18: {"name": "Alberti", "coordenadas": (-34.6098335784398, -58.401207534233)}}

dict_estaciones_B = {}

dict_estaciones_C = {}

dict_estaciones_D = {41: {"name": "Facultad de Medicina", "coordenadas": (-34.5997570807639, -58.3979237555734)},
                     42: {"name": "Callao", "coordenadas": (-34.604419542860700, -58.392314235088700)},
                     43: {"name": "Tribunales", "coordenadas": (-34.6015871651394, -58.385142358801200)},
                     44: {"name": "9 de Julio", "coordenadas": (-34.6042452029629, -58.3805743428896)},
                     45: {"name": "Catedral", "coordenadas": (-34.6078023364289, -58.3739558069511)}}

dict_estaciones_E = {51: {"name": "Pichincha", "coordenadas": (-34.62310987, -58.39706807)},
                     52: {"name": "Entre Ríos", "coordenadas": (-34.62271967, -58.3915116999715)},
                     53: {"name": "San José", "coordenadas": (-34.62233949, -58.38514855)},
                     54: {"name": "Independencia", "coordenadas": (-34.61793739, -58.38153494)},
                     55: {"name": "Belgrano", "coordenadas": (-34.61284911, -58.37758089)},
                     56: {"name": "Bolívar", "coordenadas": (-34.60924243, -58.37368422)}}


