on screen_size()
	set _command to "/usr/sbin/system_profiler SPDisplaysDataType | grep Resolution"
	set _results to words of (do shell script _command)
	
	set _width to item 2 of _results as number
	set _height to item 4 of _results as number
	
	{_width, _height}
end screen_size

on menubar_height()
	tell application "System Events"
		set {_width, _height} to size of UI element 1 of application process "SystemUIServer"
	end tell
	
	_height
end menubar_height

on display_bounds()
	set {_screenWidth, _screenHeight} to screen_size()
	set _menuHeight to menubar_height()
	
	{0, _menuHeight, _screenWidth, _screenHeight - _menuHeight}
end display_bounds