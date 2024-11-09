import socket
import pickle
from backend import *
try:
    import networkx as nx
except ImportError:
    import subprocess
    import sys
    subprocess.check_call([sys.executable, "-m", "pip", "install", "nombre_del_paquete"])
    import networkx as nx  # Intentar importar de nuevo después de la instalación


def envio_mensajes():
    path, time = path_time()

    
if __name__ == "__main__":
    envio_mensajes()
