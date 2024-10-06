local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
    LastIteration = tick()
    for Index = #FrameUpdateTable, 1, -1 do
        FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
    end
    FrameUpdateTable[1] = LastIteration
    local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
    CurrentFPS = CurrentFPS - CurrentFPS % 1
    FpsLabel.Text = ("美国时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local ui = loadstring(game:HttpGet("https://pastebin.com/raw/Ey3CpCHS"))();        
local win = ui:new("丁丁脚本VB")
--
local UITab1 = win:Tab("『信息』",'6035145364')

local about = UITab1:section("『信息』",true)


about:Label("作者QQ：198436746")
about:Label("qq群：930667114")
about:Label("作者：丁丁")
about:Label("脚本疯狂优化中")
about:Label("你的注入器:"..identifyexecutor())
about:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)

local UITab2 = win:Tab("『通用』",'16060333448')

local about = UITab2:section("『通用』",true)

about:Button("玩家加入游戏提示",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
end)

about:Button("汉化穿墙",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
end)

about:Button("防空警报", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("义勇军进行曲", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("彩虹瀑布",function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1837879082"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("飞行",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/fly/main/%E4%B8%81%E4%B8%81%E9%A3%9E%E8%A1%8C.txt"))()
end)

about:Button("透视",function()  
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
        local function ApplyESP(v)
       if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
           v.Character.Humanoid.NameDisplayDistance = 9e9
           v.Character.Humanoid.NameOcclusion = "NoOcclusion"
           v.Character.Humanoid.HealthDisplayDistance = 9e9
           v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
           v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
       end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end
    
    game.Players.PlayerAdded:Connect(function(v)
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end)
    
        local Players = game:GetService("Players"):GetChildren()
    local RunService = game:GetService("RunService")
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = player.Character
            highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.Name = "Highlight"
        end
    end)
    
    game.Players.PlayerRemoving:Connect(function(playerRemoved)
        playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
    end)
    
    RunService.Heartbeat:Connect(function()
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
                task.wait()
            end
    end
    end)
    end)

about:Toggle("夜视","Toggle",false,function(Value)
        Light = Value
        game.RunService.Stepped:Connect(function()
            if Light then
                game.Lighting.Ambient = Color3.new(1, 1, 1)
            else
                game.Lighting.Ambient = Color3.new(0, 0, 0)
            end
        end)
    end)
    
about:Toggle("无限跳","Toggle",false,function(Value)
        Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end)
    
about:Slider('设置速度', 'Sliderflag', 16, 16, 200,false, function(Value)
    game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            end)
        end)
    end)
    
about:Slider('设置血量', 'Sliderflag', 100, 1, 100,false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.Health = Value
    end)
    
about:Slider('设置重力', 'Sliderflag', 196.2, 196.2, 1000,false, function(Value)
        game.Workspace.Gravity = Value
    end)
    
about:Button("替身",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
end)

about:Button("爬墙",function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

about:Button("汉化阿尔宙斯自瞄",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
end)

about:Button("工具挂",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"))()
end)

about:Button("甩飞",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/hknvh/main/%E7%94%A9%E9%A3%9E.txt"))()
end)

about:Button("透视1",function()
loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
end)

about:Button("透视2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

about:Button("无敌『不适用』",function()
loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
end)

about:Button("隐身（E）",function()
loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
end)

about:Button("电脑键盘",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

about:Button("飞车",function()
loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))()
end)

about:Button("踏空行走",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)

about:Button("转圈",function()
loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
end)

about:Button("紫莎",function()
game.Players.LocalPlayer.Character.Humanoid.Health=0
end)

about:Button("飞檐走壁",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

about:Button("夜视仪",function()
    _G.OnShop = trueloadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
end)

about:Button("正常范围",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
end)

about:Button("中等范围",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/x13bwrFb"))()
end)

about:Button("高级范围",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()
end)

about:Button("反挂机",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end)

about:Button("无限跳",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)

local UITab3 = win:Tab("『力量传奇』",'16060333448')

local about = UITab3:section("『力量传奇』",true)

about:Button("丁力量传奇传送",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/li/main/%E4%B8%81%E4%B8%81%E5%8A%9B%E9%87%8F.lua"))()
end)

about:Button("力量传奇改力量",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
end)

local UITab4 = win:Tab("『忍者传奇』",'16060333448')

local about = UITab4:section("『忍者传奇』",true)

about:Button("丁",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/li/main/%E6%96%B0%E4%B8%81%E4%B8%81%E5%BF%8D%E8%80%85%E4%BC%A0%E5%A5%87.lua"))()
end)

about:Button("传送",function()
loadstring(game:HttpGet("https://pastebin.com/raw/UzaUDSPK"))()
end)

about:Button("忍者传奇1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/zerpqe/script/main/NinjaLegends.lua"))()
end)

about:Button("忍者传奇2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatBlueDevil/Bleus/main/Ninja%20Legends/Source.lua"))()
end)

about:Button("忍者传奇3",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Zyb150933/zyb/main/123'))()
end)

about:Button("忍者传奇4",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Zyb150933/zyb/main/123'))()
end)

local UITab5 = win:Tab("『极速传奇』",'16060333448')

local about = UITab5:section("『极速传奇』",true)

about:Button("丁",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ding/main/%E4%B8%81%E4%B8%81%E6%9E%81%E9%80%9F%E4%BC%A0%E5%A5%87%20(1).txt"))()
end)

about:Button("boa",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/BoaHacker/ROBLOX/main/cheat', true))()
end)

about:Button("汉化",function()
loadstring(game:HttpGet("https://pastebin.com/raw/egMXJcwB", true))()
end)

local UITab6 = win:Tab("『死亡球』",'16060333448')

local about = UITab6:section("『死亡球』",true)

about:Button("死亡球1",function()
loadstring(game:HttpGet("https://github.com/Hosvile/InfiniX/releases/latest/download/main.lua",true))()
end)

