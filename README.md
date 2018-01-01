# Command Commander

You can wait until the hook "CommandCommanderLoaded" is called and then just use this function:



CommandCommander.Register("COMMAND", {
		Function = 	function(ply) // The function to run if the command is called
						ply:Kill()
					end,
		Check = 	function(ply) // check if ply can run this 
						return true
					end,
		info = 		"Here you can put your help that you can see if you type [Your Prefix]help"
})


to create an command