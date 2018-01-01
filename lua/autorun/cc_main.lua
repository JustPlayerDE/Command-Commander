CommandCommander = CommandCommander or {} // Main Tabelle

CommandCommander.Prefix = "!"


CommandCommander.List = {

	["help"] = {
		Check = function(ply)
			return ply:IsAdmin()
		end,
		Func = function(ply)
				ply:ChatPrint("<<<<<<<<<<<<<<< COMMANDS >>>>>>>>>>>>>>>")
			for ID, DATA in pairs(CommandCommander.List) do
				ply:ChatPrint(ID..": "..DATA.HELP)
			end
		end,
		HELP = "Shows the Help about the commands"
	}

}

CommandCommander.Register = function (Name, Data)
								if CommandCommander.List[Name] then Error("Tryed to register existing command!: "..Name) end
								CommandCommander.List[Name] = {
									Check = Data.Check or function() return true end,
									Func = Data.Function or function(ply) ply:ChatPrint("Error: Function not set") end,
									HELP = Data.info or "None Given"
								}
								
							end

hook.Add( "PlayerSay", "CommandCommander_PlayerSay", function( ply, text, team )

	if ( string.sub( text, 1, string.len( CommandCommander.Prefix )  ) == CommandCommander.Prefix ) then	
		local CMD = string.sub( text,  string.len( CommandCommander.Prefix ) + 1)
		local CMD_A = string.Explode( " ", CMD )
		
		if CommandCommander.List[CMD_A[1]] then 
			if CommandCommander.List[CMD_A[1]].Check(ply) then
				CommandCommander.List[CMD_A[1]].Func(ply)
				return ""
			end		
		end
		
	end
end )

hook.Call( "CommandCommanderLoaded" )
