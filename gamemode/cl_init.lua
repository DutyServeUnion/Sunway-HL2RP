-- Set up the gamemode
DeriveGamemode( "sandbox" );

--Initializing global variables. Don't touch this
CAKE = {  };
CAKE.Running = false;
CAKE.Loaded = false;
CAKE.Skin = "default"
CAKE.CharCreate = function() end
CAKE.Clothing = "none"
CAKE.Helmet = "none"
CAKE.Gear = {}
CAKE.ClothingTbl = {}
CAKE.MyGroup = {}
readysent = false;
CAKE.MenuTabs = {}
CAKE.ActiveTab = nil
CAKE.MenuOpen = false
CAKE.DisplayMenu = false
CAKE.ViewRagdoll = false
CAKE.FreeScroll = false
CAKE.ForceFreeScroll = false

--Schema configuration options
CAKE.MenuFont = "Harabara" -- The default font for the whole schema
CAKE.BaseColor = Color( 100, 100, 115, 150 ) --The schema's default color. Can be set in game
CAKE.Webpage = "google.com" --Set this to whatever you want to, it'll be accessible on the "Forums" tab
CAKE.Thirdperson = CreateClientConVar( "rp_thirdperson", 0, true, true ) -- Set this to 1 to have thirdperson enabled by default.
CAKE.ThirdpersonDistance = CreateClientConVar( "rp_thirdpersondistance", 50, true, true ) --Maximum thirdperson distance
CAKE.Headbob = CreateClientConVar( "rp_headbob", 1, true, true ) --Set this to 0 to have headbob disabled by default.
CAKE.UseIntro = true --Set this to false if you want the player to go directly into the character menu when they join
CAKE.IntroText = "N/A" -- Character menu and intro text. NOTE, the HL2RP scheme changes this
CAKE.IntroSubtitle = "N/A" -- Character menu and intro subtitle. If you want this gone just set it to ""
CAKE.ChatFont = "ChatFont" -- Main font used in chatting
