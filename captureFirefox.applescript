on getFirefoxData()
	
	tell application "Firefox"
		activate
		set oldClipboard to the clipboard
		
		-- Copy selected Content
		tell application "System Events"
			keystroke "c" using command down
		end tell
		delay 0.15
		set clipText to the clipboard
		
		-- Copy URL using vimperator
		tell application "System Events"
			key code 53
			key code 53
			keystroke "y"
		end tell
		delay 0.15
		set theURL to the clipboard
		set the clipboard to oldClipboard
		
	end tell
	
	set escURL to encodeURIComponent(theURL)
	set escContent to encodeURIComponent(clipText)
	
end getFirefoxData
