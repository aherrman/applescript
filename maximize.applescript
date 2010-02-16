on load_script(_scriptName)
	tell application "Finder"
		set _myPath to container of (path to me) as text
	end tell
	
	load script (alias (_myPath & _scriptName))
end load_script

set _ScreenSize to load_script("screen_size.scpt")

set front_app to (path to frontmost application as Unicode text)

set {_x, _y, _width, _height} to _ScreenSize's display_bounds()

tell application front_app
	set {_winX, _winY, _winW, _winH} to bounds of window 1
	
	activate
	
	-- The window doesn't seem to size itself to the height we give, but instead to a size smaller by the height of its shadow.  The shadow doesn't seem to be included for the width though, so it's kind of weird.  To get around this we'll add some to the height.
	set bounds of window 1 to {_x, _y, _width, _height + _ScreenSize's shadow_height()}
end tell