set thePath to choose folder with prompt "Please select the Indigo Preflight folder:"
tell application "System Events"
	set selectedPath to get the name of thePath
end tell
if selectedPath is "Indigo Preflight" then
	set userCanceled to false
	try
		set startNumDialog to display dialog Â
			"Please enter the first Indigo job number:" buttons {"Cancel", "OK"} Â
			default button "OK" cancel button Â
			"Cancel" default answer ""
	on error number -128
		set userCanceled to true
	end try
	try
		set endNumDialog to display dialog Â
			"Please enter the last Indigo job number:" buttons {"Cancel", "OK"} Â
			default button "OK" cancel button Â
			"Cancel" default answer ""
	on error number -128
		set userCanceled to true
	end try
	
	if userCanceled then
		display dialog "You have canceled the creation of Indigo job folders. Please relauch the application to try again."
	else if button returned of startNumDialog is "OK" and button returned of startNumDialog is "OK" then
		set startNum to text returned of startNumDialog
		set endNum to text returned of endNumDialog
		tell application "Finder"
			activate
			repeat with i from startNum to endNum
				make new folder at thePath with properties {name:i}
			end repeat
		end tell
		
	end if
else
	display alert "You must selected the Indigo Preflight folder in tekserver://AppendIT/Tek-Po's/Indigo Preflight/"
end if