_G.Key = "q"
getgenv().AimlockTarget = nil
getgenv().Aimlock = true

function n(Text)
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Silent Aim",
Text = Text,
Duration = 5,
})
end

local Flags = {
 "ws",
 "hb",
 "bv"
}

local HumanoidFlags = {
 "WalkSpeed",
 "JumpPower",
 "HipHeight",
 "Health"
}

function CFrame()
 local Part = AimlockTarget.Character.FindFirstChild(AimlockTarget.Character, "HumanoidRootPart") or AimlockTarget.Character.FindFirstChild(AimlockTarget.Character, "Torso") or AimlockTarget.Character.FindFirstChild(AimlockTarget.Character, "Head")

 if Part then
   
   return Part.CFrame + Part.Velocity / 5
  end
end

local Raw = getrawmetatable(game)
local NC = Raw.__namecall
local Exploit = checkcaller or is_protosmasher_caller or Cer.isCerus
local Method = getnamecallmethod or get_namecall_method
local Closure = newcclosure or read_me or function(F) return F end


setreadonly(Raw, false)

Raw.__namecall = Closure(function(self, ...)
 local A = {...}
  if Exploit() then
     
    if Method() == "FireServer"  then
      if table.find(HumanoidFlags, A[1]) then return wait(9e9) end
    end
    
    if tostring(self) == "Input" then
      if table.find(Flags, A[1]) then return wait(9e9) end
    end
      
    if Method() == "FireServer" and Aimlock and AimlockTarget and tostring(self) == "Fire" then
      return NC(self, CFrame())
    end
  end
  
  if tostring(self) == "Input" and Aimlock and AimlockTarget then
    if type(A[2]) == "table" then
     local Args = A
     local Table = Args[2]
     Table.mousehit = CFrame()
     return NC(self,unpack(A))
     end
  end
  
  return NC(self, ...)
end)

local SilentAim = Instance.new("ScreenGui")
local MainLibaryUI = Instance.new("Frame")
local TitleUI = Instance.new("TextLabel")
local SetTargetUIT = Instance.new("TextBox")
local AimlockUIB = Instance.new("TextButton")
local ToggleUIB = Instance.new("TextButton")

SilentAim.Name = "SilentAim"
SilentAim.Parent = game.CoreGui

MainLibaryUI.Name = "MainLibary(UI)"
MainLibaryUI.Parent = SilentAim
MainLibaryUI.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
MainLibaryUI.BorderColor3 = Color3.fromRGB(31, 31, 31)
MainLibaryUI.Position = UDim2.new(-0.255401254, 0, -0.110565126, 0)
MainLibaryUI.Size = UDim2.new(0, 367, 0, 181)

TitleUI.Name = "Title(UI)"
TitleUI.Parent = MainLibaryUI
TitleUI.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
TitleUI.BorderColor3 = Color3.fromRGB(48, 48, 48)
TitleUI.Size = UDim2.new(0, 367, 0, 31)
TitleUI.Font = Enum.Font.Gotham
TitleUI.Text = "Silent Aim Gui"
TitleUI.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleUI.TextScaled = true
TitleUI.TextSize = 14.000
TitleUI.TextWrapped = true

SetTargetUIT.Name = "SetTarget(UIT)"
SetTargetUIT.Parent = MainLibaryUI
SetTargetUIT.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
SetTargetUIT.BorderColor3 = Color3.fromRGB(48, 48, 48)
SetTargetUIT.Position = UDim2.new(0.0190735664, 0, 0.249761865, 0)
SetTargetUIT.Size = UDim2.new(0, 210, 0, 50)
SetTargetUIT.Font = Enum.Font.Gotham
SetTargetUIT.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SetTargetUIT.PlaceholderText = "Target Here"
SetTargetUIT.Text = ""
SetTargetUIT.TextColor3 = Color3.fromRGB(255, 255, 255)
SetTargetUIT.TextScaled = true
SetTargetUIT.TextSize = 14.000
SetTargetUIT.TextWrapped = true

AimlockUIB.Name = "Aimlock(UIB)"
AimlockUIB.Parent = MainLibaryUI
AimlockUIB.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
AimlockUIB.BorderColor3 = Color3.fromRGB(48, 48, 48)
AimlockUIB.Position = UDim2.new(0.623978198, 0, 0.249761865, 0)
AimlockUIB.Size = UDim2.new(0, 130, 0, 50)
AimlockUIB.Font = Enum.Font.Gotham
AimlockUIB.Text = "aimlock"
AimlockUIB.TextColor3 = Color3.fromRGB(255, 255, 255)
AimlockUIB.TextScaled = true
AimlockUIB.TextSize = 14.000
AimlockUIB.TextWrapped = true