about:Button("死亡球2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Ball1/main/Death"))()
end)

local UITab7 = win:Tab("『Doors  门』",'16060333448')

local about = UITab7:section("『门』",true)

about:Button("丁",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/rhnrn/main/%E4%B8%81%E4%B8%81doors.txt"))()
end)

about:Button("最强汉化",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

about:Button("最新",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
end)

about:Button("DX",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/replicator-lol/main/dor.lua"))()
end)

about:Button("RP变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)

about:Button("剪刀",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
end)

about:Button("十字架",function()
loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))()
end)

about:Button("神圣炸弹",function()
loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end)

about:Button("吸铁石",function()
loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end)

about:Button("刷怪变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
end)

about:Button("变身",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)

local UITab8 = win:Tab("『俄亥俄州』",'16060333448')

local about = UITab8:section("『俄亥俄州』",true)

about:Button("自动找印钞机",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/ClasiniZukov/e7547e7b48fa90d10eb7f85bd3569147/raw/f95cd3561a3bb3ac6172a14eb74233625b52e757/gistfile1.txt"))()
end)

about:Button("传送加自动工作",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/ohio/main/Roblox232"))()
end)

about:Button("俄亥俄州1英",function()
loadstring(game:HttpGet("https://pastebin.com/raw/0MqfXpvY", true))()
end)

about:Button("俄亥俄州2英",function()
loadstring(game:HttpGet('https://pastebin.com/raw/MyfCUnGK'))()
end)

about:Button("俄亥俄州3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua",true))()
end)

about:Button("俄亥俄州4",function()
loadstring(game:HttpGet("https://pastefy.app/QbXPfsgC/raw"))()
end)

about:Button("俄亥俄州5",function()
loadstring(game:HttpGet("https://pastebin.com/raw/hkvHeHed",true))()
end)

about:Button("指令",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))()
end)



about:Label("在聊天框输入")
about:Label("透开—透关")
about:Label("追踪开—追踪关")
about:Label("收钱开—收钱关")
about:Label("收物开—收物关")
about:Label("抢取款机开—抢取款机关")
about:Label("抢银行开—抢银行关")
about:Label("穿墙开—穿墙关")



local UITab9 = win:Tab("『骨折VI』",'16060333448')

local about = UITab9:section("『骨折VI』",true)

about:Button("骨折VI  1",function()
loadstring(game:HttpGet('https://pastebin.com/raw/5rEAVmcC'))()
end)

local UITab10 = win:Tab("『其他作者』",'16060333448')

local about = UITab10:section("『其他作者』",true)

about:Button("山脚本",function()
    loadstring(game:HttpGet("https://h.lkmc.asia/script/ssfb.lua"))()
end)
about:Button("青脚本",function()
    loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()
end)
about:Button("陈脚本",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/QxDD9SpW"))()
end)
about:Button("杯脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/llcq"))()
end)
about:Button("北极脚本『中心』",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV",true))()
end)
about:Button("地岩脚本",function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\98\97\109\120\98\98\97\109\120\98\98\97\109\120\47\99\111\100\101\115\112\97\99\101\115\45\98\108\97\110\107\47\109\97\105\110\47\37\69\55\37\57\57\37\66\68\34\41\41\40\41")()
end)
about:Button("导管中心",function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
end)
about:Button("脚本中心1.5版本",function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
end)
about:Button("玖恶脚本",function()
    loadstring(game:HttpGet('https://ayangwp.cn/api/v3/file/get/8508/%E7%8E%96%E6%81%B6%E4%B8%AD%E5%BF%83.lua?sign=wt54yWf_f0LDB3gXXyQu0SFQ0oUDUXZBOaWQShwCFGg%3D%3A0'))()
end)
about:Button("老大脚本",function()
    loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8401/%E8%80%81%E5%A4%A7%E8%84%9A%E6%9C%AC1.0%E7%89%88.txt?sign=XHxQ1ja8djAnEjVEG-eEZFPeZKFHJ0FHeybHpSbtBW4%3D%3A0"))()
end)
about:Button("乌云脚本",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/dT4ZGge8"))()
end)
about:Button("皇脚本",function()
    loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8577/%E7%9A%87v5.txt?sign=ToDT3Udyh4r3WwDu_yVblRL849qC2GJjjjQ7FTidF_w%3D%3A0"))()
end)
about:Button("冰红茶脚本",function()
    loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8582/Protected_9297682332119129.lua?sign=jP-h1AGooC90C0A0O5eDboOCoaQTZpOzLoWzg_oz1eE%3D%3A0"))()
end)
about:Button("静新脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/ggff/main/%E5%B8%85%E9%94%85%E4%B8%80%E6%9E%9A%E5%B0%8F%E5%8F%AF%E7%88%B1%E5%91%80%E5%8F%91%E8%B4%A7%E5%A5%BD%E7%9A%84%E5%90%83%E4%B8%8D%E5%90%83%E8%AE%B0%E5%BE%97%E8%AE%B0%E5%BE%97%E4%BD%A0%E6%96%B9%E4%BE%BF%E6%89%93%E5%BC%80%E7%94%B5%E8%84%91%E6%96%B9%E4%B8%8D%E6%96%B9%E4%BE%BF%E8%AE%B0%E5%BE%97%E9%83%BD%E8%A7%81%E4%B8%8D%E5%88%B0%E6%96%B9%E4%BE%BF%E7%9A%84%E8%AF%9D%E6%89%8B%E6%9C%BA%E6%96%B9%E4%B8%8D%E6%96%B9%E4%BE%BF%E5%B0%B1"))()
end)
about:Button("小魔脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaomoNB666/xiaomoNB666/main/%E6%9E%81.lua"))()
end)
about:Button("鲨新ui脚本",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fvvhhh/sturdy-octo-engine/main/Protected_1221338743706560.lua.txt"))()
end)
about:Button("雷脚本",function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/tPB47inG')))()
end)

