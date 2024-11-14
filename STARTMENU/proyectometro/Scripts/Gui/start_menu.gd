extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Menu.visible = false


func _input(event) -> void:
	if (event is InputEventKey or event is InputEventMouseButton) and event.is_pressed() and $StartScreen.visible == true:
		show_menu()

func show_menu():
	# Oculta el menú inicial
	$StartScreen.visible = false
	
	$AnimationPlayer.play("startMenu")
	$Menu.visible = true
	

func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	pass

func _on_exit_pressed() -> void:
	get_tree().quit()
