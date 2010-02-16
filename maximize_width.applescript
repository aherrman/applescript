on load_script(_scriptName)
	tell application "Finder"
		set _myPath to container of (path to me) as text
	end tell
	
	set _loadPath to (_myPath & _scriptName)
	load script (alias _loadPath)
end load_script

set _ScreenSize to load_script("screen_size.scpt")

set front_app to (path to frontmost application as Unicode text)

set {_x, _y, _width, _height} to _ScreenSize's display_bounds()

tell application front_app
	set {_winX, _winY, _winW, _winH} to bounds of window 1
	
	activate
	
	set bounds of window 1 to {_x, _winY, _width, _winH}
end tell