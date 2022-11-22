extends Node

export var enableDebugMode : bool = true
export var platform : int = 5
export var password : String = "DevSavePassword"

enum Platform {
	WINDOWS,
	MAC,
	LINUX,
	WEB,
	SERVER,
	UNKNOWN,
}

func _get_platform():
	var platform = OS.get_name()
	
	match platform:
		"HTML5":
			return Platform.WEB
		"Windows", "WinRT":
			return Platform.WINDOWS
		"OSX":
			return Platform.MAC
		"Server":
			return Platform.SERVER
		"X11":
			return Platform.LINUX
		_:
			return Platform.UNKNOWN

func _ready():
	platform = self._get_platform()
	pass
