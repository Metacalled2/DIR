game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("W", "All")

game.Players["Metacalled2"].Chatted:Connect(function(self)
    if self:lower():sub(1,7) == ("repeat ") then
     
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(string.sub(self, 8), "All")
    end
end)
