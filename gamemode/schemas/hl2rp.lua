CHEMA.Name = "Half Life 2 RP";
SCHEMA.Author = "FNox";
SCHEMA.Description = "Pretend you have a life!";
SCHEMA.Base = "global";

function SCHEMA.SetUp( )

	CAKE.ConVars["RationMoney"] = 15 -- How much money you get out of a ration
	CAKE.MaxRations = 60 -- The maximum amount of rations available
	CAKE.RationTimer = 10 --In minutes. The time it takes for rations to be resupplied

	SetGlobalInt( "rations", CAKE.MaxRations )

	--Here's an example on how to set up ranks in a more flag linke fashion, while still using the Groups system.
	function CAKE.AddMetroPoliceRank( name, formalname, loadout, level, canedit, cankick, canpromote )
		if !CAKE.GroupExists( "CCA") then
			print( "CCA" )
			local tbl = {
			[ "Name" ]		= "CCA",
			[ "Type" ]		= "faction",
			[ "Founder" ]	= "C17 Combine Command",
			[ "Members" ]	= {},
			[ "Inventory" ]	= {},
			[ "Flags" ]		= 	{
				[ "soundgroup" ] 	= 2,
				[ "canbroadcast" ] 	= true,
				[ "loadouts" ] 		= true,
				[ "doorgroup" ] 	= true,
				[ "primaryrank" ] 	= "rct",
				[ "doorgroups" ] 	= 1,
				[ "radiocolor" ] 	= Color( 220, 220, 220 ),
				[ "iscombine" ]		= true,
				[ "radiogroup" ] 	= 1
			},
			[ "Ranks" ]		= {},
			[ "Description" ] = "The Combine's elite police force, based on City " .. CAKE.CityNumber
			}
			
			CAKE.CreateGroup( "CCA", tbl )
		end

		CAKE.CreateRank( "CCA", name, {
			[ "formalname" ] = formalname or "none",
			[ "loadout" ] = loadout or {},
			[ "level" ] = level or 1,
			[ "canedit" ] = canedit,
			[ "cankick" ] = cankick,
			[ "canpromote" ] = canpromote
		})
	end

	function CAKE.AddOverwatchRank( name, formalname, loadout, level, canedit, cankick, canpromote )
		if !CAKE.GroupExists( "Combine Overwatch") then
			print( "Creating Overwatch" )
			local tbl = {
			[ "Name" ]		= "Combine Overwatch",
			[ "Type" ]		= "faction",
			[ "Founder" ]	= "Combine High Command",
			[ "Members" ]	= {},
			[ "Inventory" ]	= {},
			[ "Flags" ]		= 	{
				[ "soundgroup" ] 	= 2,
				[ "canbroadcast" ] 	= true,
				[ "loadouts" ] 		= true,
				[ "doorgroup" ] 	= true,
				[ "primaryrank" ] 	= "ow",
				[ "doorgroups" ] 	= 1,
				[ "radiocolor" ] 	= Color( 100, 100, 220 ),
				[ "iscombine" ]		= true,
				[ "radiogroup" ] 	= 1
			},
			[ "Ranks" ]		= {},
			[ "Description" ] = "The fearsome Overwatch, the Combine's trans-human military force"
			}
			
			CAKE.CreateGroup( "Combine Overwatch", tbl )
		end

		CAKE.CreateRank( "Combine Overwatch", name, {
			[ "formalname" ] = formalname or "none",
			[ "loadout" ] = loadout or {},
			[ "level" ] = level or 1,
			[ "canedit" ] = canedit,
			[ "cankick" ] = cankick,
			[ "canpromote" ] = canpromote
		})
	end

	function CAKE.AddResistanceRank( name, formalname, loadout, level, canedit, cankick, canpromote, buygroup )
		if !CAKE.GroupExists( "Resistance") then
			print( "Creating Resistance" )
			local tbl = {
			[ "Name" ]		= "Resistance",
			[ "Type" ]		= "faction",
			[ "Founder" ]	= "The Citizens of C17",
			[ "Members" ]	= {},
			[ "Inventory" ]	= {},
			[ "Flags" ]		= 	{
				[ "soundgroup" ] 	= 1,
				[ "canbroadcast" ] 	= false,
				[ "loadouts" ] 		= true,
				[ "doorgroup" ] 	= true,
				[ "primaryrank" ] 	= "rookie",
				[ "doorgroups" ] 	= 2,
				[ "radiocolor" ] 	= Color( 220, 20, 20 ),
				[ "radiogroup" ] 	= 2
			},
			[ "Ranks" ]		= {},
			[ "Description" ] = "Members of the civil insurgence, fighting for human liberation."
			}
			
			CAKE.CreateGroup( "Resistance", tbl )
		end

		CAKE.CreateRank( "Resistance", name, {
			[ "formalname" ] = formalname or "none",
			[ "loadout" ] = loadout or {},
			[ "level" ] = level or 1,
			[ "canedit" ] = canedit,
			[ "cankick" ] = cankick,
			[ "canpromote" ] = canpromote,
			[ "buygroups" ] = buygroups or {}
		})
	end

	--Civil Protection
	--Recruit
	CAKE.AddMetroPoliceRank( "rct", "Civil Protection Recruit", {"clothing_police", "weapon_zipties", "weapon_stunstick" }, 1)
	--CP-1
	CAKE.AddMetroPoliceRank( "cp1", "Civil Protection Officer i5", {"clothing_police", "helmet_police", "weapon_zipties", "weapon_stunstick", "weapon_pistol", "weapon_smg1" },2)
	--CP-2
	CAKE.AddMetroPoliceRank( "cp2", "Civil Protection Officer i4", {"clothing_police", "helmet_police", "weapon_zipties", "weapon_stunstick", "weapon_pistol", "weapon_smg1" },3)
	--CP-3
	CAKE.AddMetroPoliceRank( "cp3", "Civil Protection Officer i3", {"clothing_police", "helmet_police", "weapon_zipties", "weapon_stunstick", "weapon_pistol", "weapon_smg1" },4)
	--TL
	CAKE.AddMetroPoliceRank( "tl", "Civil Protection Officer i2", {"clothing_police", "helmet_police", "weapon_zipties", "weapon_stunstick", "weapon_pistol", "weapon_smg1", "weapon_shotgun" }, 5, false, true, true )
	--Medic
	CAKE.AddMetroPoliceRank( "m", "Civil Protection Officer i1", {"clothing_police", "helmet_police", "weapon_zipties", "weapon_stunstick", "weapon_pistol", "weapon_smg1", "firstaidkit", "small_medikit", "small_medikit", "small_medikit" },3)
	--Engineer
	CAKE.AddMetroPoliceRank( "en", "Civil Protection Officer Rank Leader", {"clothing_police", "helmet_police", "helmet_elite", "weapon_zipties", "weapon_stunstick", "weapon_pistol", "weapon_smg1" }, 3)
	--Division Leader
	CAKE.AddMetroPoliceRank( "dl", "Civil Protection Commander", {"clothing_police", "helmet_police", "weapon_zipties", "weapon_stunstick", "weapon_pistol", "weapon_smg1", "weapon_shotgun" }, 6, true, true, true )

	--Overwatch
	--OW
	CAKE.AddOverwatchRank( "ow", "Overwatch Soldier", {"clothing_soldier", "helmet_soldier", "weapon_zipties", "weapon_stunstick", "weapon_smg1", "weapon_shotgun" }, 1)
	--Airwatch
	CAKE.AddOverwatchRank( "aw", "Airwatch Soldier", {"clothing_soldier", "helmet_soldier", "weapon_zipties", "weapon_stunstick", "weapon_smg1", "weapon_shotgun" }, 1)
	--Commander
	CAKE.AddOverwatchRank( "cw", "Overwatch Squad Commander", {"clothing_soldier", "helmet_soldier", "weapon_zipties", "weapon_stunstick", "weapon_ar2", "weapon_smg1", "weapon_shotgun" }, 2, false, true, true )
	--Elite
	CAKE.AddOverwatchRank( "ew", "Overwatch Elite Soldier", {"clothing_elite", "helmet_elite", "weapon_zipties", "weapon_stunstick", "weapon_ar2", "weapon_smg1", "weapon_shotgun" }, 2, false, true, true )

	--Lambda Rebels
	--Recruit
	CAKE.AddResistanceRank( "rookie", "Resistance Rookie", {"clothing_combat"}, 1 )
	--Regular members
	CAKE.AddResistanceRank( "member", "Resistance Member", { "clothing_combat", "helmet_balaclava", "weapon_smg1" }, 2 )
	--Medics
	CAKE.AddResistanceRank( "medic", "Resistance Medic", { "clothing_combat", "clothing_medic", "helmet_balaclava", "weapon_smg1" }, 2 )
	--Leader
	CAKE.AddResistanceRank( "leader", "Resistance Leader", { "clothing_combat", "helmet_balaclava", "weapon_smg1"," weapon_357"}, 3, true, true, true, {1,2,3} )

end