local UITab11 = win:Tab("『蜂群模拟器』",'16060333448')

local about = UITab11:section("『蜂群模拟器』",true)

about:Button("丁汉化",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/jjding/main/%E4%B8%81%E4%B8%81%E8%9C%82%E7%BE%A4%E6%A8%A1%E6%8B%9F%E5%99%A8.txt"))()
end)

about:Button("最强",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/rhnrn/main/%E8%9C%82%E7%BE%A4%E8%84%9A%E6%9C%ACato%E6%B1%89%E5%8C%96.txt"))()
end)

about:Button("蜂群模拟器1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Historia00012/HISTORIAHUB/main/BSS%20FREE"))()
end)

about:Button("蜂群模拟器2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/max0mind/lua/main/loader.lua'))()
end)

local UITab12 = win:Tab("『小偷模拟器』",'16060333448')

local about = UITab12:section("『小偷模拟器』",true)

about:Button("小偷模拟器",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/adrician/Thief-Simulator---GUI/main/Thief%20sim.lua"),true))()
end)

local UITab13 = win:Tab("『寻宝模拟器』",'16060333448')

local about = UITab13:section("『寻宝模拟器』",true)

about:Button("寻宝模拟器",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/gghb/main/%E4%B8%81%E4%B8%81%E5%AF%BB%E5%AE%9D.txt"))()
end)

local UITab14 = win:Tab("『法宝模拟器』",'16060333448')

local about = UITab14:section("『法宝模拟器』",true)

about:Button("法宝模拟器汉化",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/zhanghuihuihuil/Script/main/%E6%B3%95%E5%AE%9D%E6%A8%A1%E6%8B%9F%E5%99%A8%E6%B1%89%E5%8C%96'))()
end)

about:Button("法宝模拟器",function()
loadstring(game:HttpGet("https://pastefy.app/9bGpv4H3/raw"))()
end)
 
local UITab15 = win:Tab("『一路向西』",'16060333448')

local about = UITab15:section("『一路向西』",true)

about:Button("一路向西1",function()
loadstring(game:HttpGet("https://pastefy.app/q08owYGG/raw"))()
end)

about:Button("一路向西2",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Drifter0507/scripts/main/westbound"),true))()
end)

local UITab16 = win:Tab("『餐厅大亨』",'16060333448')

local about = UITab16:section("『餐厅大亨』",true)

about:Button("餐厅大亨1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/toosiwhip/snake-hub/main/restaurant-tycoon-2.lua"))()
end)

about:Button("餐厅大亨2",function()
loadstring(game:HttpGet("https://pastefy.app/Ppqt0Gib/raw"))()
end)

local UITab17 = win:Tab("『河北唐县』",'16060333448')

local about = UITab17:section("『河北唐县』",true)
 
about:Button("河北唐县1",function()
loadstring(game:HttpGet("https://pastefy.app/s20nni0h/raw"))()
end)

about:Button("河北唐县2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Tang%20Country.lua"))()
end)

local UITab18 = win:Tab("『模仿者』",'16060333448')

local about = UITab18:section("『模仿者』",true)

about:Button("模仿者1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ttjy9808/obfloadstringmainmimic/main/README.md", true))()
end)

local UITab19 = win:Tab("『自然灾害模拟器』",'16060333448')

local about = UITab19:section("『自然灾害模拟器』",true)

about:Button("丁",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ghb/main/%E4%B8%81%E4%B8%81%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3.txt"))()
end)

about:Button("自然灾害模拟器1",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/TurkOyuncu99/7c75386107937fa006304efd24543ad4/raw/8d759dfcd95d39949c692735cfdf62baec0bf835/cafwetweg", true))()
end)

about:Button("自然灾害模拟器2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
end)

about:Button("自然灾害模拟器3",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main'))()
end)

local UITab20 = win:Tab("『进击的僵尸』",'16060333448')

local about = UITab20:section("『进击的僵尸』",true)

about:Button("进击的僵尸",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Zombie%20Attack", true))()
end)

about:Button("自瞄",function()
loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()
end)

local UITab21 = win:Tab("『伐木大亨2』",'16060333448')

local about = UITab21:section("『伐木大亨2』",true)

about:Button("丁参",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/kdmd/main/%E4%B8%81%E4%B8%81%E4%B8%8E%E5%8F%82%E5%A4%A9%20%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A8.txt"))()
end)

about:Button("最强",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
end)

about:Button("伐木大亨2  1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Kavo-Ui/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A82.lua", true))()
end)

about:Button("伐木大亨2  2",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/NOOBARMYSCRIPTER/NOOBARMYSCRIPTER/main/AXE%20LOOP%20SCRIPT"), true))()
end)

about:Button("伐木大亨2  3",function()
loadstring(game:HttpGet('https://getexploits.com/key-system/',true))('https://da.com/936657404291084298/1006220505583460352/Script.txt')
end)

about:Button("伐木大亨2  4",function()
loadstring(game:HttpGet("https://pastebin.com/raw/Q7seVBTV"))()
end)

local UITab22 = win:Tab("『内脏与黑火药』",'16060333448')

local about = UITab22:section("『内脏与黑火药』",true)

about:Button("茗月清风 可能会被删库",function()
loadstring(game:HttpGet(("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\120\99\115\114\49\49\52\53\49\52\47\115\120\99\115\114\49\49\52\53\49\52\49\47\109\97\105\110\47\115\120\99\115\114\49\51\52\56\52\56\52\56\56\46\108\117\97"),true))()
end)

about:Button("牢大脚本",function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")()
end)

local UITab23 = win:Tab("『汽车经销大亨』",'16060333448')

local about = UITab23:section("『汽车经销大亨』",true)

about:Button("汽车经销大亨1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/Car%20Dealership%20Tycoon.lua"))()
end)

