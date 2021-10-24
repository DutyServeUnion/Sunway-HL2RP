Example for items if you would like to make one


ITEM.Name = "Example"; -- the item name
ITEM.Class = "example; -- the item class
ITEM.Description = "Example"; -- example description
ITEM.Model = "N/A"; -- insert your model here
ITEM.Purchaseable = false; -- here if you would like to be able to purchase the said item you are making
ITEM.Price = 3; -- you can put it to how much you want, if you would like it to be nothing put it as 0
ITEM.ItemGroup = 1; -- the team

function ITEM:Drop(ply) 

end

function ITEM:Pickup(ply)

	self:Remove();

end

function ITEM:UseItem(ply)

	ply:RemoveClothing()
	CAKE.RemoveAllGear( ply )
	ply:SetSpecialModel( "N/A" )  -- DO NOT EDIT THESE
	ply:GiveItem( "N/A" )
	self:Remove();

end


-- Clothing

ITEM.Name = "Example Clothing";
ITEM.Class = "example_clothing";
ITEM.Description = "example;
ITEM.Model = "models/Kleiner.mdl";
ITEM.Purchaseable = true;	-- keep this on true if you want the ply to buy  it
ITEM.Price = 1; 		-- already explained above
ITEM.ItemGroup = 1; 		-- this was already explained
ITEM.Flags = {  		-- the flags you would like 
	"nogloves"
}
function ITEM:Drop(ply) -- keep this shit on

end

function ITEM:Pickup(ply) -- keep this shit on

	self:Remove();

end

function ITEM:UseItem(ply) -- keep on
	self:Remove();
end

-[[ Every possible item outcome --]]

ITEM.Name = 
ITEM.Class = 
ITEM.Description = 
ITEM.Model = 
ITEM.Purchaseable = 
ITEM.Price = 
ITEM.ItemGroup = 
ITEM.Flag =

