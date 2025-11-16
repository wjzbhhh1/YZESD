local Start = tick()
local ui = loadstring(game:HttpGet("https://pastebin.com/raw/3vQbADjh"))()
local win = ui:new("不止脚本")

local UITab1 = win:Tab("【公告】", '7734068321')
local UITab2 = win:Tab("【通用】", '7734068321')

local about1 = UITab1:section("【公告】", true)
about1:Label("作者：阴天.KOL")
about1:Label("这不是二改(真的😭)")

local about2 = UITab2:section("【功能】", true)
local jumpEnabled = false
about2:Toggle("无限跳", "Toggle", false, function(value)
    jumpEnabled = value
end)

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

UserInputService.JumpRequest:Connect(function()
    if jumpEnabled and localPlayer and localPlayer.Character then
        local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local nightVisionEnabled = false
about2:Toggle("夜视", "Toggle", false, function(value)
    nightVisionEnabled = value
    if value then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)

about2:Button("飞行", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/jm%E9%A3%9E..lua"))()
end)