about:Button("汽车经销大亨2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/03sAlt/BlueLockSeason2/main/README.md"))()
end)

about:Button("汽车经销大亨3",function()
loadstring(game:HttpGet("https://pastefy.app/5o594Q0i/raw"))()
end)

local UITab24 = win:Tab("『兵工厂』",'16060333448')

local about = UITab24:section("『兵工厂』",true)

about:Button("兵工厂1",function()
loadstring(game:HttpGet("https://pastefy.app/2YdrWHxV/raw"))()
end)

about:Button("兵工厂2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Arsenal/MainFile"))()
end)

about:Button("兵工厂3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"))()
end)

about:Button("兵工厂4",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init'), true))()
end)

local UITab25 = win:Tab("『超级足球联赛』",'16060333448')

local about = UITab25:section("『超级足球联赛』",true)

about:Button("超级足球联赛1",function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/xtrey10x/xtrey10x-hub/main/neo")()
end)

about:Button("超级足球联赛2",function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/8fdf7c482d3b3d108ccdb282a7fc35e2.lua"))()
end)

local UITab26 = win:Tab("『钓鱼模拟器』",'16060333448')

local about = UITab26:section("『钓鱼模拟器』",true)

about:Button("钓鱼模拟器1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/bebedi15/SRM-Scripts/main/Bebedi9960/SRMHub"))()
end)

about:Button("钓鱼模拟器2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ggghjn/main/%E4%B8%81%E4%B8%81%E9%92%93%E9%B1%BC%E6%A8%A1%E6%8B%9F%E5%99%A8.txt"))()
end)

about:Button("钓鱼模拟器3",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/_Loader'))()
end)

local UITab27 = win:Tab("『战争大亨』",'16060333448')

local about = UITab27:section("『战争大亨』",true)

about:Button("战争大亨1",function()
loadstring(game:HttpGet'https://raw.githubusercontent.com/Macintosh1983/ChillHubMain/main/ChillHubOilWarfareTycoon.lua')()
end)

local UITab28 = win:Tab("『BF』",'16060333448')

local about = UITab28:section("『BF』",true)

about:Button("BF 『汉化』",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Xiao-Yun-UWU/main/%E6%B5%B7%E8%B4%BC%E7%8E%8Bbf.lua", true))()
end)

about:Button("最强",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AkiraNus/UniquehubKak/main/FreeCr.Xenonhub"))()
end)

about:Button("刷怪",function()
loadstring(game:HttpGet('https://rawscripts.net/raw/UPDATE-16-Blox-Fruits-Nub-V1-Hub-4583'))()
end)

about:Button("自动升级",function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/xDepressionx/Free-Script/main/AllScript.lua")()
end)

about:Button("自动箱子",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
end)

about:Button("找的",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptsExploit/Blox-Fruits/main/Ripper%20M"))()
end)

about:Button("超强",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumMobile/main/UraniumKak.lua"))()
end)

about:Button("BF『HOHO脚本』1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HohoV2/Free/BloxFruitFreeV3.lua"))()
end)

about:Button("BF『HOHO脚本』2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
end)


about:Label("卡密自己去DC")


local UITab29 = win:Tab("『动感星期五』",'16060333448')

local about = UITab29:section("『动感星期五』",true)

about:Button("动感星期五1",function()
loadstring(game:HttpGet("https://scriptblox.com/raw/XMAS-Event-or-Funky-Friday-Auto-Player-Mobile-6721"))()
end)

about:Button("动感星期五2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua",true))()
end)

about:Button("动感星期五3",function()
loadstring(game:HttpGet("https://scriptblox.com/raw/XMAS-Event-or-Funky-Friday-Auto-Player-Mobile-6721"))()
end)

local UITab30 = win:Tab("『监狱人生』",'16060333448')

local about = UITab30:section("『监狱人生』",true)

about:Button("丁传",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/li/main/%E4%B8%81%E4%B8%81%E7%9B%91%E7%8B%B1.lua"))()
end)

about:Button("手里剑秒杀",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/jian"))()
end)

about:Button("监狱人生1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/gjbde/main/%E4%B8%81%E4%B8%81%E7%9B%91%E7%8B%B1%E4%BA%BA%E7%94%9F.txt"))()
end)

about:Button("监狱人生2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dalloc2/Roblox/main/TigerAdmin.lua"))()
end)

about:Button("监狱人生3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
end)

local UITab31 = win:Tab("『杀手与警长』",'16060333448')

local about = UITab31:section("『杀手与警长』",true)

about:Button("杀手与警长1",function()
loadstring(game:HttpGet("https://pastebin.com/raw/yadbPQUm",true))()
end)

local UITab32 = win:Tab("『巴掌模拟器』",'16060333448')

local about = UITab32:section("『巴掌模拟器』",true)

