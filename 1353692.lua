local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ImageDisplayGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "DisplayImage"
imageLabel.Parent = screenGui
imageLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
imageLabel.Position = UDim2.new(0.25, 0, 0.25, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "file:///storage/emulated/0/Android/data/mark.via/cache/content/Image_14835625422883.jpg" -- 替换为图片ID
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
