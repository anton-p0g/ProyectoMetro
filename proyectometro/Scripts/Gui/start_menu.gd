extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Menu.visible = false


func _input(event) -> void:
	if (event is InputEventKey or event is InputEventMouseButton) and event.is_pressed() :
		show_menu()

func show_menu():
	# Oculta el menú inicial
	$Label.visible = false
	$Subte_Logo.visible = false
	
	$Menu.visible = true
	
	#var animation = $Menu.create_animation()
	#animation.interpolate_property($Menu, "rect_position:y", get_viewport_rect().size.y, get_viewport_rect().size.y - $Menu.rect_min_size.y, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	#animation.start()

func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	pass

func _on_exit_pressed() -> void:
	get_tree().quit()