about:Toggle("无CD","Toggle" ,false, function(Value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
    
    bazhangmnq = Value
    
    while bazhangmnq do
    local localscript = tool:FindFirstChildOfClass("LocalScript")
    local localscriptclone = localscript:Clone()
    localscriptclone = localscript:Clone()
    localscriptclone:Clone()
    localscript:Destroy()
    localscriptclone.Parent = tool
    wait(0.1)
    end
    end)
    
    about:Button("获取计数器手套", function()
    fireclickdetector(game.Workspace.CounterLever.ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
    wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(121)
    for i,v in pairs(workspace.Maze:GetDescendants()) do
    if v:IsA("ClickDetector") then
    fireclickdetector(v)
    end
    end
    end)
    
    about:Toggle("地牢亮度","Toggle" ,false, function(Value)
     Light = Value
        if not Light then
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end)
    
    about:Dropdown("传送","Dropdown",{"安全区","竞技场","埃及岛","果实岛","盘子","锦标赛","默认竞技场"},function(Value)
    if Value == "安全区" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Spot.CFrame * CFrame.new(0,40,0)
    elseif Value == "竞技场" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
    elseif Value == "埃及岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215, -15.5, 0.5)
    elseif Value == "果实岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0,3.25,0)
    elseif Value == "盘子" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
    elseif Value == "锦标赛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
    elseif Value == "默认竞技场" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,360,-3)
    end
    end)
    
    about:Toggle("复古技能","Toggle" ,false, function(Value)
    RetroSpam = Value
    while RetroSpam do
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
    task.wait()
    end
    end)
    
    about:Dropdown("复古技能选择","Dropdown",{"Rocket Launcher","Ban Hammer","Bomb"}, function(Value)
    RetroAbility = Value
    end)
    
    about:Toggle("自动捡糖果","Toggle",false, function(Value)
    CandyCornFarm = Value
    while CandyCornFarm do
    for i, v in pairs(workspace.CandyCorns:GetChildren()) do
                    if v:FindFirstChildWhichIsA("TouchTransmitter") then
    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
    task.wait()
    end
    end)
    
    about:Toggle("获取炼金术师材料","Toggle", false, function(Value)
    AlchemistIngredients = Value
    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
    while AlchemistIngredients do
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Mushroom")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Glowing Mushroom")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Fire Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Winter Rose")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dark Root")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dire Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Autumn Sprout")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Elder Wood")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Hazel Lily")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Wild Vine")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Jade Stone")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Lamp Grass")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Plane Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blood Rose")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Red Crystal")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blue Crystal")
    task.wait()
    end
    end
    end)
    
    about:Toggle("自动加入竞技场","Toggle", false, function(Value)
    AutoEnterArena = Value
    while AutoEnterArena do
    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
        end
    task.wait()
    end
    end)
    
    about:Toggle("自动光波球","Toggle", false, function(Value)
    if Person == nil then
    Person = game.Players.LocalPlayer.Name
    end
    _G.RojoSpam = Value
    while _G.RojoSpam do
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
    task.wait()
    end
    end)
    
    about:Button("Rojo技能", function(Value)
    _G.RojoSpam = Value
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
    wait(6)
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
    task.wait()
    end)
    
    about:Toggle("音符技能","Toggle", false, function(Value)
    _G.RhythmSpam = Value
    while _G.RhythmSpam do
    game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0)
    task.wait()
    end
    end)
    
    about:Toggle("Null技能","Toggle", false, function(Value)
    NullSpam = Value
    while NullSpam do
    game:GetService("ReplicatedStorage").NullAbility:FireServer()
    task.wait()
    end
    end)
    
    about:Toggle("自动拾取黄金果实","Toggle", false, function(Value)
    SlappleFarm = Value
    while SlappleFarm do
    for i, v in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Glove" and v:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
    task.wait()
    end
    end)
    
    about:Toggle("自动捡飞行宝珠","Toggle", false, function(Value)
    Jetfarm = Value
    while Jetfarm do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "JetOrb" and v:FindFirstChild("TouchInterest") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("自动捡相位球","Toggle", false, function(Value)
    Phasefarm = Value
    while Phasefarm do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "PhaseOrb" and v:FindFirstChild("TouchInterest") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("自动刷bob","Toggle", false, function(Value)
    ReplicaFarm = Value
    while ReplicaFarm do
    for i, v in pairs(workspace:GetChildren()) do
                    if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
    game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                    end
                end
    task.wait()
    game:GetService("ReplicatedStorage").Duplicate:FireServer()
    task.wait(7)
    end
    end)
    
    about:Toggle("无限反转","Toggle", false, function(Value)
    _G.InfReverse = Value
    while _G.InfReverse do
    game:GetService("ReplicatedStorage").ReverseAbility:FireServer()
    wait(6)
    end
    end)
    
    about:Toggle("彩虹角色(装备黄金手套)","Toggle", false, function(Value)
    _G.Rainbow = Value
    while _G.Rainbow do
    for i = 0,1,0.001*25 do
    game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(Color3.fromHSV(i,1,1)))
    task.wait()
    end
    end
    end)
    
    about:Toggle("防击飞","Toggle", false, function(Value)
    AntiRagdoll = Value
    if AntiRagdoll then
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
    if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
    repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
    until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
    game.Players.LocalPlayer.Character.Torso.Anchored = false
    end
    end)
    end)
    end
    end)
    
    about:Toggle("反虚空(锦标赛也有效果)","Toggle", false, function(Value)
    game.Workspace.dedBarrier.CanCollide = Value
    game.Workspace.TAntiVoid.CanCollide = Value
    end)

about:Toggle("防死亡屏障","Toggle", false, function(Value)
    if Value == true then
    for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                        if v.ClassName == "Part" and v.Name == "BLOCK" then
                            v.CanTouch = false
                        end
                    end
    workspace.DEATHBARRIER.CanTouch = false
    workspace.DEATHBARRIER2.CanTouch = false
    workspace.dedBarrier.CanTouch = false
    workspace.ArenaBarrier.CanTouch = false
    workspace.AntiDefaultArena.CanTouch = false
    else
    for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                        if v.ClassName == "Part" and v.Name == "BLOCK" then
                            v.CanTouch = true
                        end
                    end
    workspace.DEATHBARRIER.CanTouch = true
    workspace.DEATHBARRIER2.CanTouch = true
    workspace.dedBarrier.CanTouch = true
    workspace.ArenaBarrier.CanTouch = true
    workspace.AntiDefaultArena.CanTouch = true
    end
    end)
    
    about:Toggle("反巴西","Toggle", false, function(Value)
    if Value == true then
    for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                            v.CanTouch = false
                    end
    else
    for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                            v.CanTouch = true
                    end
    end
    end)
    
    about:Toggle("反死亡方块","Toggle", false, function(Value)
    if Value == true then
            workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
            else
                    workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
            end
    end)
    
    about:Toggle("反上帝技能","Toggle", false, function(Value)
    AntiTimestop = Value
    while AntiTimestop do
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v.ClassName == "Part" then
                            v.Anchored = false
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("反鱿鱼","Toggle", false, function(Value)
    AntiSquid = Value
    if AntiSquid == false then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
            end
    while AntiSquid do
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
    end
    task.wait()
    end
    end)
    
    about:Toggle("反神圣杰克","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value
    end)
    
    about:Toggle("反传送带","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value
    end)
    
    about:Toggle("反板砖","Toggle", false, function(Value)
    AntiBrick = Value
    while AntiBrick do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Union" then
                            v.CanTouch = false
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("反Null","Toggle", false, function(Value)
    AntiNull = Value
    while AntiNull do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Imp" and v:FindFirstChild("Body") then
    shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
    end
    end
    task.wait()
    end
    end)
    
about:Button("自动刷巴掌",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Farm'))()
end)

about:Button("巴掌模拟器1",function()
loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))()
end)

