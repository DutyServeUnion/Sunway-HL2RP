--NPC Animations V4

local meta = FindMetaTable( "Player" )
local model

function meta:GetGender()

	model = self:GetModel()
	if table.HasValue( Anims.Female[ "models" ], model ) or self:GetNWString( "gender", "Male" ) == "Female" then
		return "Female"
	end
	
	return "Male"

end

if SERVER then
	--Weapons that are always aimed
	AlwaysAimed = {
		"weapon_physgun",
		"weapon_physcannon",
		"weapon_frag",
		"weapon_slam",
		"weapon_rpg",
		"gmod_tool"
	}

	--Weapons that are never aimed
	NeverAimed = {
    "hands"
	}

    function meta:SetSpecialModel( model )

    self:SetNWBool( "specialmodel", true )
    self:SetModel( model )

    end

	
	function meta:SetAiming( bool )
		local wep = self:GetActiveWeapon()
		if self:GetNWBool( "arrested", false ) then
			bool = false
		end
		if ValidEntity( wep ) then
			if table.HasValue( AlwaysAimed, wep:GetClass() ) then
				bool = true
			end
			if table.HasValue( NeverAimed, wep:GetClass() ) then
				bool = false
			end
			if bool then
				wep:SetNextPrimaryFire( CurTime() )
			else
				wep:SetNextPrimaryFire( CurTime() + 999999 )
			end
		end
		self:DrawViewModel( bool )
		self:SetNWBool( "aiming", bool )
	end
	
	local function HolsterToggle( ply, cmd, args )
		ply:SetAiming( !ply:GetAiming() )
	end
	concommand.Add( "rp_toggleholster", HolsterToggle );
	concommand.Add( "toggleholster", HolsterToggle );
	
	hook.Add( "PlayerSpawn", "TiramisuAnimSpawnHandle", function( ply )
    ply:SetAiming( false )
    ply:SetNWBool( "specialmodel", false )
		timer.Create( ply:SteamID() .. "TiramisuAimTimer", 0.1, 0, function()
			if ValidEntity( ply ) then
				if ply.TiramisuLastWeapon and ValidEntity( ply:GetActiveWeapon() ) and ply:GetActiveWeapon():GetClass() != ply.TiramisuLastWeapon then
					ply:SetAiming( false )
					ply.TiramisuLastWeapon = ply:GetActiveWeapon():GetClass()
				else
					if ValidEntity( ply:GetActiveWeapon() ) then
						ply.TiramisuLastWeapon = ply:GetActiveWeapon():GetClass()
					end
				end
			end
		end)
	end)

    hook.Add( "PlayerSetModel", "TiramisuSetAnimTrees", function( ply )
    if !ply:GetNWBool( "specialmodel", false ) then
        if(ply:IsCharLoaded()) then
            local m = ""
            if( CAKE.GetCharField( ply, "gender" ) == "Female" ) then
            m = "models/tiramisu/animationtrees/alyxanimtree.mdl"
            ply:SetNWString( "gender", "Female" )
            else
            m = "models/tiramisu/animationtrees/maleanimtree.mdl"
            ply:SetNWString( "gender", "Male" )
            end
            
            ply:SetModel( m );
        else
        ply:SetModel("models/kleiner.mdl");
        end
    end
    end )

    hook.Add( "KeyPress", "TiramisuAimCheck", function(ply, key)
    if ValidEntity( ply ) and ValidEntity( ply:GetActiveWeapon() ) then
        if key == IN_ATTACK or key == IN_ATTACK2 then
        ply:SetAiming( true )
        end
    end
    end )
	
end

function meta:GetAiming()
	if self:GetNWBool( "aiming", false ) then
		return true
	end
	
	return false
end

meta = nil