ToggleUIB.Name = "Toggle(UIB)"
ToggleUIB.Parent = MainLibaryUI
ToggleUIB.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
ToggleUIB.BorderColor3 = Color3.fromRGB(48, 48, 48)
ToggleUIB.Position = UDim2.new(0.0190735701, 0, 0.620760977, 0)
ToggleUIB.Size = UDim2.new(0, 352, 0, 50)
ToggleUIB.Font = Enum.Font.Gotham
ToggleUIB.Text = "Toggle"
ToggleUIB.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleUIB.TextScaled = true
ToggleUIB.TextSize = 14.000
ToggleUIB.TextWrapped = true

-- Scripts:

local function AWQKY_fake_script() -- AimlockUIB.Action 
	local script = Instance.new('LocalScript', AimlockUIB)

	local Click = script.Parent.MouseButton1Down
	
		function GetPlayer(String)
		    local strl = String:lower()
		    if strl == "all" then
		        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		            return v
		        end
		    elseif strl == "others" then
		        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		            if v.Name ~= game.Players.Localayer.Name then
		                return v
		            end
		        end   
			elseif strl == "me" then
		        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		            if v.Name == game.Players.LocalPlayer.Name then
		                return v
		            end
		        end  
		    else
		        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		            if v.Name:lower():sub(1, #String) == String:lower() then
		                return v
		            end
		        end    
		    end
		end
	
	Click:Connect(function()
	    local W = GetPlayer(tostring(script.Parent.Parent["SetTarget(UIT)"].Text))
	    if AimlockTarget ~= nil and AimlockTarget.Name == W.Name then return end
		AimlockTarget = GetPlayer(tostring(script.Parent.Parent["SetTarget(UIT)"].Text))
		n('Aimlock is now set to: ' .. AimlockTarget.Name)
	end)
end
coroutine.wrap(AWQKY_fake_script)()
local function GIKSKAD_fake_script() -- ToggleUIB.Action 
	local script = Instance.new('LocalScript', ToggleUIB)

	local Click = script.Parent.MouseButton1Down
	
Click:Connect(function()
	if Aimlock == (true) then
	   n('Aimlock is now set to: false')
	   Aimlock = false
	 else
	   n('Aimlock is now set to: true')
		 Aimlock = true	
	  end
	end)
end
coroutine.wrap(GIKSKAD_fake_script)()
local function ROBIDX_fake_script() -- MainLibaryUI.Tween 
	local script = Instance.new('LocalScript', MainLibaryUI)

	local cf = script.Parent
		
	cf.Active = true
	cf.Draggable = true
	cf:TweenPosition(UDim2.new(0.374, 0,0.392, 0))
end
coroutine.wrap(ROBIDX_fake_script)()

n("Silent Aim loaded successfully!")
n("Controls: Press q on a player to set target or type their name in the textbox ( supports short names )")
n("- fixed dragging / meele when aimlocking")

Parts = {"Right Arm", "Right Leg", "Left Leg", "Left Arm", "Torso", "Head", "HumanoidRootPart"}

game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if _G.Key ~= nil and KeyPressed == _G.Key then
    if table.find(Parts, game:GetService("Players").LocalPlayer:GetMouse().Target.Name) and game:GetService("Players").LocalPlayer:GetMouse().Target:IsA("Part") then
            if AimlockTarget ~= nil then
          if AimlockTarget.Name == game:GetService("Players").LocalPlayer:GetMouse().Target.Parent.Name then 
              return
          end
     end
      AimlockTarget = game:GetService("Players")[game:GetService("Players").LocalPlayer:GetMouse().Target.Parent.Name]
      n('Aimlock is now set to: ' .. AimlockTarget.Name)
    elseif game:GetService("Players").LocalPlayer:GetMouse().Target.Name == "Handle" and game:GetService("Players").LocalPlayer:GetMouse().Target.Parent:IsA("Accessory") then
      if AimlockTarget ~= nil then
          if AimlockTarget.Name == game:GetService("Players").LocalPlayer:GetMouse().Target.Parent.Parent.Name then 
              return
          end
     end
      AimlockTarget = game.Players[game:GetService("Players").LocalPlayer:GetMouse().Target.Parent.Parent.Name]
     n('Aimlock is now set to: ' .. AimlockTarget.Name)
    end
  end
end)