about:Button("巴掌模拟器2",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
end)

about:Button("巴掌模拟器3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
end)

local UITab33 = win:Tab("『51区』",'16060333448')

local about = UITab33:section("『51区』",true)

about:Button("51区  1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Saktk-In-Area51/main/Area51", true))()
end)

local UITab34 = win:Tab("『短信模拟器』",'16060333448')

local about = UITab34:section("『短信模拟器』",true)

about:Button("短信模拟器1",function()
loadstring(game:HttpGet(('https://pastebin.com/raw/9hxkxUZ5'),true))()
end)

local UITab35 = win:Tab("『克隆大亨』",'16060333448')

local about = UITab35:section("『克隆大亨』",true)

about:Button("克隆大亨1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HELLLO1073/RobloxStuff/main/CT-Destroyer"))()
end)

local UITab36 = win:Tab("『刀刃球』",'16060333448')

local about = UITab36:section("『刀刃球』",true)

about:Button("丁",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ghbdrc/main/%E4%B8%81%E4%B8%81%E5%88%80%E5%88%83%E7%90%83.txt"))()
end)

about:Button("刀刃球1",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Unknownkellymc1/Unknownscripts/main/slap-battles')))()
end)

about:Button("刀刃球2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/redz9999"))()
end)

about:Button("刀刃球3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Neoncat765/Neon.C-Hub-X/main/UnknownVersion"))()
end)

about:Button("刀刃球4",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HKLua/Balls/main/DawnLoader.lua"))()
end)

local UITab37 = win:Tab("『战斗勇士』",'16060333448')

local about = UITab37:section("『战斗勇士』",true)

about:Button("战斗勇士1",function()
loadstring(game:HttpGet("https://paste.gg/p/anonymous/697fc3cad5f743508318cb7399e89432/files/b5923e52edab4e5c91e46b74563d0ae8/raw"))()
end)

about:Button("战斗勇士2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))()
end)

local UITab38 = win:Tab("『背上只因剑』",'16060333448')

local about = UITab38:section("『背上只因剑』",true)

about:Button("背上只因剑1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0SwordWarriors"))()
end)

about:Button("背上只因剑2",function()
loadstring(game:HttpGet(('https://gist.githubusercontent.com/blox-hub-roblox/021bad62bbc6a0adc4ba4e625f9ad7df/raw/c89af6e1acf587d09e4ce4bc7510e7100e0c0065/swordWarrior.lua'),true))()
end)

local UITab39 = win:Tab("『彩虹朋友』",'16060333448')

local about = UITab39:section("『彩虹朋友』",true)

about:Button("彩虹朋友1",function()
loadstring(game:HttpGet("https://pastefy.app/XoNv04vR/raw"))()
end)

local UITab40 = win:Tab("『破坏者谜团2』",'16060333448')

local about = UITab40:section("『破坏者谜团2』",true)

about:Button("破坏者谜团2  1",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Ethanoj1/EclipseMM2/master/Script"),true))()
end)

local UITab41 = win:Tab("『EVAde  大逃脱』",'16060333448')

local about = UITab41:section("『EVAde  大逃脱』",true)

about:Button("大逃脱1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/PepesGH1/stuff/main/evadeloader.lua"))()
end)

about:Button("大逃脱2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/%E4%BA%91%E8%84%9A%E6%9C%ACEvade.lua"))()
end)

local UITab42 = win:Tab("『国王遗产』",'16060333448')

local about = UITab42:section("『国王遗产』",true)

about:Button("国王遗产1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sannin9000/scripts/main/kinglegacy.lua"))()
end)

about:Button("国王遗产2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/legacy"))()
end)

about:Button("国王遗产3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hajibeza/RIPPER-HUB/main/King%20Leagacy"))()
end)

local UITab43 = win:Tab("『造船寻宝』",'16060333448')

local about = UITab43:section("『造船寻宝』",true)

about:Button("造船寻宝1",function()
loadstring(game:HttpGet("http://dirtgui.xyz/BuildABoat.lua",true))()
end)

about:Button("造船寻宝2",function()
loadstring(game:HttpGet("https://pastefy.app/hvV1c4nO/raw"))()
end)

about:Button("复制别人的船",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
end)

about:Button("刷钱",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/urmomjklol69/GoldFarmBabft/main/GoldFarm.lua'),true))()
end)

local UITab44 = win:Tab("『鲨口求生』",'16060333448')

local about = UITab44:section("『鲨口求生』",true)

about:Button("鲨口求生1",function()
loadstring(game:HttpGet("https://pastebin.com/raw/YYVLbzVg", true))()
end)

local UITab45 = win:Tab("『破坏模拟器』",'16060333448')

local about = UITab45:section("『破坏模拟器』",true)

about:Button("破坏模拟器1",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/AquaModz/DestructionSIMModded/main/DestructionSimAqua.lua'))()
end)

local UITab46 = win:Tab("『驾驶帝国』",'16060333448')

