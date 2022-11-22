extends Node

export var invertCamera : bool = false
var config : ConfigFile = ConfigFile.new()

func _ready():
	load_config()

func load_config():
	var util = load("res://Util/Util.gd").new()
	var env = util.get_environment()
	var password = env.password
	
	config.load_encrypted_pass("user://options.cfg", password)
	
	invertCamera = config.get_value("General", "InvertCamera", false)

func save_config():
	var util = load("res://Util/Util.gd").new()
	var env = util.get_environment()
	var password = env.password

	config.save_encrypted_pass("user://options.cfg", password)
