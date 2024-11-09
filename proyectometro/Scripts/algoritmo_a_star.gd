"""
extends Node

var tcp_client: TCPClient  # Cliente TCP para conectarse al servidor Python
var servidor_ip = "127.0.0.1"  # Dirección del servidor Python
var servidor_puerto = 65432  # Puerto donde el servidor está escuchando
var python_server_process : Process = null  # Variable para manejar el proceso del servidor

func _ready():
	# Ejecutar el servidor Python
	var python_script = "C:/Users/josej/Documents/CDIA2/Inteligencia_Artificial/ProyectoMetro/python_code/execution_socket.py"  # Ruta al script Python
	var python_path = "python3"  # Usa "python" o "python3" según el sistema
	var args = [python_script]
	
	# Iniciar el servidor Python como un proceso
	python_server_process = OS.execute(python_path, args, true)
	if python_server_process != OK:
		print("Error al iniciar el servidor Python")
		return

	print("Servidor Python iniciado.")

	# Esperar algunos segundos para asegurar que el servidor esté listo (o hacer un método más robusto)
	yield(get_tree().create_timer(2.0), "timeout")  # Esperar 2 segundos

	# Crear el mensaje para enviar (estaciones de inicio y final)
	var data = {
		"inicio": "Estacion1",
		"final": "Estacion3"
	}

	# Conectarse al servidor Python usando TCPClient
	tcp_client = TCPClient.new()
	var error = tcp_client.connect(servidor_ip, servidor_puerto)

	if error != OK:
		print("Error al conectar con el servidor.")
		return

	# Serializar el mensaje en JSON (usaremos JSON para enviar el mensaje de manera sencilla)
	var json_data = to_json(data)

	# Enviar el mensaje serializado al servidor
	tcp_client.put_data(json_data.to_utf8())

	# Esperar la respuesta del servidor (bloqueante)
	var response = tcp_client.get_data(1024)

	if response != "":
		# Deserializar la respuesta del servidor (es una cadena JSON)
		var result = JSON.parse(response)
		if result.error == OK:
			print("Ruta:", result.result["path"])
			print("Tiempo:", result.result["tiempo"])
		else:
			print("Error al analizar la respuesta JSON")
	else:
		print("No se recibió respuesta del servidor.")

	# Cerrar la conexión después de la comunicación
	tcp_client.close()

	# Finalizar el proceso del servidor Python después de recibir la respuesta
	python_server_process.wait_to_finish()
	print("Servidor Python detenido.")


"""
