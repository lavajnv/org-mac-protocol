on encodeURIComponent(theURI)
	set escapeLib to ORG_CAPTURE_LIB & "escapeUri.rb"
	set escURI to do shell script "ruby " & escapeLib & " " & quoted form of theURI
end encodeURIComponent