local about = UITab46:section("『驾驶帝国』",true)

about:Button("驾驶帝国1",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))()
end)

about:Button("驾驶帝国2",function()
loadstring(game:HttpGet("https://soggyhubv2.vercel.app"))()
end)

local UITab47 = win:Tab("『飞行比赛』",'16060333448')

local about = UITab47:section("『飞行比赛』",true)

about:Button("飞行比赛1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NightCoded/script/main/fly-race.lua"))()
end)

local UITab48 = win:Tab("『超级大力士模拟器』",'16060333448')

local about = UITab48:section("『超级大力士模拟器』",true)

about:Button("传送到开始区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.86943817138672, 11.751949310302734, -198.07127380371094)
    end)
    
about:Button("传送到健身区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93.60747528076172, 11.751947402954102, -10.266206741333008)
    end)
    
about:Button("传送到食物区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.86384582519531, 11.751947402954102, 228.9690399169922)
    end)
    
about:Button("传送到街机区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.99887084960938, 11.751949310302734, 502.90997314453125)
    end)
    
about:Button("传送到农场区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.6707763671875, 11.751947402954102, 788.5997314453125)
    end)
    
about:Button("传送到城堡区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.87281036376953, 11.84177017211914, 1139.7509765625)
    end)
    
about:Button("传送到蒸汽朋克区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92.63227081298828, 11.841767311096191, 1692.7890625)
    end)
    
about:Button("传送到迪斯科区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98.69613647460938, 16.015085220336914, 2505.213134765625)
    end)
    
about:Button("传送到太空区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.42948150634766, 11.841769218444824, 3425.941650390625)
    end)
    
about:Button("传送到糖果区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.55805969238281, 11.841663360595703, 4340.69921875)
    end)
    
about:Button("送到实验室区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.00920867919922, 11.841663360595703, 5226.60205078125)
    end)
    
about:Button("传送到热带区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80.26090240478516, 12.0902681350708, 6016.16552734375)
    end)
    
about:Button("传送到恐龙区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(38.4753303527832, 25.801530838012695, 6937.779296875)
    end)
    
about:Button("传送到复古区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.81867218017578, 12.89099407196045, 7901.74755859375)
    end)
    
about:Button("传送到冬季区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.47243881225586, 11.841662406921387, 8983.810546875)
    end)
    
about:Button("传送到深海区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105.36250305175781, 26.44820213317871, 9970.0849609375)
    end)
    
about:Button("传送到狂野西部区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(68.69414520263672, 15.108586311340332, 10938.654296875)
    end)
    
about:Button("传送到豪华公寓区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.75145721435547, 11.313281059265137, 12130.349609375)
    end)
    
about:Button("传送到宝剑战斗区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111.25597381591797, 11.408829689025879, 12945.57421875)
    end)
    
about:Button("传送到童话区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121.14932250976562, 11.313281059265137, 14034.50390625)
    end)
    
about:Button("传送到桃花区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(108.2142333984375, 11.813281059265137, 15131.861328125)
    end)
    
about:Button("传送到厨房区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.78338623046875, 21.76291847229004, 16204.9755859375)
    end)
    
about:Button("传送到下水道区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(47.36086654663086, 12.25178050994873, 17656.04296875)
    end)
    
about:Button("超级大力士模拟器1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0strongman", true))()
end)

about:Button("超级大力士模拟器2",function()
loadstring(game:HttpGet("https://pastefy.app/aO18ZEB9/raw"))()
end)

local UITab49 = win:Tab("『举重模拟器』",'16060333448')

local about = UITab49:section("『举重模拟器』",true)

about:Button("举重模拟器1",function()
loadstring(game:HttpGet("https://pastefy.app/KSriAk53/raw"))()
end)

local UITab50 = win:Tab("『拳击模拟器』",'16060333448')

local about = UITab50:section("『拳击模拟器』",true)

about:Button("拳击模拟器1",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Solx69/Shit-Boy-Hub-Main/main/Master.lua'))()
end)

about:Button("拳击模拟器2",function()
 loadstring(game:HttpGet("https://pastefy.app/T4O1SA3q/raw"))()
end)

local UITab51 = win:Tab("『奎尔湖』",'16060333448')

local about = UITab51:section("『奎尔湖』",true)

about:Button("奎尔湖1",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Solx69/Shit-Boy-Hub-Main/main/Master.lua'))()
end)

about:Toggle("无敌模式","", false, function(Value)
        game.ReplicatedStorage.DamageHumanoid:FireServer(-2e9)
    end)
    
    about:Button("无限金钱", function()
    local money = {
       [1] = -9999,
       [2] = "Buy"
    }
    
    game:GetService("ReplicatedStorage").Pay:FireServer(unpack(money))
    end)
    
    about:Button("无限金币", function()
    local gold = {
       [1] = game:GetService("Players").LocalPlayer.GoldCoins,
       [2] = 99999
    }
    
    game:GetService("ReplicatedStorage").ChangeValue:FireServer(unpack(gold))
    end)
    
    about:Button("给所有物品", function()
    game.ReplicatedStorage.GiveTool:FireServer("SeaScooter")
    game.ReplicatedStorage.GiveTool:FireServer("Lantern")
    game.ReplicatedStorage.GiveTool:FireServer("Compass")
    game.ReplicatedStorage.GiveTool:FireServer("ItemFinder")
    game.ReplicatedStorage.GiveTool:FireServer("Aquabreather")
    end)
    
    about:Button("红色套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("FireSuit")
    end)
    
    about:Button("黄色套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("HazmatSuit")
    end)
    
    about:Button("海盗套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("PirateCostume")
    end)
    
    about:Button("动力套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("SuperScuba")
    end)
    
local UITab52 = win:Tab("『我的餐厅』",'16060333448')

local about = UITab52:section("『我的餐厅』",true)

