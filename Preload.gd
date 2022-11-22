extends Node

# warning-ignore-all:STANDALONE_EXPRESSION
func _init():
	# ================= ASSETS =================
	
	# Preload the game icon
	preload("res://icon.png")
	
	# ================= GLOBALS =================
	
	# Preload utilities
	preload("res://Util/Util.gd")
	
	# Preload environments
	preload("res://Environments/Common.gd")
	preload("res://Environments/Development.gd")
	preload("res://Environments/Production.gd")
	
	# ================= SCRIPTS =================
	
	# Preload the physics object
	preload("res://Scripts/Editor/PhysicsObjectTool.gd")
	preload("res://Scripts/PhysicsObject.gd")
	
	# Preload the player
	preload("res://Scripts/Player.gd")
	
	# Preload the game world
	preload("res://Scripts/GameWorld.gd")
	
	# Preload the play button
	preload("res://Scripts/UI/MainMenu/PlayButton.gd")
	
	# ================= OBJECTS =================
	
	# Preload the physics object
	preload("res://Objects/PhysicsObject.tscn")
	
	# Preload the player
	preload("res://Objects/Player.tscn")
	
	# ================= SCENES =================
	
	# Preload the game world
	preload("res://Scenes/GameWorld.tscn")
	
	# Preload the main menu
	preload("res://UI/UI.tscn")
	
	# ================= WINDOW =================
	
	# Load the icon
	var icon = load("res://icon.png")
	
	# Setup the window
	OS.set_window_title(ProjectSettings.get("application/config/name"))
	OS.set_icon(icon)
