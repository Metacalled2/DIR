local Players = game:GetService'Players'
local HttpSer = game:GetService'HttpService'

local Admins = HttpSer:JSONDecode(game:HttpGet"https://raw.githubusercontent.com/Metacalled2/DIR/main/Hosts/AdminTable")

for i = 1,#Admins do
 warn(Admins[i].U)
end

local function Connect(Obj)
 
 Obj.Chatted:Connect(function(Chat)
   if Chat:lower():sub(1,7) == ("$bring ") or Chat:lower():sub(1,10) == ("/e $bring ") then
    
    if Chat:lower():sub(1,7) == ("$bring ")  then
       if Players.LocalPlayer.Name:lower():match(string.sub(Chat, 8):lower()) then
         Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Obj.Character.HumanoidRootPart.CFrame
       end
    end
    
    if Chat:lower():sub(1,10) == ("/e $bring ")  then
       if Players.LocalPlayer.Name:lower():match(string.sub(Chat, 11):lower()) then
         Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Obj.Character.HumanoidRootPart.CFrame
       end
    end
   
   end
 end)
 
  Obj.Chatted:Connect(function(Chat)
   if Chat:lower():sub(1,6) == ("$kill ") or Chat:lower():sub(1,9) == ("/e $kill ") then
    
     if Chat:lower():sub(1,6) == ("$kill ") then
        if Players.LocalPlayer.Name:lower():match(string.sub(Chat, 7):lower()) then
          Players.LocalPlayer.Character.Humanoid.Health = 0
        end
     end
    
     if Chat:lower():sub(1,9) == ("/e $kill ") then
        if Players.LocalPlayer.Name:lower():match(string.sub(Chat, 10):lower()) then
          Players.LocalPlayer.Character.Humanoid.Health = 0
        end
     end
    
   end
 end)

end

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