about:Button("我的餐厅1",function()
loadstring(game:HttpGet("https://pastefy.app/5R1Ch6kk/raw"))()
end)

about:Button("我的餐厅2",function()
loadstring(game:HttpGet("http://void-scripts.com/Scripts/myRest.lua"))()
end)

local UITab53 = win:Tab("『旗帜战争』",'16060333448')

local about = UITab53:section("『旗帜战争』",true)

about:Button("旗帜战争1",function()
loadstring(game:HttpGet("https://pastefy.app/otEg6PJV/raw"))()
end)

about:Button("旗帜战争2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Flag%20Wars.txt'))()
end)

local UITab54 = win:Tab("『COOP 合作社』",'16060333448')

local about = UITab54:section("『COOP 合作社』",true)

about:Button("丁 参",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/chvv/main/%E4%B8%81%E4%B8%81coop.txt"))()
end)

local UITab55 = win:Tab("『冲突之海』",'16060333448')

local about = UITab55:section("『冲突之海』",true)

about:Button("丁 参",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/dhh/main/%E4%B8%81%E4%B8%81%E5%86%B2%E7%AA%81%E4%B9%8B%E6%B5%B7.txt"))()
end)

local UITab56 = win:Tab("『怪兽宇宙』",'16060333448')

local about = UITab56:section("『怪兽宇宙』",true)

about:Button("怪兽宇宙1",function()
loadstring(game:HttpGet("https://pastefy.app/oRWEIEcJ/raw"))()
end)

local UITab57 = win:Tab("『恐怖奶奶』",'16060333448')

local about = UITab57:section("『恐怖奶奶』",true)

about:Button("恐怖奶奶1",function()
loadstring(game:HttpGet("https://pastefy.app/o688Jvmn/raw"))()
end)

local UITab58 = win:Tab("『奶酪逃亡』",'16060333448')

local about = UITab58:section("『奶酪逃亡』",true)

about:Button("奶酪逃亡1",function()
loadstring(game:HttpGet("https://pastefy.app/IIpzN8f5/raw"))()
end)

local UITab59 = win:Tab("『极速奔驰』",'16060333448')

local about = UITab59:section("『极速奔驰』",true)

about:Button("极速奔驰1",function()
loadstring(game:HttpGet("https://pastefy.app/Y7607jwb/raw"))()
end)

local UITab60 = win:Tab("『射击光束模拟器』",'16060333448')

local about = UITab60:section("『射击光束模拟器』",true)

about:Button("射击光束模拟器1",function()
loadstring(game:HttpGet("https://pastefy.app/51yMuaCc/raw"))()
end)

local UITab61 = win:Tab("『合并滴管』",'16060333448')

local about = UITab61:section("『合并滴管』",true)

about:Button("合并滴管1",function()
loadstring(game:HttpGet("https://pastefy.app/NpBrBCqM/raw"))()
end)

local UITab62 = win:Tab("『火箭发射模拟器』",'16060333448')

local about = UITab62:section("『火箭发射模拟器』",true)

about:Button("丁 参",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/-/main/%E4%B8%81%E4%B8%81%E7%81%AB%E7%AE%AD.lua"))()
end)

about:Button("火箭发射模拟器1",function()
loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9245/%E7%8C%AB%E9%80%9A%E7%94%A8.txt?sign=hrWROZdVfK2mtJcIFa3Tvbl-TojP1C86_Zd3q03qttc%3D%3A0"))()
end)

about:Button("火箭发射模拟器2",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/dizyhvh/rbx_scripts/main/321_blast_off_simulator')))()
end)

local UITab63 = win:Tab("『感染性微笑』",'16060333448')

local about = UITab63:section("『感染性微笑』",true)

about:Button("感染性微笑1",function()
loadstring(game:HttpGet("https://pastebin.com/raw/WG1BMS72",true))()
end)

about:Button("感染性微笑2",function()
loadstring(game:HttpGet(("https://pastebin.com/raw/mT10xnt7"), true))()
end)

local UITab64 = win:Tab("『铲雪模拟器』",'16060333448')

local about = UITab64:section("『铲雪模拟器』",true)

about:Toggle("自动收集雪","", false, function(Value)
        toggle = Value
    while toggle do wait()
    local args = {
        [1] = workspace:WaitForChild("HitParts"):WaitForChild("Snow1"),
        [2] = "Snow1",
        [3] = "MagicWand"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("e8eGb8RgRXFcug8q"):FireServer(unpack(args))
        end
    end)
    
    about:Toggle("自动出售雪（要传送到指定地方）",   "",false, function(Value)
    toggle = Value
    while toggle do wait()
    local args = {
        [1] = "SellSnow",
        [2] = "Frosty"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        end
    end)
    
    about:Button("传送出售雪的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.4659423828125, 15.846257209777832, -66.55204010009766)
    end)
    
    about:Button("传送买车的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.10160064697266, 16.051794052124023, -141.703125)
    end)
    
    about:Button("传送买工具的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.7429962158203, 16.39700698852539, -12.935890197753906)
    end)
    
    about:Button("传送买背包的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(348.6633605957031, 17.03822898864746, -16.793842315673828)
    end)
    
    about:Button("传送买假日礼物的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(154.57424926757812, 16.215335845947266, 147.10423278808594)
    end)
    
    about:Button("传送买宠物的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.49563598632812, 17.887277603149414, 278.3686218261719)
    end)
    
    about:Button("传送超大铲雪的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-391.4309997558594, 15.84949016571045, 150.15187072753906)
    end)

local UITab64 = win:Tab("『一个普通的露营故事』",'16060333448')

local about = UITab64:section("『一个普通的露营故事』",true)

about:Button("丁",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/fgg/main/%E4%B8%81%E4%B8%81%E4%B8%80%E4%B8%AA%E6%99%AE%E9%80%9A%E7%9A%84%E5%BD%95%E9%9F%B3%E6%95%85%E4%BA%8B.txt"))()
end)