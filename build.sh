#!/bin/bash

set -e

GODOT="${GODOT_EDITOR_PATH:-godot}"

[[ ! -d "Builds/HTML5" ]] && mkdir -p "Builds/HTML5"
[[ ! -d "Builds/Linux32" ]] && mkdir -p "Builds/Linux32"
[[ ! -d "Builds/Linux64" ]] && mkdir -p "Builds/Linux64"
[[ ! -d "Builds/MacOS" ]] && mkdir -p "Builds/MacOS"
[[ ! -d "Builds/UWP" ]] && mkdir -p "Builds/UWP"
[[ ! -d "Builds/Win32" ]] && mkdir -p "Builds/Win32"
[[ ! -d "Builds/Win64" ]] && mkdir -p "Builds/Win64"

$GODOT --export "UWP"
$GODOT --export "HTML5"

$GODOT --export "MacOS (app)"
$GODOT --export "MacOS (ZIP)"

$GODOT --export "Windows Desktop (x64)"
$GODOT --export "Windows Desktop (32-bit)"

$GODOT --export "Linux/X11 (x64)"
$GODOT --export "Linux/X11 (32-bit)"
