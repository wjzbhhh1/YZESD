local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ImageDisplayGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "DisplayImage"
imageLabel.Parent = screenGui
imageLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
imageLabel.Position = UDim2.new(0.25, 0, 0.25, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "https://m.baidu.com/sf/vsearch?pd=image_content&word=原神横屏&tn=vsearch&atn=mediacy&fr=tab&sa=vs_tab&imgtype=0&imgcontent={"materialQuery":"","subjectJson":{}}&imgpn=2&imgspn=0&mediacyKey=undefined&tt=1&di=7466852183703552001&pi=0&cs=3524133884,3047267941&bdtype=0&objurl=https://i1.hdslb.com/bfs/archive/4ab07b48ef84fed0be591f5f6b25a3e6ef62db60.jpg&imgos=1018751685,2014092273&imgis=0,0&isRecFrClick=0"
imageLabel.ImageTransparency = 0
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = screenGui
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.45, 0, 0.45, 0)
closeButton.Text = "关闭"
closeButton.TextSize = 20
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
