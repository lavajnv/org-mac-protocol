-- Properties
property DIALOG_TEXT : "Emacs Org-Mode Capture"
property EMACS_CLIENT : "/usr/local/bin/emacsclient -s ~/dotfiles/emacs.d/server/server "
property ORG_NOTE : "org-protocol:/capture:/n/"
property ORG_TODO : "org-protocol:/capture:/t/"
property ORG_CAPTURE_LIB : "~/Library/Scripts/orgCaptureLib/"

on run {input, parameters}
	(* Your script goes here *)
	global process_name
	global content
	global linkURL
	global theTitle
	global theOrgScript
	
	set the_result to (display dialog DIALOG_TEXT default answer "" with icon note buttons {"Cancel", "NOTE", "TODO"} default button "NOTE" cancel button "Cancel")
	set theTitle to the text returned of the_result
	
	if button returned of the_result = "TODO" then
		set theOrgScript to EMACS_CLIENT & "\"" & ORG_TODO & theTitle & "\""
	else
		tell application "System Events"
			set process_name to item 1 of (get name of processes whose frontmost is true)
		end tell
		
		if (process_name as string) = "firefox" then
			display dialog "firefox"
		end if
	end if
	
	do shell script theOrgScript
	
	return input
end run
