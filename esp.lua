local players = game:GetService("Players")
local plr = players.LocalPlayer

function esp(target)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = target.TeamColor == plr.TeamColor and _G.FriendColor or _G.EnemyColor
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = target.TeamColor == plr.TeamColor and _G.FriendColor or _G.EnemyColor
        end
    end
end

while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            esp(v)
        end
    end
end