Anims = {}
Anims.Male = {}
Anims.Male[ "models" ] = {
	"models/tiramisu/animationtrees/maleanimtree.mdl",
	"models/tiramisu/animationtrees/combineanimtree.mdl",
	"models/tiramisu/animationtrees/policeanimtree.mdl"
}
Anims.Male[ "default" ] = { 
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_IDLE",
		--[ "idle" ] = "&sequence:LineIdle01;models/tiramisu/animationtrees/maleanimtree.mdl",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RUN",
    [ "jump" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_JUMP",
    [ "land" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_LAND",
    [ "fly" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_GLIDE",
    [ "sit" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_BUSY_SIT_CHAIR",
    [ "sitentry" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_BUSY_SIT_CHAIR_ENTRY",
    [ "sitexit" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_BUSY_SIT_CHAIR_EXIT",
	[ "swim" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_GLIDE",
    [ "sitground" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_BUSY_SIT_GROUND",
    [ "sitgroundentry" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_BUSY_SIT_GROUND_ENTRY",
    [ "sitgroundexit" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_BUSY_SIT_GROUND_EXIT",
    [ "flinch" ] = {
    ["explosion"] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_GESTURE_FLINCH_BLAST"
    },
		[ "crouch" ] = {
				[ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_COVER_LOW",
				[ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_CROUCH",
				[ "aimidle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RANGE_AIM_SMG1_LOW",
				[ "aimwalk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_CROUCH_AIM_RIFLE"
		},
		[ "aim" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_IDLE_AIM_RIFLE_STIMULATED",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_AIM_RIFLE_STIMULATED",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RUN_AIM_RIFLE_STIMULATED"
    }
}
Anims.Male[ "pistol" ] = {
    [ "idle" ] = "ACT_IDLE",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_WALK_PISTOL",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_RUN_PISTOL",
    [ "crouch" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_COVER_PISTOL_LOW",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_WALK_CROUCH",
    [ "aimidle" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_COVER_PISTOL_LOW",
    [ "aimwalk" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_WALK_CROUCH"
    },
    [ "aim" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_IDLE_ANGRY_PISTOL",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_WALK_AIM_PISTOL",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_RUN_AIM_PISTOL"
    },
		[ "fire" ] = "ACT_GESTURE_RANGE_ATTACK_PISTOL",
    [ "reload" ] = "ACT_GESTURE_RELOAD_PISTOL"
}
Anims.Male[ "ar2" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_IDLE_SMG1_RELAXED",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_RIFLE_RELAXED",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RUN_RIFLE_RELAXED",
    [ "crouch" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_COVER_LOW",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_CROUCH_RIFLE",
    [ "aimidle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RANGE_AIM_SMG1_LOW",
    [ "aimwalk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_CROUCH_AIM_RIFLE"
    },
    [ "aim" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_IDLE_AIM_RIFLE_STIMULATED",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_AIM_RIFLE_STIMULATED",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RUN_AIM_RIFLE_STIMULATED"
    },
		["fire"] = "ACT_GESTURE_RANGE_ATTACK_SMG1"
}

Anims.Male[ "smg" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_IDLE_SMG1",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_WALK_RIFLE",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_RUN_RIFLE",
    [ "crouch" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_COVER_SMG1_LOW",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_WALK_CROUCH",
    [ "aimidle" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_COVER_SMG1_LOW",
    [ "aimwalk" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_WALK_CROUCH"
    },
    [ "aim" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_IDLE_ANGRY_SMG1",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_WALK_AIM_RIFLE",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/policeanimtree.mdl;ACT_RUN_AIM_RIFLE"
    },
		[ "fire" ] = "ACT_GESTURE_RANGE_ATTACK_SMG1",
    [ "reload" ] = "ACT_GESTURE_RELOAD_SMG1"
}

Anims.Male[ "shotgun" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_IDLE",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_WALK_RIFLE",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_RUN_RIFLE",
    [ "crouch" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_COVER_LOW",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_WALK_CROUCH_RIFLE",
    [ "aimidle" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_RANGE_AIM_AR2_LOW",
    [ "aimwalk" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_WALK_CROUCH_RIFLE"
    },
    [ "aim" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_IDLE_ANGRY_SHOTGUN",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_WALK_AIM_SHOTGUN",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_RUN_AIM_SHOTGUN"
    },
		["fire"] = "ACT_GESTURE_RANGE_ATTACK_SHOTGUN"
}

Anims.Male[ "crossbow" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_IDLE",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_WALK_RIFLE",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_RUN_RIFLE",
    [ "crouch" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_COVER_LOW",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_WALK_CROUCH_RIFLE",
    [ "aimidle" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_RANGE_AIM_AR2_LOW",
    [ "aimwalk" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_WALK_CROUCH_RIFLE"
    },
    [ "aim" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_IDLE_ANGRY",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_WALK_AIM_RIFLE",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/combineanimtree.mdl;ACT_RUN_AIM_RIFLE"
    },
		["fire"] = "ACT_GESTURE_RANGE_ATTACK_AR2"
}

Anims.Male[ "rpg" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_IDLE_RPG",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_RPG_RELAXED",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RUN_RPG_RELAXED",
    [ "crouch" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_COVER_LOW_RPG",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_CROUCH_RPG",
    [ "aimidle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RANGE_AIM_SMG1_LOW",
    [ "aimwalk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_CROUCH_AIM_RIFLE"
    },
    [ "aim" ] = {
    [ "idle" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_IDLE_ANGRY_RPG",
    [ "walk" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_WALK_AIM_RIFLE_STIMULATED",
    [ "run" ] = "&switch:models/tiramisu/animationtrees/maleanimtree.mdl;ACT_RUN_AIM_RIFLE_STIMULATED"
    },
		["fire"] = "ACT_GESTURE_RANGE_ATTACK_SMG1"
}

