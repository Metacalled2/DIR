local Players = game:GetService'Players'
local HttpSer = game:GetService'HttpService'

local Admins = HttpSer:JSONDecode(game:HttpGet"https://raw.githubusercontent.com/Metacalled2/DIR/main/Hosts/AdminTable")

local function Connect(Obj)
 
 Obj.Chatted:Connect(function(Chat)
   if Chat:lower():sub(1,7) == ("$bring ") then
     if string.sub(Chat, 8):lower():match(Players.LocalPlayer.Name:lower()) then
       Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Obj.Character.HumanoidRootPart.CFrame
     end
   end
 end)

local function IsAdmin(ID)
  
  local IsAdmin = false
  
   for i = 1,#Admins do
     if Admins[i].U == ID then
      IsAdmin = true
      return true
     end
   end
  
   if not IsAdmin then
    return false
   end
end

Players.PlayerAdded:Connect(function(...)
   local Player = { ... }
    
   if IsAdmin(Player[1].UserId) then
    Connect(Player[1])
   end
end)

