extends Node

func is_production():
	return !OS.is_debug_build()

func get_environment():
	var dev = get_node("/root/DevelopmentEnvironment")
	var prod = get_node("/root/ProductionEnvironment")
	
	if is_production():
		return prod
	else:
		return dev

func _ready():
	pass
