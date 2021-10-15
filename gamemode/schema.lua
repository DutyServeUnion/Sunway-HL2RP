CAKE.Schemas = {  };
CAKE.Schemafile = {  };

function CAKE.LoadSchema( schema )

	local path = "schemas/" .. schema .. ".lua"
	
	SCHEMA = {  }
	
	include( path )
	table.insert( CAKE.Schemas, SCHEMA )

	-- Load the base, first.

	if( SCHEMA.Base ) then
	
		CAKE.LoadSchema( SCHEMA.Base )
		
	end
	
	table.insert( CAKE.Schemafile, schema )
	CAKE.DayLog( "script.txt", "Loading schema " .. SCHEMA.Name .. " by " .. SCHEMA.Author .. " ( " .. SCHEMA.Description .. " )" );


	local list = file.FindDir( GM.Folder .. "/gamemode/schemas/" .. schema .. "/plugins/*", true  )

	for k, v in pairs( list ) do

		if v != "." and v != ".." then
			CAKE.LoadPlugin( schema, v )
		end
		
	end