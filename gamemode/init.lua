-- Set up the gamemode
DeriveGamemode( "sandbox" );
GM.Name = "The J"

-- Define global variables
CAKE = {  };
CAKE.Running = false;
CAKE.Loaded = false;

-- Server Includes
require( "glon" )
if not(datastream) then  
    require("datastream");  
end  

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )
