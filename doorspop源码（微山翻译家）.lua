-- edited by mstudio45 | original by https://v3rmillion.net/member.php?action=profile&uid=1802731 
-- https://v3rmillion.net/showthread.php?tid=1200475

local POOPDOORS_START_TIME = os.time()
local customnotifid = "10469938989"
local oldcustomnotifid = "4590657391"
function waitframes(ii) for i = 1, ii do task.wait() end end

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
function message(text)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 3;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	task.spawn(function()
		local msg = Instance.new("Message",workspace)
		msg.Text = tostring(text)
		task.wait(5)
		msg:Destroy()
	end)
end

function normalmessage(title, text, reason, timee, image, textlabel, waitforinsttodelete)
	task.spawn(function()
		do
			local AchievementsFolder = require(game:GetService("ReplicatedStorage"):WaitForChild("Achievements"))
			if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI") then
				repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI")
			end
			local MainUI =  game.Players.LocalPlayer.PlayerGui.MainUI
			local TweenService = game:GetService("TweenService")

			if title == nil or typeof(title) ~= "string" or string.len(title) == 0 then return end
			if text == nil or typeof(text) ~= "string" or string.len(text) == 0 then return end
			if reason == nil or typeof(reason) ~= "string" or string.len(reason) == 0 then reason = "" end
			if textlabel == nil or typeof(textlabel) ~= "string" then textlabel = "NOTIFICATION" end
			if timee == nil or timee == 0 or typeof(timee) ~= "number" then timee = 5 end
			if image == nil or typeof(image) ~= "string" then 
				image = "6023426923" 
			end

			local AchievementFrame = MainUI.AchievementsHolder.Achievement:Clone();
			AchievementFrame.Size = UDim2.new(0, 0, 0, 0);
			AchievementFrame.Frame.Position = UDim2.new(1.1, 0, 0, 0);
			AchievementFrame.Name = "LiveAchievement";
			AchievementFrame.Visible = true;

			AchievementFrame.Frame.TextLabel.Text = textlabel
			if textlabel == "WARNING" then AchievementFrame.Frame.TextLabel.TextColor3 = Color3.fromRGB(175, 0, 0);AchievementFrame.Frame.UIStroke.Color = Color3.fromRGB(175, 0, 0);AchievementFrame.Frame.Glow.ImageColor3 = Color3.fromRGB(175, 0, 0); end
			AchievementFrame.Frame.Details.Desc.Text = tostring(text)
			AchievementFrame.Frame.Details.Title.Text = tostring(title)
			AchievementFrame.Frame.Details.Reason.Text = tostring(reason or "")

			AchievementFrame.Frame.ImageLabel.Image = "rbxassetid://"..tostring(image or "0")

			AchievementFrame.Parent = MainUI.AchievementsHolder;
			AchievementFrame.Sound.SoundId = "rbxassetid://"..customnotifid
			if textlabel == "WARNING" then AchievementFrame.Sound.Volume = 2 else AchievementFrame.Sound.Volume = 1 end
			AchievementFrame.Sound:Play();
			if textlabel == "WARNING" then AchievementFrame:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.3, true); else AchievementFrame:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true); end
			if textlabel == "WARNING" then wait(0.3) else wait(0.8) end
			AchievementFrame.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true);
			TweenService:Create(AchievementFrame.Frame.Glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				ImageTransparency = 1
			}):Play()
			if waitforinsttodelete ~= nil and typeof(waitforinsttodelete) == "Instance" then
				waitforinsttodelete.Destroying:Wait()
			else
				wait(timee)
			end
			AchievementFrame.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true)
			wait(0.5)
			AchievementFrame:TweenSize(UDim2.new(1, 0, -0.1, 0), "InOut", "Quad", 0.5, true)
			wait(0.5)
			AchievementFrame:Destroy()
		end
	end)
end
function warnmessage(title, text, reason, timee, image, waitforinsttodelete)
	normalmessage(title, text, reason, timee, image, "WARNING", waitforinsttodelete)
end

function confirmnotification(title, text, timee, callback)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://"..oldcustomnotifid;notif.Volume = 1;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80), Time = timee or 10, Type = "option"},
		{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = callback or function(state)end}
	)
end

function oldnormalmessage(title, text, timee)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://"..oldcustomnotifid;notif.Volume = 1;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "default"}
	)
end 

function oldwarnmessage(title, text, timee)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://"..oldcustomnotifid;notif.Volume = 2;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "image"},
		{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
	)
end
function randomString()local length = math.random(10,20);local array = {};for i = 1, length do array[i] = string.char(math.random(32, 126)) end;return table.concat(array);end

print("Loading path module")

local PathModule = {}
local PathfindingService = game:GetService("PathfindingService")
local VisualizerFolder = game.Workspace:FindFirstChild("PDVisualizer")
if VisualizerFolder == nil then
	VisualizerFolder = Instance.new("Folder", workspace)
	VisualizerFolder.Name = "PDVisualizer"
end
VisualizerFolder:ClearAllChildren()

local VisualizeColors = {
	Normal = Color3.fromRGB(255, 139, 0),
	Jump = Color3.fromRGB(255, 0, 0),
	Finish = Color3.fromRGB(0, 255, 0)
}

function PathModule.visualize(waypoints, waypointSpacing)
	for _, waypoint in ipairs(waypoints) do
		local visualWaypointClone = Instance.new("Part")
		visualWaypointClone.Size = Vector3.new(0.3, 0.3, 0.3)
		visualWaypointClone.Anchored = true
		visualWaypointClone.CanCollide = false
		visualWaypointClone.Material = Enum.Material.Neon
		visualWaypointClone.Shape = Enum.PartType.Ball
		visualWaypointClone.Position = waypoint.Position + Vector3.new(0, 3, 0)
		visualWaypointClone.Color =
			(
				waypoint == waypoints[#waypoints] and VisualizeColors.Finish
				or (waypoint == waypoints[#waypoints-1] and VisualizeColors.Finish)
				or (waypoint == waypoints[#waypoints-2] and VisualizeColors.Finish)
				or (waypoint.Action == Enum.PathWaypointAction.Jump and VisualizeColors.Jump)
				or VisualizeColors.Normal
			)
		visualWaypointClone.Parent = VisualizerFolder
	end
end
function PathModule.new(char, goal, agentParameters, jumpingAllowed, offset)
	if not (char and char:IsA("Model") and char.PrimaryPart) then return end
	if not PathfindingService then PathfindingService = game:GetService("PathfindingService") end 

	local Path = PathfindingService:CreatePath(agentParameters or {})
	local HRP = char:FindFirstChild("HumanoidRootPart")
	local Humanoid = char:FindFirstChildWhichIsA("Humanoid")

	if not HRP then HRP = char.PrimaryPart end
	if jumpingAllowed == nil or typeof(jumpingAllowed) ~= "boolean" then jumpingAllowed = false end

	local waypoints

	pcall(function() HRP:SetNetworkOwner(nil) end)

	local Success, ErrorMessage = pcall(function()
		if offset then
			Path:ComputeAsync(HRP.Position - offset, goal)
		else
			Path:ComputeAsync(HRP.Position, goal)
		end
	end)

	if Success and Path.Status == Enum.PathStatus.Success then 
		waypoints = Path:GetWaypoints()
		PathModule.visualize(waypoints)

		for i, v in pairs(waypoints) do
			if POOPDOORSLOADED == false or not v then return end

			if char.HumanoidRootPart.Anchored == false then
				if jumpingAllowed == true then if v.Action == Enum.PathWaypointAction.Jump then Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end
				Humanoid:MoveTo(v.Position)
				Humanoid.MoveToFinished:Wait()
			end
		end

		VisualizerFolder:ClearAllChildren()
		return true
	else
		return false
	end
end

print("Loading UI Library")

--local library = loadstring(game:HttpGet(--[['https://pastebin.com/raw/vPWzQEC8'--]]"https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/library.lua"))()
local isMobile = false
local mobiletoggles,mobiletoggleerr=pcall(function()
	local platform = game:GetService("UserInputService"):GetPlatform()
	isMobile = (platform == Enum.Platform.Android or platform == Enum.Platform.IOS)
end)

local Library = nil
--if mobiletoggles then
if isMobile == true then
	Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/uilibs/Mobile.lua?" .. tostring(math.random(0, 9999999)), true))()
else
	Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
end
--else
--	Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
--end

print("Loading gui data")

local currentver = "1.8.1"
local gui_data = nil
local gui_data_s, gui_data_e = nil
task.spawn(function()
gui_data_s, gui_data_e = pcall(function()
	gui_data = game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/gui_data.json"), true)
	gui_data = game:GetService("HttpService"):JSONDecode(gui_data)
end)
if gui_data_e then
	oldwarnmessage("POOPDOORS EDITED v"..currentver, "Failed to get script data.", 10)
end
if gui_data ~= nil and gui_data_s then
	
		if currentver ~= gui_data.ver or gui_data.ver ~= currentver then
print("Outdated version loaded")
			warnmessage("POOPDOORS EDITED v"..currentver, "You are using an outdated version of this script.", "", 10) 
			--loadstring(game:HttpGet((gui_data.loadstring.."?" .. tostring(math.random(0, 9999999)) ),true))()
			--return
		--else
			--currentver = tostring(gui_data.ver)
		end

	oldnormalmessage("INFO", gui_data.changelog, 20)

	
end
end)
print("Checking if loaded or outdated and place id")

if POOPDOORSLOADED == true then 
warnmessage("POOPDOORS EDITED v"..currentver, "GUI already loaded!", "", 10) 
print("GUI already loaded")
return 
end

if game.PlaceId ~= 6839171747 and game.PlaceId == 6516141723 then 
print("Not in a doors game")
	--warnmessage("POOPDOORS EDITED v"..currentver, "You need to join a game to run this script.", 10) 
	confirmnotification("POOPDOORS EDITED v"..currentver, "Do you want to join a game?", 15, function(state)
		if state == true then
			task.spawn(function()
				loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/joinsolo.lua?" .. tostring(math.random(0, 9999999))), true))()
			end)
		end
	end)
	return
end
if game.PlaceId ~= 6839171747 and game.PlaceId ~= 6516141723 then 
print("Not in doors")
	oldwarnmessage("POOPDOORS EDITED v"..currentver, "You need to join DOORS to run this script.", 10) 
	return
end


pcall(function() getgenv().POOPDOORSLOADED = true end)
normalmessage("POOPDOORS EDITED v"..currentver, "Loading script...", "", 2)

print("Loading variables")

-- credits alan1508 on v3erm
do task.spawn(function()if hookfunction then local a;a=hookfunction(game:GetService("ContentProvider").PreloadAsync,function(b,c,d)if table.find(c,game:GetService("CoreGui"))then local e=function(e,f)if e:match("^rbxasset://")or e:match("^rbxthumb://")then return d(e,f)end end;warn("Anticheat Check Detected")return a(b,c,e)end;return a(b,c,d)end)end end)end

local MobileButton = {};
local WaitUntilTerminated = Library.subs.Wait 

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local Players = game:GetService("Players")
local inRooms = false
local RequestFunction
if syn and syn.request then
	RequestFunction = syn.request
elseif request then
	RequestFunction = request
elseif http and http.request then
	RequestFunction = http.request
elseif http_request then
	RequestFunction = http_request
end

function JoinDiscord(InviteCodee)
	InviteCodee = string.gsub(InviteCodee, "https://discord.gg/", "");local Settings = { InviteCode = Eecs2w9rB5 --[[add your invite code here (without the "https://discord.gg/" part)--]] }

	if not RequestFunction then oldwarnmessage("POOPDOORS EDITED v"..currentver, "Your executor does not support http requests.", 5);return end
	for i = 6453, 6464 do
		task.spawn(function()
			local Request = RequestFunction({
				Url = string.format("http://127.0.0.1:%s/rpc?v=1", tostring(i)),
				Method = "POST",
				Body = game:GetService("HttpService"):JSONEncode({
					nonce = game:GetService("HttpService"):GenerateGUID(false),
					args = {
						invite = {code = Settings.InviteCode},
						code = Settings.InviteCode
					},
					cmd = "INVITE_BROWSER"
				}),
				Headers = {
					["Origin"] = "https://discord.com",
					["Content-Type"] = "application/json"
				}
			})
		end)
	end
end

local entityinfo = nil
task.spawn(function()
	if game.ReplicatedStorage:FindFirstChild("EntityInfo") then 
		entityinfo = game.ReplicatedStorage:FindFirstChild("EntityInfo") 
	else
		entityinfo = game.ReplicatedStorage:WaitForChild("EntityInfo")
	end	
end)

local avoidingYvalue = 23
local flags = {
	-- general
	light = false,
	fullbright = false,
	instapp = false,
	noseek = false,
	nogates = false,
	nopuzzle = false,
	noa90 = false,
	noskeledoors = false,
	noscreech = false,
	notimothy = false,
	getcode = false,
	roomsnolock = false,
	heartbeatwin = false,
	noseekarmsfire = false,
	avoidrushambush = false,
	autoplayagain = false,
	anticheatbypass = false,
	noclip = false, --fly = false
	autoskiprooms = false,
	camfov = 70,
	speed = 0,
	walkspeedtoggle = false,
	camfovtoggle = false,
	autopulllever = false,
	customnotifid = "10469938989",
	oldcustomnotifid = "4590657391",
	noeyesdamage = false,

	-- esp
	espdoors = false,
	espkeys = false,
	espitems = false,
	espbooks = false,
	esprush = false,
	espchest = false,
	esplocker = false,
	esphumans = false,
	espgold = false,
	goldespvalue = 0,
	--fakeespdoors = false,
	tracers = false,

	-- notifiers
	hintrush = false,
	predictentities = false,

	-- auras
	draweraura = false,
	keyaura = false,
	breakercollecter = false,
	bookcollecter = false,

	-- auto a-1000
	autorooms = false,
	autorooms_debug = false,
	autorooms_blockcontrols = false,

	-- trolling
	dropdowntrolling = "None"
}
local buttons = {
	-- general
	light = nil,
	fullbright = nil,
	instapp = nil,
	noseek = nil,
	nogates = nil,
	nopuzzle = nil,
	noa90 = nil,
	noskeledoors = nil,
	noscreech = nil,
	notimothy = nil,
	getcode = nil,
	roomsnolock = nil,
	heartbeatwin = nil,
	noseekarmsfire = nil,
	avoidrushambush = nil,
	autoplayagain = nil,
	anticheatbypass = nil,
	noclip = nil, --fly = false
	autoskiprooms = nil,
	camfov = nil,
	speed = nil,
	walkspeedtoggle = nil,
	camfovtoggle = nil,
	autopulllever = nil,
	customnotifid = nil,
	oldcustomnotifid = nil,
	noeyesdamage = nil,

	-- esp
	espdoors = nil,
	espkeys = nil,
	espitems = nil,
	espbooks = nil,
	esprush = nil,
	espchest = nil,
	esplocker = nil,
	esphumans = nil,
	espgold = nil,
	goldespvalue = nil,
	--fakeespdoors = nil,
	tracers = nil,

	-- notifiers
	hintrush = nil,
	predictentities = nil,

	-- auras
	draweraura = nil,
	keyaura = nil,
	breakercollecter = nil,
	bookcollecter = nil,

	-- auto a-1000
	autorooms = nil,
	autorooms_debug = nil,
	autorooms_blockcontrols = nil,

	-- trolling
	dropdowntrolling = nil
}
customnotifid = flags.customnotifid

local DELFLAGS = {table.unpack(flags)}
local esptable = {doors={},keys={},items={},books={},entity={},chests={},lockers={},people={},gold={},fakedoors={}}
local function changeBrightness(color)
	local h, s, v = color:ToHSV()
	return Color3.fromHSV(h, s, v/2)
end

local GlobalESPFolder = game.CoreGui:FindFirstChild("ESPFolder")
if GlobalESPFolder == nil then
	GlobalESPFolder = Instance.new("Folder", game.CoreGui)
	GlobalESPFolder.Name = "ESPFolder"
end
local esptableinstances = {}
local Camera = workspace.CurrentCamera
local WorldToViewportPoint = Camera.WorldToViewportPoint
local WorldToViewport = function(...) return WorldToViewportPoint(Camera, ...) end
function TracerESP(Color, instance)
	if Drawing then
		local Tracer = Drawing.new("Line")
		Tracer.Visible = false
		Tracer.Color = Color
		Tracer.Thickness = 2
		Tracer.Transparency = 1

		local con = game:GetService("RunService").RenderStepped:Connect(function()
			if instance ~= nil and flags.tracers == true then		
				local ScreenPosition, Vis = WorldToViewport(instance.Position);
				local OPos = Camera.CFrame:pointToObjectSpace(instance.Position);
				if ScreenPosition.Z < 0 then
					local AT = math.atan2(OPos.Y, OPos.X) + math.pi;
					OPos = CFrame.Angles(0, 0, AT):vectorToWorldSpace((CFrame.Angles(0, math.rad(89.9), 0):vectorToWorldSpace(Vector3.new(0, 0, -1))));
				end
				local Position = WorldToViewport(Camera.CFrame:pointToWorldSpace(OPos));
				if Vis then
					local TracerPosition = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
					Tracer.Visible = true
					Tracer.From = TracerPosition
					Tracer.To = Vector2.new(Position.X, Position.Y)
				else
					Tracer.Visible = false
				end
			else
				Tracer.Visible = false
			end
		end)

		local ret = {}
		ret.delete = function()
			task.spawn(function()
				if con then con:Disconnect() end
				Tracer:Remove()
			end)
		end

		instance.Destroying:Connect(function() ret.delete() end)
		instance:GetPropertyChangedSignal("Parent"):Connect(function()
			if not instance:IsDescendantOf(workspace) then
				ret.delete()
			end
		end)
		return ret
	else
		local ret = {}
		ret.delete = function() end
		return ret
	end
end
function esp(what,color,core,name)
	local parts

	local esp_folder = GlobalESPFolder:FindFirstChild(name)
	if game.Players:FindFirstChild(name) then
		esp_folder = GlobalESPFolder:FindFirstChild("PlayerESP")
		if not esp_folder then
			esp_folder = Instance.new("Folder")
			esp_folder.Parent = GlobalESPFolder
			esp_folder.Name = "PlayerESP"
		end
	end
	if not esp_folder then
		esp_folder = Instance.new("Folder")
		esp_folder.Parent = GlobalESPFolder
		esp_folder.Name = name
	end

	if typeof(what) == "Instance" then
		if what:IsA("Model") then
			parts = what:GetChildren()
		elseif what:IsA("BasePart") then
			parts = {what,table.unpack(what:GetChildren())}
		end
	elseif typeof(what) == "table" then
		parts = what
	end

	local bill
	local boxes = {}

	local s,e = pcall(function()
		if typeof(parts) ~= "table" then parts = {parts} end

		for i,v in pairs(parts) do
			if typeof(v) == "table" then
				for ii,vv in pairs(v) do
					if vv:IsA("BasePart") then
						local box = Instance.new("BoxHandleAdornment")
						box.Size = v.Size
						box.AlwaysOnTop = true
						box.ZIndex = 1
						box.AdornCullingMode = Enum.AdornCullingMode.Never
						box.Color3 = color
						box.Transparency = 0.7
						box.Adornee = v
						box.Parent = esp_folder

						table.insert(boxes, box)

						task.spawn(function()
							box.Adornee.Destroying:Connect(function()
								box.Adornee = nil
								box.Visible = false
								box:Destroy()
							end)
							--while box do
							--	if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
							--		box.Adornee = nil
							--		box.Visible = false
							--		box:Destroy()
							--	end  
							--	task.wait()
							--end
						end)
					end
				end
			else
				if v:IsA("BasePart") then
					local box = Instance.new("BoxHandleAdornment")
					box.Size = v.Size
					box.AlwaysOnTop = true
					box.ZIndex = 1
					box.AdornCullingMode = Enum.AdornCullingMode.Never
					box.Color3 = color
					box.Transparency = 0.7
					box.Adornee = v
					box.Parent = esp_folder

					table.insert(boxes, box)

					task.spawn(function()
						box.Adornee.Destroying:Connect(function()
							box.Adornee = nil
							box.Visible = false
							box:Destroy()
						end)
						--while box do
						--	if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
						----		box.Adornee = nil
						--		box.Visible = false
						--		box:Destroy()
						--	end  
						--	task.wait()
						--end
					end)
				end
			end
		end
	end)

	if e then
		warn(e)
		print("box esp failed")
	end

	if core and name then
		bill = Instance.new("BillboardGui", esp_folder)
		bill.AlwaysOnTop = true
		bill.Size = UDim2.new(0,400,0,100)
		bill.Adornee = core
		bill.MaxDistance = 2000

		local mid = Instance.new("Frame",bill)
		mid.AnchorPoint = Vector2.new(0.5,0.5)
		mid.BackgroundColor3 = color
		mid.Size = UDim2.new(0,8,0,8)
		mid.Position = UDim2.new(0.5,0,0.5,0)
		Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0)
		Instance.new("UIStroke",mid)

		local txt = Instance.new("TextLabel",bill)
		txt.AnchorPoint = Vector2.new(0.5,0.5)
		txt.BackgroundTransparency = 1
		txt.BackgroundColor3 = color
		txt.TextColor3 = color
		txt.Size = UDim2.new(1,0,0,20)
		txt.Position = UDim2.new(0.5,0,0.7,0)
		txt.Text = name
		Instance.new("UIStroke",txt)

		task.spawn(function()
			bill.Adornee.Destroying:Connect(function()
				bill.Enabled = false
				bill.Adornee = nil
				--pcall(function() table.remove(boxes, table.find(boxes, bill)) end)
				bill:Destroy() 
			end)
			--while bill do
			--	if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
			--		bill.Enabled = false
			--		bill.Adornee = nil
			--		--pcall(function() table.remove(boxes, table.find(boxes, bill)) end)
			--		bill:Destroy() 
			--	end  
			--	task.wait()
			--end
		end)
	end

	local Tracer = nil
	if flags.tracers == true then Tracer = TracerESP(color, core) end

	local ret = {}
	ret.delete = function()
		task.spawn(function()
			for i,v in pairs(boxes) do
				pcall(function()
					table.remove(esptableinstances, table.find(esptableinstances, v.Adornee))
				end)
				pcall(function()
					table.remove(esptableinstances, table.find(esptableinstances, v.Parent))
				end)
				v.Adornee = nil
				v.Visible = false
				v:Destroy()
				task.wait()
			end
		end)

		if bill then
			pcall(function()
				table.remove(esptableinstances, table.find(esptableinstances, bill.Adornee))
			end)
			pcall(function()
				table.remove(esptableinstances, table.find(esptableinstances, bill.Parent))
			end)
			bill.Adornee = nil
			bill.Enabled = false
			bill:Destroy() 
		end

		if Tracer then Tracer.delete() end
	end

	return ret 
end

print("Loadin GUI")

local GUIWindow = Library:CreateWindow({
	Name = "POOPDOORS EDITED v".. currentver,
	Themeable = false
})

local GUI = GUIWindow:CreateTab({
	Name = "Main"
})
local TrollingTabee = GUIWindow:CreateTab({
	Name = "Trolling"
})
local window_Trolling = TrollingTabee:CreateSection({
	Name = "Trolling"
})
local scriptLoaded = false
-- Config system
local curautoloadtextlabel
if isfolder and makefolder and listfiles and writefile and delfile then
	print("Loading config")
local POOPDOORS_EDITED_FOLDER_NAME = "POOPDOORS_EDITED"
	local function checkdir() if not isfolder(POOPDOORS_EDITED_FOLDER_NAME) then makefolder(POOPDOORS_EDITED_FOLDER_NAME) end end
	checkdir()

	local filetablelist = {}	
	function reloadList(ConfigDropdowne)
		filetablelist = {}
		for _,v in pairs(listfiles(POOPDOORS_EDITED_FOLDER_NAME)) do
			local filename = v
			filename = string.gsub(filename, "POOPDOORS_EDITED", "")
			filename = filename:sub(2)
			filename = string.gsub(filename, ".json", "")
			if not filename:match("autostart.txt") then
				table.insert(filetablelist, filename)
			end
			task.wait()
		end
		if ConfigDropdowne ~= nil then
			ConfigDropdowne:UpdateList(filetablelist)
			ConfigDropdowne:Set(filetablelist[1])
		end
	end
	reloadList(nil)

	local CONFIGTAB = GUIWindow:CreateTab({
		Name = "Configs"
	})
	local CONFIG = CONFIGTAB:CreateSection({
		Name = "Load"
	})
	local CONFIG_SAVE = CONFIGTAB:CreateSection({
		Name = "Save",
		Side = "Right"
	})
	local CONFIG_AUTO = CONFIGTAB:CreateSection({
		Name = "Auto",
		Side = "Right"
	})
	local ConfigDropdown = CONFIG:AddDropdown({
		Name = 'Select Config',
		List = filetablelist
	})

	function saveConfig(name, replace)
		if replace == nil then replace = false end

		local fileexists = isfile(POOPDOORS_EDITED_FOLDER_NAME.."/"..name..".json")
		if replace == false then
			oldnormalmessage("CONFIGS", "Trying to save config called '"..name.."'.", 5)
			if not isfile(POOPDOORS_EDITED_FOLDER_NAME.."/"..name..".json") then
				local s,e
				repeat task.wait()
					s,e = pcall(function()
						local jsonflags = game.HttpService:JSONEncode(flags)
						writefile(POOPDOORS_EDITED_FOLDER_NAME.."/"..name..".json", jsonflags)
					end)
				until not e and s
				oldnormalmessage("CONFIGS", "Succesfully saved a config called '"..name.."'.", 5)
				reloadList(ConfigDropdown)
			else
				oldwarnmessage("CONFIGS", "Config called '"..name.."' already exists.", 5)
				confirmnotification("CONFIGS", "Config called '"..name.."' already exists.\nDo you want to replace it?", 20, function(State)
					if State == true then
						task.spawn(function()
							saveConfig(name, true)
						end)
					end
				end)
			end
		else
			oldnormalmessage("CONFIGS", "Trying to overwrite config called '"..name.."'.", 5)
			local s,e
			repeat task.wait()
				s,e = pcall(function()
					local jsonflags = game.HttpService:JSONEncode(flags)
					writefile(POOPDOORS_EDITED_FOLDER_NAME.."/"..name..".json", jsonflags)
				end)
			until not e and s
			oldnormalmessage("CONFIGS", "Succesfully overwrited a config called '"..name.."'.", 5)
			reloadList(ConfigDropdown)
		end
	end
	function loadConfig(name, notifs)
		if notifs == nil then notifs = true end
		if notifs == true then oldnormalmessage("CONFIGS", "Trying to load config called '"..name.."'.", 5) end
		if isfile(POOPDOORS_EDITED_FOLDER_NAME.."/"..name..".json") then
			local jsonecoded = readfile(POOPDOORS_EDITED_FOLDER_NAME.."/"..name..".json")
			local flagsjson = game.HttpService:JSONDecode(jsonecoded)

			for name, value in pairs(flagsjson) do
				if buttons[name] ~= nil then
					--if typeof(value) == "boolean" then
					buttons[name]:Set(value)
					--end
				else
					if typeof(buttons[name]) == "boolean" then
						flags[name] = value
					end
				end
			end

			if notifs == true then oldnormalmessage("CONFIGS", "Successfully loaded config called '"..name.."'.", 5) end
		else
			if notifs == true then oldwarnmessage("CONFIGS", "Config called '"..name.."' doesn't exists.", 5) end
		end
	end
	function deleteConfig(name, notifs)
		if notifs == nil then notifs = true end
		if notifs == true then oldnormalmessage("CONFIGS", "Trying to delete config called '"..name.."'.", 5) end
		if isfile(POOPDOORS_EDITED_FOLDER_NAME.."/"..name..".json") then
			local s,e
			repeat task.wait()
				s,e = pcall(function()
					delfile(POOPDOORS_EDITED_FOLDER_NAME.."/"..name..".json")
				end)
			until not e and s

			if notifs == true then oldnormalmessage("CONFIGS", "Successfully deleted config called '"..name.."'.", 5) end
			reloadList(ConfigDropdown)
		else
			if notifs == true then oldwarnmessage("CONFIGS", "Config called '"..name.."' doesn't exists.", 5) end
		end
	end

	CONFIG:AddButton({
		Name = "Load Config",
		Callback = function()
			loadConfig(ConfigDropdown:Get())
		end
	})
	CONFIG:AddButton({
		Name = "Overwrite Config",
		Callback = function()
			saveConfig(ConfigDropdown:Get(), true)
		end
	})
	CONFIG:AddButton({ 
		Name = "Delete Config", 
		Callback = function() 
			deleteConfig(ConfigDropdown:Get())
		end 
	})
	CONFIG:AddButton({ Name = "Reload Config List", Callback = function() reloadList(ConfigDropdown) end })

	local SaveCurrentName = CONFIG_SAVE:AddTextbox({
		Name = 'Config Name',
		Value = "Config_"..tostring(#filetablelist+1),
		Multiline = false
	})
	CONFIG_SAVE:AddButton({ Name = "Reset Config Name", Callback = function() SaveCurrentName:Set("Config_"..tostring(#filetablelist+1)) end })
	CONFIG_SAVE:AddButton({
		Name = "Save Config",
		Callback = function()
			local name = SaveCurrentName:Get()
			--name = string.sub(name, " ", "_")
			if string.len(name) < 1 then
				warnmessage("CONFIGS", "Name is too short. Minimum character count is 1.", 5)
				--name = "Config_"..tostring(#filetablelist+1)
				return
			end
			if string.len(name) > 20-1 then
				warnmessage("CONFIGS", "Name is too long. Maximum character count is 24.", 5)
				return
			end
			--game.HttpService:JSONEncode(end_result)
			saveConfig(name, false)
		end
	})

	CONFIG_AUTO:AddLabel({ Name = "Current Auto Load Config:" })
	curautoloadtextlabel = CONFIG_AUTO:AddLabel({ Name = "None" })
	CONFIG_AUTO:AddButton({ 
		Name = "Auto Load Config", 
		Callback = function() 
			local s,e = pcall(function()
				writefile(POOPDOORS_EDITED_FOLDER_NAME.."/autostart.txt", ConfigDropdown:Get())
			end)
			if e then
				warn(e)
				oldwarnmessage("CONFIGS", "There was an issue while setting the config called '"..ConfigDropdown:Get().."' to auto load.", 5)
			else
				curautoloadtextlabel:Set(ConfigDropdown:Get())
				oldnormalmessage("CONFIGS", "Config called '"..ConfigDropdown:Get().."' will automaticly load now.", 5)
			end
		end 
	})
	CONFIG_AUTO:AddButton({ 
		Name = "Reset Auto Loading Config", 
		Callback = function() 
			local s,e = pcall(function()
				delfile(POOPDOORS_EDITED_FOLDER_NAME.."/autostart.txt")
			end)
			if e then
				warn(e)
				oldwarnmessage("CONFIGS", "There was an issue while deleted the config called '"..ConfigDropdown:Get().."'.", 5)
			else
				oldnormalmessage("CONFIGS", "Config called '"..curautoloadtextlabel:Get().."' will not automaticly load anymore.", 5)
				curautoloadtextlabel:Set("None")
			end
		end 
	})

	reloadList(ConfigDropdown)
	task.spawn(function()
		repeat task.wait() until scriptLoaded == true
		if isfile(POOPDOORS_EDITED_FOLDER_NAME.."/autostart.txt") then
			local autostart_name = readfile(POOPDOORS_EDITED_FOLDER_NAME.."/autostart.txt")
			if isfile(POOPDOORS_EDITED_FOLDER_NAME.."/"..autostart_name..".json") then
				curautoloadtextlabel:Set(autostart_name)
				loadConfig(autostart_name, false)
				task.wait(2.5)
				oldnormalmessage("CONFIGS", "Config called '"..autostart_name.."' automaticly loaded.", 5)
			else
				curautoloadtextlabel:Set("None")
				local s,e
				repeat task.wait()
					s,e = pcall(function()
						delfile(POOPDOORS_EDITED_FOLDER_NAME.."/autostart.txt")
					end)
				until not e and s
			end
		end
	end)
else
	warnmessage("CONFIGS", "You need to have file functions for Configs.", 10)
end
-- Config system

--local window_player_tab = GUI:CreateTab({ Name = "Player" })
local window_player = GUI:CreateSection({
	Name = "Player"
})
--local window_esp_tab = GUI:CreateTab({ Name = "ESP" })
local window_esp = GUI:CreateSection({
	Name = "ESP"
})
--local window_entities_tab = GUI:CreateTab({ Name = "Entities" })
local window_entities = GUI:CreateSection({
	Name = "Entities"
})
--local window_roomsdoors_tab = GUI:CreateTab({ Name = "Rooms (DOORS)" })
local window_roomsdoors = GUI:CreateSection({
	Name = "Rooms (DOORS)",
	Side = "Right"
})
--local window_misc_tab = GUI:CreateTab({ Name = "Miscellaneous" })
local window_misc = GUI:CreateSection({
	Name = "Miscellaneous",
	Side = "Right"
})
--local window_anticheatbyppasses_tab = GUI:CreateTab({ Name = "Anticheat Bypasses" })
local window_anticheatbyppasses = GUI:CreateSection({
	Name = "Anticheat Bypasses",
	Side = "Right"
})
--local window_experimentals_tab = GUI:CreateTab({ Name = "Experimentals" })
local window_experimentals = GUI:CreateSection({
	Name = "Experimentals",
	Side = "Right"
})

local window_guisettings_tab = GUIWindow:CreateTab({ Name = "GUI" })
local window_guisettings = window_guisettings_tab:CreateSection({
	Name = "GUI"
})
local newnotificationsettings = window_guisettings_tab:CreateSection({
	Name = "New Notification Settings",
	Side = "Right"
})

local CustomNotificationSoundINotifs = false
task.spawn(function()task.wait(1)CustomNotificationSoundINotifs = true end)
local CustomNewNotificationSoundId = newnotificationsettings:AddTextbox({
	Name = "Custom Notification Sound",
	Value = "10469938989",
	Multiline = false,
	Callback = function(id)
		local MarketplaceService = game:GetService("MarketplaceService")
		local Success, Response = pcall(MarketplaceService.GetProductInfo, MarketplaceService, id)

		if Success then
			if Response.AssetTypeId == Enum.AssetType.Audio.Value then
				flags.customnotifid = tostring(id)
				customnotifid = flags.customnotifid
				if CustomNotificationSoundINotifs == true then
					oldnormalmessage("INFO", "Successfully set Custom New Notification Sound.", 10) 
					if curautoloadtextlabel ~= nil then
						confirmnotification("INFO", "Do you want to save it to a config called '"..curautoloadtextlabel:Get().."'? (RECOMMENDED)", 25, function(State)
							if State == true then
								task.spawn(function()
									saveConfig(curautoloadtextlabel:Get(), true)
								end)
							end
						end)
					end
				end
			else
				if CustomNotificationSoundINotifs == true then oldwarnmessage("INFO", "'"..tostring(id).."' is not an Sound.", 10) end
			end
		else
			if CustomNotificationSoundINotifs == true then oldwarnmessage("INFO", "ID doesn't exists or failed to check ID.\nTry again.", 10) end
		end
	end
})
buttons.customnotifid = CustomNewNotificationSoundId
newnotificationsettings:AddButton({
	Name = "Reset Custom Notification Sound",
	Callback = function()
		flags.customnotifid = "10469938989"
		CustomNewNotificationSoundId:RawSet("10469938989")
		oldnormalmessage("INFO", "Custom New Notification Sound reseted to default.", 10) 
		if curautoloadtextlabel ~= nil then
			confirmnotification("INFO", "Do you want to save it to a config called '"..curautoloadtextlabel:Get().."'? (RECOMMENDED)", 25, function(State)
				if State == true then
					task.spawn(function()
						saveConfig(curautoloadtextlabel:Get(), true)
					end)
				end
			end)
		end
	end
})
newnotificationsettings:AddButton({
	Name = "Test Notification",
	Callback = function()
		normalmessage("POOPDOORS EDITED v"..currentver, "This is a test!", "Hey.", 5, nil, "TEST NOTIFICATION")
	end
})

local oldnotificationsettings = window_guisettings_tab:CreateSection({
	Name = "Old Notification Settings",
	Side = "Right"
})

local CustomOldNotificationSoundINotifs = false
task.spawn(function()task.wait(1)CustomOldNotificationSoundINotifs = true end)
local CustomOldNotificationSoundID = oldnotificationsettings:AddTextbox({
	Name = "Custom Notification Sound",
	Value = "4590657391",
	Multiline = false,
	Callback = function(id)
		local MarketplaceService = game:GetService("MarketplaceService")
		local Success, Response = pcall(MarketplaceService.GetProductInfo, MarketplaceService, id)

		if Success then
			if Response.AssetTypeId == Enum.AssetType.Audio.Value then
				flags.oldcustomnotifid = tostring(id)
				oldcustomnotifid = flags.oldcustomnotifid
				if CustomOldNotificationSoundINotifs == true then
					oldnormalmessage("INFO", "Successfully set Custom Old Notification Sound.", 10) 
					if curautoloadtextlabel ~= nil then
						confirmnotification("INFO", "Do you want to save it to a config called '"..curautoloadtextlabel:Get().."'? (RECOMMENDED)", 25, function(State)
							if State == true then
								task.spawn(function()
									saveConfig(curautoloadtextlabel:Get(), true)
								end)
							end
						end)
					end
				end
			else
				if CustomOldNotificationSoundINotifs == true then oldwarnmessage("INFO", "'"..tostring(id).."' is not an Sound.", 10) end
			end
		else
			if CustomOldNotificationSoundINotifs == true then oldwarnmessage("INFO", "ID doesn't exists or failed to check ID.\nTry again.", 10) end
		end
	end
})
buttons.oldcustomnotifid = CustomOldNotificationSoundID
oldnotificationsettings:AddButton({
	Name = "Reset Custom Notification Sound",
	Callback = function()
		flags.oldcustomnotifid = "4590657391"
		CustomOldNotificationSoundID:RawSet("4590657391")
		oldnormalmessage("INFO", "Custom Notification Sound reseted to default.", 10) 
		if curautoloadtextlabel ~= nil then
			confirmnotification("INFO", "Do you want to save it to a config called '"..curautoloadtextlabel:Get().."'?", 25, function(State)
				if State == true then
					task.spawn(function()
						saveConfig(curautoloadtextlabel:Get(), true)
					end)
				end
			end)
		end
	end
})
oldnotificationsettings:AddButton({
	Name = "Test Notification",
	Callback = function()
		oldnormalmessage("POOPDOORS EDITED v"..currentver.." [TEST]", "This is a test!", 5)
	end
})

local window_credits_tab = GUIWindow:CreateTab({ Name = "Credits" })
local window_credits = window_credits_tab:CreateSection({
	Name = "Credits"
})
window_credits:AddLabel({ Name = "Original V3RM post: 1200475" })
window_credits:AddLabel({ Name = "Original by:" });window_credits:AddLabel({ Name = "zoophiliaphobic#6287" })
window_credits:AddLabel({ Name = "Edited by: mstudio45" })
window_credits:AddLabel({ Name = "UI Library suggestion:" });window_credits:AddLabel({ Name = "actu#2004" })
window_credits:AddLabel({ Name = "Discord Invite: vC9kRbMVCq" })
if RequestFunction then
	window_credits:AddButton({
		Name = "Join POOPDOORS EDITED\nDiscord Server",
		Callback = function()
			JoinDiscord("vC9kRbMVCq")
		end
	})
end
print("Loading Player tab")
task.spawn(function()
	--	repeat task.wait(1) until flags.anticheatbypass == true
	local nocliptoggle = window_player:AddToggle({
		Name = "Noclip",
		Value = false,
		Callback = function(val, oldval)
			flags.noclip = val

			if val then
				local Nocliprun =  nil
				Nocliprun = game:GetService("RunService").Stepped:Connect(function()
					if game.Players.LocalPlayer.Character ~= nil then
						for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
							if v:IsA("BasePart") then
								pcall(function()
									v.CanCollide = false
								end)
							end
						end
					end
					if flags.noclip == false then
						if Nocliprun then Nocliprun:Disconnect() end
					end
				end)
			end
		end
	})
	buttons.noclip = nocliptoggle
end)


local clientglowbtn = window_player:AddToggle({
	Name = "Client Glow",
	Value = false,
	Callback = function(val, oldval)
		flags.light = val

		if val then
			local l = Instance.new("PointLight")
			l.Range = 10000
			l.Brightness = 2
			l.Parent = char.PrimaryPart

			repeat task.wait() until POOPDOORSLOADED == false or not flags.light
			l:Destroy() 
		end
	end
})
buttons.light = clientglowbtn

local cfullbrightbtn = window_player:AddToggle({
	Name = "Fullbright",
	Value = false,
	Callback = function(val, oldval)
		flags.fullbright = val

		if val then
			local oldAmbient = game:GetService("Lighting").Ambient
			local oldColorShift_Bottom = game:GetService("Lighting").ColorShift_Bottom
			local oldColorShift_Top = game:GetService("Lighting").ColorShift_Top

			local function doFullbright()
				if flags.fullbright == true then
					game:GetService("Lighting").Ambient = Color3.new(1, 1, 1)
					game:GetService("Lighting").ColorShift_Bottom = Color3.new(1, 1, 1)
					game:GetService("Lighting").ColorShift_Top = Color3.new(1, 1, 1)
				else
					game:GetService("Lighting").Ambient = oldAmbient
					game:GetService("Lighting").ColorShift_Bottom = oldColorShift_Bottom
					game:GetService("Lighting").ColorShift_Top = oldColorShift_Top
				end
			end
			doFullbright()

			local coneee = game:GetService("Lighting").LightingChanged:Connect(doFullbright)
			repeat task.wait() until POOPDOORSLOADED == false or not flags.fullbright

			coneee:Disconnect()
			game:GetService("Lighting").Ambient = oldAmbient
			game:GetService("Lighting").ColorShift_Bottom = oldColorShift_Bottom
			game:GetService("Lighting").ColorShift_Top = oldColorShift_Top
		end
	end
})
buttons.fullbright = cfullbrightbtn

if fireproximityprompt then
	local instausebrn = window_player:AddToggle({
		Name = "Instant Use",
		Value = false,
		Callback = function(val, oldval)
			flags.instapp = val

			local holdconnect
			holdconnect = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p)
				fireproximityprompt(p)
			end)

			repeat task.wait() until POOPDOORSLOADED == false or not flags.instapp
			holdconnect:Disconnect()
		end
	})
	buttons.instapp = instausebrn
else
	warnmessage("POOPDOORS EDITED v"..currentver, "You need to have fireproximityprompt function for 'instant use'.", 7)
end

local walkspeedslider = window_player:AddSlider({
	Name = "Walkspeed",
	Value = 16,
	Min = 16,
	Max = 22,

	Callback = function(val, oldval)
		flags.speed = val
		if flags.walkspeedtoggle == true then
			hum.WalkSpeed = val
		end
	end
})
buttons.speed = walkspeedslider
local walkspeedtglbtn = window_player:AddToggle({
	Name = "Toggle Walkspeed",
	Value = false,
	Callback = function(val, oldval)
		flags.walkspeedtoggle = val
		if not val then
			hum.WalkSpeed = 16
		end
	end
})
buttons.walkspeedtoggle = walkspeedtglbtn

window_player:AddButton({
	Name = "Reset Character",
	Callback = function()
		confirmnotification("POOPDOORS EDITED v"..currentver, "Are you sure to reset your character?", 15, function(state)
			if state == true then
				game.Players.LocalPlayer.Character.Humanoid.Health = 0
			end
		end)
	end
})

--[[window_player.label("\nif you use it anyone will be able to join your game and expose you of exploiting",32)
window_player.button("rejoin revive", function()
	if #game:GetService("Players"):GetPlayers() <= 1 or #game:GetService("Players"):GetPlayers() == 0 then
		game:GetService("Players").LocalPlayer:Kick("\nRejoining...")
		task.wait()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	else
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
	end
end)--]]

local camfovslider = window_player:AddSlider({
	Name = "FOV",
	Value = 70,
	Min = 50,
	Max = 120,

	Callback = function(val, oldval)
		flags.camfov = val
	end
})
buttons.camfov = camfovslider
local togglefovbrn = window_player:AddToggle({
	Name = "Toggle FOV",
	Value = false,
	Callback = function(val, oldval)
		flags.camfovtoggle = val
		if not val then
			waitframes(2)
			game:GetService("Workspace").CurrentCamera.FieldOfView = 70
		end
	end
})
buttons.camfovtoggle = togglefovbrn

task.spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if flags.walkspeedtoggle == true then
			if hum.WalkSpeed < flags.speed then
				hum.WalkSpeed = flags.speed
			end
		end
		if flags.camfovtoggle == true then
			if flags.tracers == false then
				pcall(function()
					game:GetService("Workspace").CurrentCamera.FieldOfView = flags.camfov
				end)
			else
				if syn or PROTOSMASHER_LOADED then
					pcall(function()
						game:GetService("Workspace").CurrentCamera.FieldOfView = flags.camfov
					end)
				end
			end
		end
	end)
end)

print("Loading ESP tab")
window_esp:AddButton({
	Name = "Clear ESP",
	Callback = function()
		pcall(function()
			for _,e in pairs(esptable) do
				for _,v in pairs(e) do
					pcall(function()
						v.delete()
					end)
				end
			end
		end)
		GlobalESPFolder:ClearAllChildren()
	end
})

if Drawing then
	if not syn or not PROTOSMASHER_LOADED then
		window_esp:AddLabel({Name = "Tracers only work with 70 FOV."})
	end
	local traceresp = window_esp:AddToggle({
		Name = "Tracers",
		Value = false,
		Callback = function(val, oldval)
			flags.tracers = val
		end
	})
	buttons.tracers = traceresp
end

local espdoorsbtn = window_esp:AddToggle({
	Name = "Door ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.espdoors = val

		if val then
			local function setup(room)
				task.wait(.1)
				local door = room:WaitForChild("Door"):WaitForChild("Door")

				if table.find(esptableinstances, door) then
					return
				end

				task.wait(0.1)
				local h = esp(door,Color3.fromRGB(255,240,0),door,"Door")
				table.insert(esptable.doors,h)
				table.insert(esptableinstances, door)

				door:WaitForChild("Open").Played:Connect(function()
					h.delete()
				end)

				door.AncestryChanged:Connect(function()
					h.delete()
				end)
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				if room:FindFirstChild("Assets") then
					setup(room) 
				end
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until POOPDOORSLOADED == false or not flags.espdoors
			addconnect:Disconnect()

			for i,v in pairs(esptable.doors) do
				v.delete()
			end 
		end
	end
})
buttons.espdoors = espdoorsbtn
--[[local fakeespdoorsbtn = window_esp:AddToggle({
	Name = "Fake Door (Dupe) ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.fakeespdoors = val

		if val then
			local function setup(room)
				for _,v in pairs(room:GetDescendants()) do 
					task.spawn(function()
						if v.Name == "DoorFake" then
							if v:FindFirstChild("Door") then
								if table.find(esptableinstances, v.Door) then
									return
								end

								local h = esp(v.Door,Color3.fromRGB(170, 0, 0),v.Door,"Fake Door (Dupe)")
								table.insert(esptable.fakedoors,h)
								table.insert(esptableinstances, v.Door)
							end
						end 
					end)
				end
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				setup(room)
				task.wait()
			end

			setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])

			repeat task.wait() until POOPDOORSLOADED == false or not flags.fakeespdoors
			addconnect:Disconnect()

			for i,v in pairs(esptable.fakedoors) do
				v.delete()
			end 
		end
	end
})
buttons.fakeespdoors = fakeespdoorsbtn--]]
local espkeysbtn = window_esp:AddToggle({
	Name = "Key/Lever ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.espkeys = val

		if val then
			local function check(v, room)
				task.wait()
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") then
					if v.Name == "ElectricalKeyObtain" then
						local hitbox = v:FindFirstChild("Hitbox")
						local parts = hitbox:GetChildren()
						table.remove(parts,table.find(parts,v:WaitForChild("PromptHitbox")))

						local h = esp(parts,Color3.fromRGB(90,255,40),hitbox,"Electrical Key")
						table.insert(esptable.keys,h)
						table.insert(esptableinstances, v)
					end
					if v.Name == "KeyObtain" then
						local hitbox = v:FindFirstChild("Hitbox")
						local parts = hitbox:GetChildren()
						table.remove(parts,table.find(parts,hitbox:WaitForChild("PromptHitbox")))

						local h = esp(parts,Color3.fromRGB(90,255,40),hitbox,"Key")
						table.insert(esptable.keys,h)
						table.insert(esptableinstances, v)
					end;if v.Name == "LeverForGate" then
						local h = esp(v,Color3.fromRGB(90,255,40),v.PrimaryPart,"Lever")
						table.insert(esptable.keys,h)
						table.insert(esptableinstances, v)
						v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function()
							h.delete()
						end) 
					end
				end
			end

			local function setup(room)
				local assets = room:FindFirstChild("Assets")

				if room then
					if assets then
						assets.DescendantAdded:Connect(function(v)
							check(v, room) 
						end)
					else
						room.DescendantAdded:Connect(function(v)
							check(v, room) 
						end)
					end
				end

				if assets then
					for i,v in pairs(assets:GetChildren()) do --:GetDescendants()) do
						check(v, room)
					end 
				else
					for i,v in pairs(room:GetDescendants()) do
						check(v, room)
					end 
				end
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				setup(room)
			end

			setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])

			repeat task.wait() until POOPDOORSLOADED == false or not flags.espkeys
			addconnect:Disconnect()

			for i,v in pairs(esptable.keys) do
				v.delete()
			end 
		end
	end
})
buttons.espkeys = espkeysbtn
local espitemsbtn = window_esp:AddToggle({
	Name = "Item ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.espitems = val

		if val then
			local function check(v)
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") and (v:GetAttribute("Pickup") or v:GetAttribute("PropType")) then
					task.wait(0.1)

					local part = (v:FindFirstChild("Handle") or v:FindFirstChild("Prop"))
					local h = esp(part,Color3.fromRGB(160,190,255),part,v.Name)
					table.insert(esptable.items,h)
					table.insert(esptableinstances, v)				
				end
			end

			local function setup(room)
				task.wait(.1)
				local assets = room:WaitForChild("Assets")

				if assets then  
					local subaddcon
					subaddcon = assets.DescendantAdded:Connect(function(v)
						check(v) 
					end)

					for i,v in pairs(assets:GetDescendants()) do
						check(v)
					end

					task.spawn(function()
						repeat task.wait() until POOPDOORSLOADED == false or not flags.espitems
						subaddcon:Disconnect()  
					end) 
				end 
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				if room:FindFirstChild("Assets") then
					setup(room) 
				end
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until POOPDOORSLOADED == false or not flags.espitems
			addconnect:Disconnect()

			for i,v in pairs(esptable.items) do
				v.delete()
			end 
		end
	end
})
buttons.espitems = espitemsbtn
local espbooksbtn = window_esp:AddToggle({
	Name = "Book/Breaker ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.espbooks = val

		if val then
			local function check(v,room)
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") and (v.Name == "LiveHintBook" or v.Name == "LiveBreakerPolePickup") then
					task.wait(0.1)
					local h
					if v.Name == "LiveHintBook" then
						h = esp(v,Color3.fromRGB(160,190,255),v.PrimaryPart,"Book")
					elseif v.Name == "LiveBreakerPolePickup" then
						h = esp(v,Color3.fromRGB(160,190,255),v.PrimaryPart,"Breaker")
					end

					table.insert(esptable.books,h)
					table.insert(esptableinstances, v)

					v.AncestryChanged:Connect(function()
						if not v:IsDescendantOf(room) then
							h.delete() 
						end
					end)
				end
			end

			local function setup(room)
				task.wait(.1)
				if room.Name == "50" or room.Name == "100" then
					room.DescendantAdded:Connect(function(v)
						check(v,room) 
					end)

					for i,v in pairs(room:GetDescendants()) do
						check(v,room)
					end
				end
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				setup(room) 
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until POOPDOORSLOADED == false or not flags.espbooks
			addconnect:Disconnect()

			for i,v in pairs(esptable.books) do
				v.delete()
			end 
		end
	end
})
buttons.espbooks = espbooksbtn
local entitynames = {"RushMoving","AmbushMoving","Eyes","Snare","A60","A120"}
local esprusbtn = window_esp:AddToggle({
	Name = "Entity ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.esprush = val

		if val then
			local addconnect
			addconnect = workspace.ChildAdded:Connect(function(v)
				if table.find(entitynames,v.Name) then
					task.wait(.1)
					local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
					table.insert(esptable.entity,h)
				end
			end)

			for _,v in pairs(workspace:GetChildren()) do
				if table.find(entitynames,v.Name) then
					task.wait(.1)
					local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
					table.insert(esptable.entity,h)
				end
			end

			local function setup(room)
				task.wait()
				if room.Name == "50" or room.Name == "100" then
					local figuresetup = room:WaitForChild("FigureSetup")

					if figuresetup then
						local fig = figuresetup:WaitForChild("FigureRagdoll")
						task.wait(0.1)

						local h = esp(fig,Color3.fromRGB(255,25,25),fig.PrimaryPart,"Figure")
						table.insert(esptable.entity,h)
					end 
				else
					local assets = room:WaitForChild("Assets")

					local function check(v)
						if v:IsA("Model") and table.find(entitynames,v.Name) then
							task.wait(0.1)

							local h = esp(v:WaitForChild("Base"),Color3.fromRGB(255,25,25),v.Base,"Snare")
							table.insert(esptable.entity,h)
						end
					end

					assets.DescendantAdded:Connect(function(v)
						check(v) 
					end)

					for i,v in pairs(assets:GetDescendants()) do
						check(v)
					end
				end 
			end

			local roomconnect
			roomconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				setup(v) 
			end

			setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])

			repeat task.wait() until POOPDOORSLOADED == false or not flags.esprush
			addconnect:Disconnect()
			roomconnect:Disconnect()

			for i,v in pairs(esptable.entity) do
				v.delete()
			end 
		end
	end
})
buttons.esprush = esprusbtn
local esplockerbrn = window_esp:AddToggle({
	Name = "Wardrobe/Locker ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.esplocker = val

		if val then
			local function check(v, room)
				task.wait()
				--local okvaluechange = nil
				if v.Name == "Wardrobe" then
					local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"Closet")
					table.insert(esptable.lockers,h) 
					table.insert(esptableinstances, v)
					--okvaluechange = game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
					--	if tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value) ~= room.Name then
					--		h.delete()
					--		okvaluechange:Disconnect()
					--	end
					--end)
				elseif v.Name == "Rooms_Locker" or v.Name == "Rooms_Locker_Fridge" then
					local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"Locker")
					table.insert(esptable.lockers,h) 
					table.insert(esptableinstances, v)
					--okvaluechange = game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
					--	if tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value) ~= room.Name then
					--		h.delete()
					--		okvaluechange:Disconnect()
					--	end
					--end)
				end
			end

			local function setup(room)
				local assets = room:WaitForChild("Assets")

				if assets then
					local subaddcon
					subaddcon = assets.DescendantAdded:Connect(function(v)
						check(v, room) 
					end)

					for i,v in pairs(assets:GetDescendants()) do
						check(v, room)
					end

					task.spawn(function()
						repeat task.wait() until POOPDOORSLOADED == false or not flags.esplocker
						subaddcon:Disconnect()  
					end)
				else
					local subaddcon
					subaddcon = room.DescendantAdded:Connect(function(v)
						check(v, room) 
					end)

					for i,v in pairs(room:GetDescendants()) do
						check(v, room)
					end

					task.spawn(function()
						repeat task.wait() until POOPDOORSLOADED == false or not flags.esplocker
						subaddcon:Disconnect()  
					end) 
				end
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			if workspace.CurrentRooms:FindFirstChild(tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value-1)) then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value-1)])
			end
			setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			if workspace.CurrentRooms:FindFirstChild(tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value+1)) then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value+1)])
			end

			repeat task.wait() until POOPDOORSLOADED == false or not flags.esplocker
			addconnect:Disconnect()

			for i,v in pairs(esptable.lockers) do
				v.delete()
			end 
		end
	end
})
buttons.esplocker = esplockerbrn

local espchesbtn = window_esp:AddToggle({
	Name = "Chest ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.espchest = val

		if val then
			local function check(v, room)
				task.wait()
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") then
					local okvaluechange = nil
					if v.Name == "ChestBox" then
						warn(v.Name)
						local h = esp(v,Color3.fromRGB(205,120,255),v.PrimaryPart,"Chest")
						table.insert(esptable.chests,h) 
						table.insert(esptableinstances, v)
						okvaluechange = game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
							if tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value) ~= room.Name then
								h.delete()
								okvaluechange:Disconnect()
							end
						end)
					elseif v.Name == "ChestBoxLocked" then
						local h = esp(v,Color3.fromRGB(255,120,205),v.PrimaryPart,"Locked Chest")
						table.insert(esptable.chests,h) 
						table.insert(esptableinstances, v)
						okvaluechange = game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
							if tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value) ~= room.Name then
								h.delete()
								okvaluechange:Disconnect()
							end
						end)
					end
				end
			end

			local function setup(room)
				task.wait(.1)
				local subaddcon
				subaddcon = room.DescendantAdded:Connect(function(v)
					check(v, room) 
				end)

				for i,v in pairs(room:GetDescendants()) do
					check(v, room)
				end

				task.spawn(function()
					repeat task.wait() until POOPDOORSLOADED == false or not flags.espchest
					subaddcon:Disconnect()  
				end)  
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				if room:FindFirstChild("Assets") then
					setup(room) 
				end
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until POOPDOORSLOADED == false or not flags.espchest
			addconnect:Disconnect()

			for i,v in pairs(esptable.chests) do
				v.delete()
			end
		end
	end
})
buttons.espchest = espchesbtn
local esphumansbtn = window_esp:AddToggle({
	Name = "Player ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.esphumans = val

		if val then
			local function personesp(v)
				if v:IsA("Player") then
					v.CharacterAdded:Connect(function(vc)
						local vh = vc:WaitForChild("Humanoid")
						local torso = vc:WaitForChild("UpperTorso")
						task.wait(0.1)

						local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
						table.insert(esptable.people,h) 
					end)

					if v.Character then
						local vc = v.Character
						local vh = vc:WaitForChild("Humanoid")
						local torso = vc:WaitForChild("UpperTorso")
						task.wait(0.1)

						local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
						table.insert(esptable.people,h) 
					end
				end
			end

			local addconnect
			addconnect = game.Players.PlayerAdded:Connect(function(v)
				if v ~= plr then
					personesp(v)
				end
			end)

			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= plr then
					personesp(v) 
				end
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				personesp(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until POOPDOORSLOADED == false or not flags.esphumans
			addconnect:Disconnect()

			for i,v in pairs(esptable.people) do
				v.delete()
			end 
		end
	end
})
buttons.esphumans = esphumansbtn
local espgoldbtn = window_esp:AddToggle({
	Name = "Gold ESP",
	Value = false,
	Callback = function(val, oldval)
		flags.espgold = val

		if val then
			local function check(v)
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") then
					task.wait(0.1)
					local goldvalue = v:GetAttribute("GoldValue")

					if goldvalue and goldvalue >= (flags.goldespvalue or 5) then
						local hitbox = v:WaitForChild("Hitbox")
						local h = esp(hitbox:GetChildren(),Color3.fromRGB(255,255,0),hitbox,"GoldPile [".. tostring(goldvalue).."]")
						table.insert(esptable.gold,h)
						table.insert(esptableinstances, v)
					end
				end
			end

			local function setup(room)
				task.wait(.1)
				local assets = room:WaitForChild("Assets")

				local subaddcon
				subaddcon = assets.DescendantAdded:Connect(function(v)
					check(v) 
				end)

				for i,v in pairs(assets:GetDescendants()) do
					check(v)
					task.wait()
				end

				task.spawn(function()
					repeat task.wait() until POOPDOORSLOADED == false or not flags.espchest
					subaddcon:Disconnect()  
				end)  
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				if room:FindFirstChild("Assets") then
					setup(room) 
				end
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until POOPDOORSLOADED == false or not flags.espgold
			addconnect:Disconnect()

			for i,v in pairs(esptable.gold) do
				v.delete()
			end 
		end
	end
})
buttons.espgold = espgoldbtn
local goldespvaluebtn = window_esp:AddSlider({
	Name = "Minimum Gold for Gold ESP",
	Value = 5,
	Min = 5,
	Max = 150,

	Callback = function(val, oldval)
		flags.goldespvalue = val
	end
})
buttons.goldespvalue = goldespvaluebtn

print("Loading Entities tab")

local hintrushbtn = window_entities:AddToggle({
	Name = "Notify Entities",
	Value = false,
	Callback = function(val, oldval)
		flags.hintrush = val
	end
})
buttons.hintrush = hintrushbtn
local predictentitiesbtn = window_entities:AddToggle({
	Name = "Event Prediction",
	Value = false,
	Callback = function(val, oldval)
		flags.predictentities = val
	end
})
buttons.predictentities = predictentitiesbtn
game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Connect(function(value)
	if flags.predictentities == true then
		local ChaseStartVal = game:GetService("ReplicatedStorage").GameData.ChaseStart.Value - value;
		if ((0 < ChaseStartVal) and (ChaseStartVal < 4)) then
			oldwarnmessage("EVENT PREDICTION", "There can be an event in or after Room "..tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value + ChaseStartVal).."!", 10)
		end
	end
end)

local noeyesdamagebtn = window_entities:AddToggle({
	Name = "No Eyes Damage",
	Value = false,
	Callback = function(val, oldval)
		flags.noeyesdamage = val
	end
})
buttons.noeyesdamage = noeyesdamagebtn

local noseekbtn = window_entities:AddToggle({
	Name = "Disable Seek chase",
	Value = false,
	Callback = function(val, oldval)
		flags.noseek = val

		if val then
			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				local trigger = room:WaitForChild("TriggerEventCollision",2)

				if trigger then
					trigger:Destroy() 
				end
			end)

			repeat task.wait() until POOPDOORSLOADED == false or not flags.noseek
			addconnect:Disconnect()
		end
	end
})
buttons.noseek = noseekbtn

local ScreechModule = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("Screech")
local noscreechbtn = window_entities:AddToggle({
	Name = "Harmless Screech",
	Value = false,
	Callback = function(val, oldval)
		flags.noscreech = val

		if val then
			if not ScreechModule then ScreechModule = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("Screech") end
			ScreechModule.Parent = nil
		else
			ScreechModule.Parent = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules
		end
	end
})
buttons.noscreech = noscreechbtn

local SpiderJumpscareModule = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("SpiderJumpscare")
local notimothybtn = window_entities:AddToggle({
	Name = "No Timothy (Spider) Jumpscare",
	Value = false,
	Callback = function(val, oldval)
		flags.notimothy = val

		if val then
			if not SpiderJumpscareModule then SpiderJumpscareModule = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("SpiderJumpscare") end
			SpiderJumpscareModule.Parent = nil
		else
			SpiderJumpscareModule.Parent = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules
		end
	end
})
buttons.notimothy = notimothybtn

if hookmetamethod and newcclosure and getnamecallmethod then
	window_entities:AddLabel({ Name = "Do not click when playing the" })
	window_entities:AddLabel({ Name = "heartbeat minigame if you have" })
	window_entities:AddLabel({ Name = "'always win heartbeat' on!" })
	local heartbeatwinbtn = window_entities:AddToggle({
		Name = "Always win Heartbeat minigame",
		Value = false,
		Callback = function(val, oldval)
			flags.heartbeatwin = val
		end
	})
	buttons.heartbeatwin = heartbeatwinbtn

	local old
	old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
		local args = {...}
		local method = getnamecallmethod()

		if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and flags.heartbeatwin == true then
			args[2] = true
			return old(self,unpack(args))
		end

		return old(self,...)
	end))
else
	warnmessage("POOPDOORS EDITED v"..currentver, "You need to have hookmetamethod and newcclosure and getnamecallmethod functions for 'always win heartbeat'.", 7)
end

--[[local avoidrushambushbtn = window_entities:AddToggle({
	Name = "Avoid Rush & Ambush",
	Value = false,
	Callback = function(val, oldval)
		flags.avoidrushambush = val
	end
})
buttons.avoidrushambush = avoidrushambushbtn--]]
local eyesspawned = false
workspace.ChildAdded:Connect(function(inst)
	task.spawn(function()
		if table.find(entitynames, inst.Name) and flags.hintrush == true then
			if inRooms == true then
				if inst.Name:gsub("Moving","") == "A60" then
					warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "12350986086", inst)
				elseif inst.Name:gsub("Moving","") == "A120" then
					warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "12351008553", inst)
				else
					task.wait(.1)
					if plr:DistanceFromCharacter(inst:GetPivot().Position) < 400 and inst:IsDescendantOf(workspace) then
						warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "0", inst)
					end
				end
			else
				--if flags.avoidrushambush == false then
				repeat task.wait() until plr:DistanceFromCharacter(inst:GetPivot().Position) < 400 or not inst:IsDescendantOf(workspace)

				if inst:IsDescendantOf(workspace) then
					if inst.Name:gsub("Moving","") == "Rush" then
						warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "11102256553", inst)
					elseif inst.Name:gsub("Moving","") == "Ambush" then
						warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "10938726652", inst)
					elseif inst.Name:gsub("Moving","") == "Eyes" then
						task.spawn(function()
							if flags.noeyesdamage == true then
								eyesspawned = true
								local con = game:GetService("RunService").RenderStepped:Connect(function()
									eyesspawned = true
									local legrot = 0
									local bodypitch = 85 -- legit -65
									local bodyrot = 0
									game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(legrot, bodypitch, bodyrot, false)
								end)
								inst.Destroying:Wait()
								con:Disconnect()
								eyesspawned = false
							end
						end)
						warnmessage("ENTITIES", inst.Name:gsub("Moving","").." spawned.", "Don't look at it!", 10, "10865377903")
					else
						warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "0", inst)
					end
					--inst.Destroying:Wait()
					--warnmessage("ENTITIES", "It's now completely safe to leave the hiding spot.", 7)
					--	end
				end
			end
		end
	end)

	--[[if flags.avoidrushambush == true then
		if inst.Name == "RushMoving" or inst.Name == "AmbushMoving" then
			repeat task.wait() until plr:DistanceFromCharacter(inst:GetPivot().Position) < 400 or not inst:IsDescendantOf(workspace)

			if inst:IsDescendantOf(workspace) then
				if inst.Name:gsub("Moving","") == "Rush" then
					warnmessage("ENTITIES", "Avoiding "..inst.Name:gsub("Moving",""), "Please wait...", 0, "11102256553", inst)
				elseif inst.Name:gsub("Moving","") == "Ambush" then
					warnmessage("ENTITIES", "Avoiding "..inst.Name:gsub("Moving",""), "Please wait...", 0, "10938726652", inst)
				else
					warnmessage("ENTITIES", "Avoiding "..inst.Name:gsub("Moving",""), "Please wait...", 0, "0", inst)
				end

				local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				local oldwalkspeed = hum.WalkSpeed
				
				local pos = CFrame.new(
					OldPos + Vector3.new(
						0,
						avoidingYvalue,
						0
					) 
				)
				
				local function getrecentroom(index)
					local rooms = workspace.CurrentRooms:GetChildren() 
					table.sort(rooms,function(a,b)
						return tonumber(a.Name) > tonumber(b.Name) 
					end)

					return rooms[index]
				end
				local room = getrecentroom(2)
				local door = room:WaitForChild("Door")

				local CFrameValue = Instance.new("CFrameValue")
				CFrameValue.Value = game.Players.LocalPlayer.Character:GetPivot()
				CFrameValue:GetPropertyChangedSignal("Value"):connect(function()
					--game.Players.LocalPlayer.Character:PivotTo(CFrameValue.Value)
					game.Players.LocalPlayer.Character.Collision.CFrame = CFrameValue.Value
				end)
				local tween = game:GetService("TweenService"):Create(CFrameValue, TweenInfo.new(1.5), {
					Value = pos
				})
				tween:Play()

				local con
				tween.Completed:connect(function()
					CFrameValue:Destroy() 
					con = game:GetService("RunService").RenderStepped:Connect(function()
						--game.Players.LocalPlayer.Character:PivotTo(pos)
						game.Players.LocalPlayer.Character.Collision.CFrame = pos
					end)
				end)

				inst.Destroying:Wait()
				con:Disconnect()

				local CFrameValue = Instance.new("CFrameValue")
				CFrameValue.Value = game.Players.LocalPlayer.Character:GetPivot()
				CFrameValue:GetPropertyChangedSignal("Value"):connect(function()
					game.Players.LocalPlayer.Character:PivotTo(CFrameValue.Value)
				end)
				local tween = game:GetService("TweenService"):Create(CFrameValue, TweenInfo.new(1.5), {Value = CFrame.new(OldPos)})
				tween:Play()
				tween.Completed:connect(function()
					CFrameValue:Destroy() 
					--game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
				end)
			end
		end
	end--]]
end)

print("Loading rooms (doors) tab")

local noseekarmsfirebtn = window_roomsdoors:AddToggle({
	Name = "No Seek Arms & Fire",
	Value = false,
	Callback = function(val, oldval)
		flags.noseekarmsfire = val
	end
})
game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
	task.wait(.1)
	for _,descendant in pairs(game:GetService("Workspace").CurrentRooms:GetDescendants()) do
		if descendant.Name == "Seek_Arm" or descendant.Name == "ChandelierObstruction" then
			descendant.Parent = nil
			descendant:Destroy()
		end
	end
end)
buttons.noseekarmsfire = noseekarmsfirebtn

window_roomsdoors:AddLabel({ Name = "'Skip Room' functions doesn't work\nwithout an anticheat bypass."})
if fireproximityprompt then
	window_roomsdoors:AddButton({
		Name = "Skip Current Room",
		Callback = function()
			pcall(function()
				local key = false
				local lever = false
				local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
				for _,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
					if object.Name == "KeyObtain" then
						key = object
					end
				end
				for _,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
					if object.Name == "LeverForGate" then
						lever = object
					end
				end
				if LatestRoom.Value == 50 then
					CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
					game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
				else
					if key then
						game.Players.LocalPlayer.Character:PivotTo(CFrame.new(key.Hitbox.Position))
						task.wait(.3)
						fireproximityprompt(key.ModulePrompt)
						task.wait(.3)
						game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
						task.wait(.3)
						fireproximityprompt(CurrentDoor.Lock.UnlockPrompt)
					end
					if lever then
						game.Players.LocalPlayer.Character:PivotTo(CFrame.new(lever.Main.Position))
						task.wait(.3)
						fireproximityprompt(lever.ActivateEventPrompt)
						task.wait(.3)
						game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
					end
					game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
				end
				task.wait(.45)
				CurrentDoor.ClientOpen:FireServer()
			end)
		end
	})
else
	oldwarnmessage("POOPDOORS EDITED v"..currentver, "You need to have fireproximityprompt function for 'skip room'.", 7)	
end

window_roomsdoors:AddLabel({ Name = "You need to be close to the\nlibrary exit for this to work."})
window_roomsdoors:AddButton({
	Name = "Skip Room 50",
	Callback = function()
		pcall(function()
			if LatestRoom.Value == 50 then
				local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
				game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
			end
		end)
	end
})

if fireproximityprompt then
	local autoskiproomsbtn = window_roomsdoors:AddToggle({
		Name = "Auto Room-Skip",
		Value = false,
		Callback = function(val, oldval)
			flags.autoskiprooms = val

			pcall(function()
				if val then
					repeat
						local key = false
						local lever = false
						local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
						for _,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
							if object.Name == "KeyObtain" then
								key = object
							end
						end
						for _,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
							if object.Name == "LeverForGate" then
								lever = object
							end
						end
						if LatestRoom.Value == 50 then
							CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
							game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
						else
							if key then
								game.Players.LocalPlayer.Character:PivotTo(CFrame.new(key.Hitbox.Position))
								task.wait(.3)
								fireproximityprompt(key.ModulePrompt)
								task.wait(.3)
								game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
								task.wait(.3)
								fireproximityprompt(CurrentDoor.Lock.UnlockPrompt)
							end
							if lever then
								game.Players.LocalPlayer.Character:PivotTo(CFrame.new(lever.Main.Position))
								task.wait(.3)
								fireproximityprompt(lever.ActivateEventPrompt)
								task.wait(.3)
								game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
							end
							game.Players.LocalPlayer.Character:PivotTo(CFrame.new(CurrentDoor.Door.Position))
						end
						task.wait(.45)
						CurrentDoor.ClientOpen:FireServer()
						task.wait(.1)
					until not flags.autoskiprooms
				end
			end)
		end
	})
	buttons.autoskiprooms = autoskiproomsbtn
else
	oldwarnmessage("POOPDOORS EDITED v"..currentver, "You need to have fireproximityprompt function for 'skip room'.", 7)
end

local elevatorbreakerbox = false
window_roomsdoors:AddLabel({ Name = "Press this only if you have the\nbreaker box minigame on." })
window_roomsdoors:AddButton({
	Name = "Complete Elevator Breaker Box",
	Callback = function()
		if elevatorbreakerbox == false then
			elevatorbreakerbox = true
			oldnormalmessage("ELEVATOR BREAKER BOX", "Trying to comeplete breaker box. Please wait...",5)
			game:GetService("ReplicatedStorage").EntityInfo.EBF:FireServer()
			for i = 0, 50 do game:GetService("ReplicatedStorage").EntityInfo.EBF:FireServer()task.wait(.1) end
			game:GetService("ReplicatedStorage").EntityInfo.EBF:FireServer()
			oldnormalmessage("ELEVATOR BREAKER BOX", "If it didn't complete breaker box, try going to the elevator.\nIf that didn't work try it again.",5)		
			elevatorbreakerbox = false
		end
	end
})

print("Loading misc tab")

local nogatesbtn = window_misc:AddToggle({
	Name = "Delete Gates",
	Value = false,
	Callback = function(val, oldval)
		flags.nogates = val

		if val then
			spawn(function()
				for _,room in pairs(workspace.CurrentRooms:GetChildren()) do
					local gate = room:WaitForChild("Gate",2)

					if gate then
						local door = gate:WaitForChild("ThingToOpen",2)

						if door then
							door:Destroy() 
						end
					end
				end
			end)

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				local gate = room:WaitForChild("Gate",2)

				if gate then
					local door = gate:WaitForChild("ThingToOpen",2)

					if door then
						door:Destroy() 
					end
				end
			end)

			spawn(function()
				local gate = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Gate",2)
				if gate then
					local door = gate:WaitForChild("ThingToOpen",2)
					if door then
						door:Destroy() 
					end
				end
			end)

			repeat task.wait() until POOPDOORSLOADED == false or not flags.nogates
			addconnect:Disconnect()
		end
	end
})
buttons.nogates = nogatesbtn
local nopuzzlebtn = window_misc:AddToggle({
	Name = "Delete Puzzle Doors",
	Value = false,
	Callback = function(val, oldval)
		flags.nopuzzle = val

		if val then
			spawn(function()
				for _,room in pairs(workspace.CurrentRooms:GetChildren()) do
					local assets = room:WaitForChild("Assets")
					local paintings = assets:WaitForChild("Paintings",2)

					if paintings then
						local door = paintings:WaitForChild("MovingDoor",2)

						if door then
							door:Destroy() 
						end 
					end
				end
			end)

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				local assets = room:WaitForChild("Assets")
				local paintings = assets:WaitForChild("Paintings",2)

				if paintings then
					local door = paintings:WaitForChild("MovingDoor",2)

					if door then
						door:Destroy() 
					end 
				end
			end)

			spawn(function()
				local assets = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets")
				local paintings = assets:WaitForChild("Paintings",2)
				if paintings then
					local door = paintings:WaitForChild("MovingDoor",2)
					if door then
						door:Destroy() 
					end 
				end
			end)

			repeat task.wait() until POOPDOORSLOADED == false or not flags.nopuzzle
			addconnect:Disconnect()
		end
	end
})
buttons.nopuzzle = nopuzzlebtn
local noskeledoorsbtn = window_misc:AddToggle({
	Name = "Delete Skeleten Doors",
	Value = false,
	Callback = function(val, oldval)
		flags.noskeledoors = val

		if val then
			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				local door = room:WaitForChild("Wax_Door",2)

				if door then
					door:Destroy() 
				end
			end)

			spawn(function()
				local door = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Wax_Door",2)
				if door then
					door:Destroy() 
				end 
			end)

			repeat task.wait() until POOPDOORSLOADED == false or not flags.noskeledoors
			addconnect:Disconnect()
		end
	end
})
buttons.noskeledoors = noskeledoorsbtn
local getcodebtn = window_misc:AddToggle({
	Name = "Auto Library Code",
	Value = false,
	Callback = function(val, oldval)
		flags.getcode = val

		if val then
			local function deciphercode()
				local paper = char:FindFirstChild("LibraryHintPaper")
				local hints = plr.PlayerGui:WaitForChild("PermUI"):WaitForChild("Hints")

				local code = {[1]="_",[2]="_",[3]="_",[4]="_",[5]="_"}

				if paper then
					for i,v in pairs(paper:WaitForChild("UI"):GetChildren()) do
						if v:IsA("ImageLabel") and v.Name ~= "Image" then
							for i,img in pairs(hints:GetChildren()) do
								if img:IsA("ImageLabel") and img.Visible and v.ImageRectOffset == img.ImageRectOffset then
									local num = img:FindFirstChild("TextLabel").Text

									code[tonumber(v.Name)] = num 
								end
							end
						end
					end 
				end

				return code
			end

			local apart
			local addconnect
			addconnect = char.ChildAdded:Connect(function(v)
				if v:IsA("Tool") and v.Name == "LibraryHintPaper" then
					task.wait()
					local code = table.concat(deciphercode())

					if code:find("_") then
						warnmessage("ROOM 50", "You are still missing some books!", "The current code is: '".. code.."'", 7)
					else
						if apart == nil then
							apart = Instance.new("Part", game.ReplicatedStorage)
							apart.CanCollide = false
							apart.Anchored = true
							apart.Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
							apart.Transparency = 1
							normalmessage("ROOM 50", "The code is '".. code.."'.", "", 5, nil, nil, apart)
							repeat task.wait(.1) until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value ~= 50
							apart:Destroy()
							apart = nil
						end
					end
				end
			end)

			repeat task.wait() until POOPDOORSLOADED == false or not flags.getcode
			addconnect:Disconnect()
		end
	end
})
buttons.getcode = getcodebtn
local roomsnolockbtn = window_misc:AddToggle({
	Name = "A-000 Door No Locks",
	Value = false,
	Callback = function(val, oldval)
		flags.roomsnolock = val

		if val then
			local function check(room)
				local door = room:WaitForChild("RoomsDoor_Entrance",2)

				if door then
					local prompt = door:WaitForChild("Door"):WaitForChild("EnterPrompt")
					prompt.Enabled = true
				end 
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				check(room)
			end)

			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				check(v)
			end

			spawn(function()
				check(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end)

			repeat task.wait() until POOPDOORSLOADED == false or not flags.roomsnolock
			addconnect:Disconnect()
		end
	end
})
buttons.roomsnolock = roomsnolockbtn

if fireproximityprompt then
	local draweraurabtn = window_misc:AddToggle({
		Name = "Loot Aura",
		Value = false,
		Callback = function(val, oldval)
			flags.draweraura = val

			if val then
				local function setup(room)
					local function check(v)
						task.wait()
						if v:IsA("Model") then
							--	if v.PrimaryPart then
							task.wait()
							if v.Name == "DrawerContainer" or v.Name == "RolltopContainer" then
								if v.Name == "RolltopContainer" then
									local prompt = v:WaitForChild("ActivateEventPrompt")
									local interactions = prompt:GetAttribute("Interactions")

									if not interactions then
										task.spawn(function()
											repeat task.wait(0.1)
												--pcall(function()
												local posok = false
												pcall(function()
													local posoks, posoke = pcall(function()
														posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
													end)
													if posoke then
														local part
														for _,v in pairs(v:GetChildren()) do
															local hasProperty = pcall(function() local t = v["Position"] end)
															if hasProperty then
																part = v
																break
															end
														end
														posok = (plr:DistanceFromCharacter(part.Position) <= 12)
													end
												end)
												if posok then
													fireproximityprompt(prompt)
												end
												--end)
											until prompt:GetAttribute("Interactions") or not flags.draweraura
										end)
									end
								else
									local knob = v:WaitForChild("Knobs")

									if knob then
										local prompt = knob:WaitForChild("ActivateEventPrompt")
										local interactions = prompt:GetAttribute("Interactions")

										if not interactions then
											task.spawn(function()
												repeat task.wait(0.1)
													--pcall(function()
													local posok = false
													pcall(function()
														local posoks, posoke = pcall(function()
															posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
														end)
														if posoke then
															local part
															for _,v in pairs(v:GetChildren()) do
																local hasProperty = pcall(function() local t = v["Position"] end)
																if hasProperty then
																	part = v
																	break
																end
															end
															posok = (plr:DistanceFromCharacter(part.Position) <= 12)
														end
													end)
													if posok then
														fireproximityprompt(prompt)
													end
													--end)
												until prompt:GetAttribute("Interactions") or not flags.draweraura
											end)
										end
									end
								end
							elseif v.Name == "KeyObtain" or v.Name == "ElectricalKeyObtain" then
								local prompt = v:WaitForChild("ModulePrompt")
								local interactions = prompt:GetAttribute("Interactions")

								if not interactions then
									task.spawn(function()
										repeat task.wait(0.1)
											--pcall(function()
											local posok = false
											pcall(function()
												local posoks, posoke = pcall(function()
													posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
												end)
												if posoke then
													local part
													for _,v in pairs(v:GetChildren()) do
														local hasProperty = pcall(function() local t = v["Position"] end)
														if hasProperty then
															part = v
															break
														end
													end
													posok = (plr:DistanceFromCharacter(part.Position) <= 12)
												end
											end)
											if posok then
												fireproximityprompt(prompt) 
											end
											--end)
										until prompt:GetAttribute("Interactions") or not flags.draweraura
									end)
								end
							elseif v.Name == "Green_Herb" then
								local plant = v:WaitForChild("Plant")

								if plant then
									local prompt = plant:WaitForChild("HerbPrompt")
									local okcanckl = 0
									task.spawn(function()
										repeat task.wait(0.1)
											--pcall(function()
											local posok = false
											pcall(function()
												local posoks, posoke = pcall(function()
													posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
												end)
												if posoke then
													local part
													for _,v in pairs(v:GetChildren()) do
														local hasProperty = pcall(function() local t = v["Position"] end)
														if hasProperty then
															part = v
															break
														end
													end
													posok = (plr:DistanceFromCharacter(part.Position) <= 12)
												end
											end)
											if posok then
												fireproximityprompt(prompt) 
												okcanckl += 1
											end 
											--end)
										until prompt:GetAttribute("Interactions") or not flags.draweraura or okcanckl > 35
									end)
								end
							elseif v.Name == "PickupItem" then
								if game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 51 or game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 52 then
									return
								end

								local prompt = v:WaitForChild("ModulePrompt")
								local okcanckl = 0
								task.spawn(function()
									repeat task.wait(0.1)
										--pcall(function()
										local posok = false
										pcall(function()
											local posoks, posoke = pcall(function()
												posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
											end)
											if posoke then
												local part
												for _,v in pairs(v:GetChildren()) do
													local hasProperty = pcall(function() local t = v["Position"] end)
													if hasProperty then
														part = v
														break
													end
												end
												posok = (plr:DistanceFromCharacter(part.Position) <= 12)
											end
										end)
										if posok then
											fireproximityprompt(prompt) 
											okcanckl += 1
										end
										--end)
									until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.draweraura or okcanckl > 20
								end)
							elseif v:GetAttribute("Pickup") or v:GetAttribute("PropType") then
								if game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 51 or game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 52 then
									return
								end

								local prompt = v:WaitForChild("ModulePrompt", 2)
								if prompt == nil then
									prompt = v:FindFirstChildWhichIsA("ProximityPrompt")
									if prompt == nil then
										for _,vvvvv in pairs(v:GetDescendants()) do
											if vvvvv:IsA("ProximityPrompt") then
												prompt = vvvvv
												break
											end
										end
									end
								end

								task.spawn(function()
									repeat task.wait(0.1)
										--pcall(function()
										local posok = false
										pcall(function()
											local posoks, posoke = pcall(function()
												posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
											end)
											if posoke then
												local part
												for _,v in pairs(v:GetChildren()) do
													local hasProperty = pcall(function() local t = v["Position"] end)
													if hasProperty then
														part = v
														break
													end
												end
												posok = (plr:DistanceFromCharacter(part.Position) <= 12)
											end
										end)
										if posok then
											fireproximityprompt(prompt) 
										end
										--end)
									until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.draweraura
								end)
							elseif v.Name == "GoldPile" then
								local prompt = v:WaitForChild("LootPrompt")
								local interactions = prompt:GetAttribute("Interactions")

								if not interactions then
									task.spawn(function()
										repeat task.wait(0.1)
											--pcall(function()
											local posok = false
											pcall(function()
												local posoks, posoke = pcall(function()
													posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
												end)
												if posoke then
													local part
													for _,v in pairs(v:GetChildren()) do
														local hasProperty = pcall(function() local t = v["Position"] end)
														if hasProperty then
															part = v
															break
														end
													end
													posok = (plr:DistanceFromCharacter(part.Position) <= 12)
												end
											end)
											if posok then
												fireproximityprompt(prompt) 
											end 
											--end)
										until prompt:GetAttribute("Interactions") or not flags.draweraura
									end)
								end
							elseif v.Name:sub(1,8) == "ChestBox" then
								local prompt = v:WaitForChild("ActivateEventPrompt")
								local interactions = prompt:GetAttribute("Interactions")

								if not interactions then
									task.spawn(function()
										repeat task.wait(0.1)
											--pcall(function()
											local posok = false
											pcall(function()
												local posoks, posoke = pcall(function()
													posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
												end)
												if posoke then
													local part
													for _,v in pairs(v:GetChildren()) do
														local hasProperty = pcall(function() local t = v["Position"] end)
														if hasProperty then
															part = v
															break
														end
													end
													posok = (plr:DistanceFromCharacter(part.Position) <= 12)
												end
											end)
											if posok then
												fireproximityprompt(prompt)
											end
											--end)
										until prompt:GetAttribute("Interactions") or not flags.draweraura
									end)
								end
							elseif v.Name == "RolltopContainer" then
								local prompt = v:WaitForChild("ActivateEventPrompt")
								local interactions = prompt:GetAttribute("Interactions")

								if not interactions then
									task.spawn(function()
										repeat task.wait(0.1)
											--pcall(function()
											local posok = false
											pcall(function()
												local posoks, posoke = pcall(function()
													posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
												end)
												if posoke then
													local part
													for _,v in pairs(v:GetChildren()) do
														local hasProperty = pcall(function() local t = v["Position"] end)
														if hasProperty then
															part = v
															break
														end
													end
													posok = (plr:DistanceFromCharacter(part.Position) <= 12)
												end
											end)
											if posok then
												fireproximityprompt(prompt)
											end
											--end)
										until prompt:GetAttribute("Interactions") or not flags.draweraura
									end)
								end
							end 
							--end
						end
					end

					local subaddcon
					subaddcon = room.DescendantAdded:Connect(function(ve)
						check(ve) 
					end)

					for _,v in pairs(room:GetDescendants()) do
						task.spawn(function()
							check(v)
						end)
					end

					task.spawn(function()
						repeat task.wait() until POOPDOORSLOADED == false or not flags.draweraura
						subaddcon:Disconnect() 
					end)
				end

				local addconnect
				addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
					setup(room)
				end)

				for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
					if room:FindFirstChild("Assets") then
						setup(room) 
					end
				end
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])

				repeat task.wait() until POOPDOORSLOADED == false or not flags.draweraura
				addconnect:Disconnect()
			end
		end
	})
	buttons.draweraura = draweraurabtn
else
	oldwarnmessage("POOPDOORS EDITED v"..currentver, "You need to have fireproximityprompt function for 'loot aura'.", 7)
end

if fireproximityprompt then
	local bookcollecterbtn = window_misc:AddToggle({
		Name = "Book Aura",
		Value = false,
		Callback = function(val, oldval)
			flags.bookcollecter = val

			if val then
				local function setup(room)
					local function check(v)
						if v:IsA("Model") then
							--if v.PrimaryPart then
							if v.Name == "LiveHintBook" then
								local prompt = v:WaitForChild("ActivateEventPrompt")

								local okcanckl = 0
								task.spawn(function()
									repeat task.wait(0.1)
										local posok = false
										pcall(function()
											local posoks, posoke = pcall(function()
												posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
											end)
											if posoke then
												local part
												for _,v in pairs(v:GetChildren()) do
													local hasProperty = pcall(function() local t = v["Position"] end)
													if hasProperty then
														part = v
														break
													end
												end
												posok = (plr:DistanceFromCharacter(part.Position) <= 12)
											end
										end)
										if posok then
											fireproximityprompt(prompt) 
											okcanckl += 1
										end
									until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.bookcollecter or okcanckl > 50
								end)
							end
							--end
						end

					end

					local subaddcon
					subaddcon = room.DescendantAdded:Connect(function(v)
						check(v) 
					end)

					for i,v in pairs(room:GetDescendants()) do
						check(v)
					end

					task.spawn(function()
						repeat task.wait() until POOPDOORSLOADED == false or not flags.bookcollecter
						subaddcon:Disconnect() 
					end)
				end

				repeat task.wait()if flags.bookcollecter == false then break end until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50

				if flags.bookcollecter == true then
					local addconnect
					addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
						setup(room)
					end)

					for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
						if room:FindFirstChild("Assets") then
							setup(room) 
						end
					end
					--	if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
					setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
					--	end

					repeat task.wait() until POOPDOORSLOADED == false or not flags.bookcollecter
					addconnect:Disconnect()
				end
			end
		end
	})
	buttons.bookcollecter = bookcollecterbtn
else
	oldwarnmessage("POOPDOORS EDITED v"..currentver, "You need to have fireproximityprompt function for 'book aura'.", 7)
end

if fireproximityprompt then
	local breakercollecterbtn = window_misc:AddToggle({
		Name = "Breaker Aura",
		Value = false,
		Callback = function(val, oldval)
			flags.breakercollecter = val

			if val then
				local function setup(room)
					local function check(v)
						if v:IsA("Model") then
							--if v.PrimaryPart then
							if v.Name == "LiveBreakerPolePickup" then
								local prompt = v:WaitForChild("ActivateEventPrompt")

								local okcanckl = 0
								task.spawn(function()
									repeat task.wait(0.1)
										local posok = false
										pcall(function()
											local posoks, posoke = pcall(function()
												posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
											end)
											if posoke then
												local part
												for _,v in pairs(v:GetChildren()) do
													local hasProperty = pcall(function() local t = v["Position"] end)
													if hasProperty then
														part = v
														break
													end
												end
												posok = (plr:DistanceFromCharacter(part.Position) <= 12)
											end
										end)
										if posok then
											fireproximityprompt(prompt) 
											okcanckl += 1
										end
									until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.breakercollecter or okcanckl > 50
								end)
							end
							--end
						end

					end

					local subaddcon
					subaddcon = room.DescendantAdded:Connect(function(v)
						check(v) 
					end)

					for i,v in pairs(room:GetDescendants()) do
						check(v)
					end

					task.spawn(function()
						repeat task.wait() until POOPDOORSLOADED == false or not flags.breakercollecter
						subaddcon:Disconnect() 
					end)
				end

				repeat task.wait()if flags.breakercollecter == false then break end until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 100

				if flags.breakercollecter == true then
					local addconnect
					addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
						setup(room)
					end)

					for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
						if room:FindFirstChild("Assets") then
							setup(room) 
						end
					end
					--	if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
					setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
					--	end

					repeat task.wait() until POOPDOORSLOADED == false or not flags.breakercollecter
					addconnect:Disconnect()
				end
			end
		end
	})
	buttons.breakercollecter = breakercollecterbtn
else
	oldwarnmessage("POOPDOORS EDITED v"..currentver, "You need to have fireproximityprompt function for 'book aura'.", 7)
end

if fireproximityprompt then
	local autopullleverbtn = window_misc:AddToggle({
		Name = "Lever Aura",
		Value = false,
		Callback = function(val, oldval)
			flags.autopulllever = val

			if val then
				local function setup(room)
					local function check(v)
						--if v:IsA("Model") then
						--	if v.PrimaryPart then
						if v.Name == "LeverForGate" then
							local prompt = v:WaitForChild("ActivateEventPrompt")

							local okcanckl = 0
							pcall(function() v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function() okcanckl = 100 end) end)
							task.spawn(function()
								repeat task.wait(0.1)
									local posok = false
									pcall(function()
										local posoks, posoke = pcall(function()
											posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
										end)
										if posoke then
											local part
											for _,v in pairs(v:GetChildren()) do
												local hasProperty = pcall(function() local t = v["Position"] end)
												if hasProperty then
													part = v
													break
												end
											end
											posok = (plr:DistanceFromCharacter(part.Position) <= 12)
										end
									end)
									if posok then
										fireproximityprompt(prompt) 
										okcanckl += 1
									end
								until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.autopulllever or okcanckl > 50
							end)
						end
						--	end
						--endd

					end

					local subaddcon
					subaddcon = room.DescendantAdded:Connect(function(v)
						check(v) 
					end)

					for i,v in pairs(room:GetDescendants()) do
						check(v)
					end

					task.spawn(function()
						repeat task.wait() until POOPDOORSLOADED == false or not flags.autopulllever
						subaddcon:Disconnect() 
					end)
				end

				if flags.autopulllever == true then
					local addconnect
					addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
						setup(room)
					end)

					for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
						if room:FindFirstChild("Assets") then
							setup(room) 
						end
					end
					--	if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
					setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
					--	end

					repeat task.wait() until POOPDOORSLOADED == false or not flags.autopulllever
					addconnect:Disconnect()
				end
			end
		end
	})
	buttons.autopulllever = autopullleverbtn
else
	oldwarnmessage("POOPDOORS EDITED v"..currentver, "You need to have fireproximityprompt function for 'lever aura'.", 7)
end

if #game.Players:GetChildren() <= 1 or #game.Players:GetChildren() == 0 then
	window_misc:AddButton({
		Name = "Instant leave",
		Callback = function()
			confirmnotification("CONFIRM", "Are you sure you want to leave?", 15, function(state)
				if state == true then
					task.spawn(function()
						task.wait(.05)
						game:Shutdown()
					end)
					game.Players.LocalPlayer:Kick()
				end
			end)
		end
	})
end
print("Loading anticheat bypasses tab")
window_anticheatbyppasses:AddLabel({ Name = "Method 1 Info:"})
window_anticheatbyppasses:AddLabel({ Name = "This method will make it so"})
window_anticheatbyppasses:AddLabel({ Name = " you CANT pick up ANYTHING so"})
window_anticheatbyppasses:AddLabel({ Name = " only do this in multiplayer." })
window_anticheatbyppasses:AddLabel({ Name = "If you use this in rooms you" })
window_anticheatbyppasses:AddLabel({ Name = " will NOT get the a-1000 badge!" })
window_anticheatbyppasses:AddButton({
	Name = "Method 1",
	Callback = function()
		confirmnotification("AC BYPASS", "Are you sure you want to bypass anticheat with method 1?", 15, function(state)
			if state == true then
				flags.anticheatbypass = true
				local newhum = hum:Clone()
				newhum.Name = "humlol"
				newhum.Parent = char
				task.wait()
				hum.Parent = nil

				hum = newhum
				walkspeedslider:SetMax(75)
				normalmessage("AC BYPASS", "Anticheat bypassed with method 1!", "", 7)
			end
		end)
	end
})

print("Loading experimentals tab")
if syn then
	if syn.queue_on_teleport then
		window_experimentals:AddButton({
			Name = "Start a new solo run",
			Callback = function()
				syn.queue_on_teleport([[
					game.Loaded:Wait()
					loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/joinsolo.lua"),true))()
				]])
				game:GetService("TeleportService"):Teleport(6516141723, game:GetService("Players").LocalPlayer)
			end
		})
	end--]]
elseif queue_on_teleport then
	window_experimentals:AddButton({
		Name = "Start a new solo run",
		Callback = function()
			queue_on_teleport([[
				game.Loaded:Wait()
				loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/joinsolo.lua"),true))()	
			]])
			game:GetService("TeleportService"):Teleport(6516141723, game:GetService("Players").LocalPlayer)
		end
	})
end

local PathRunning = nil
local Wardrobes = {}
local Wardrobe = nil
local CurrentWardrobe = nil

local window_rooms = GUI:CreateSection({
	Name = "The Rooms"
})

print("Loading the rooms tab")
if game.ReplicatedStorage:WaitForChild("GameData"):WaitForChild("Floor").Value == "Rooms" then
	-- anti afk by geodude#2619
	task.spawn(function()
		--	pcall(function()
		local GC = getconnections or get_signal_cons
		if GC then
			for i,v in pairs(GC(plr.Idled)) do
				if v["Disable"] then
					v["Disable"](v)
				elseif v["Disconnect"] then
					v["Disconnect"](v)
				end
			end
		else
			game:GetService("Players").LocalPlayer.Idled:Connect(function()
				game:GetService("VirtualUser"):CaptureController()
				game:GetService("VirtualUser"):ClickButton2(Vector2.new()) 
			end)
		end
		--end)
	end)
	inRooms = true

	local Pathfinding_Highlights = game.Workspace:FindFirstChild("Pathfinding_Highlights")
	if Pathfinding_Highlights == nil then
		Pathfinding_Highlights = Instance.new("Folder", workspace)
		Pathfinding_Highlights.Name = "Pathfinding_Highlights"
	end
	Pathfinding_Highlights:ClearAllChildren()

	local A90Module = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90")
	local noa90btn = window_rooms:AddToggle({
		Name = "Harmless A-90",
		Callback = function(val, oldval)
			flags.noa90 = val

			if val then
				if not A90Module then A90Module = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90") end
				if A90Module then
					A90Module.Parent = nil
				end
			else
				if A90Module then
					A90Module.Parent = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules
				end
			end
		end
	})
	buttons.noa90 = noa90btn

	function clearWardrobes()
		Wardrobes = {}
		Wardrobe = nil
		CurrentWardrobe = nil
	end

	function loadWardrobes()
		clearWardrobes()
		local function check(assets)
			for _,v in pairs(assets:GetDescendants()) do
				if v.Name == "Rooms_Locker" then
					if v:FindFirstChild("Door") and v:FindFirstChild("HidePrompt") then
						if v.HiddenPlayer.Value == nil  then
							if v.Door.Position.Y > -3 then
								if not table.find(Wardrobes, v) then
									table.insert(Wardrobes, v)
								end
							end
						end
					end
				end
			end
		end

		check(game:GetService("Workspace").CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value])
		check(game:GetService("Workspace").CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value-1])
		check(game:GetService("Workspace").CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value-2])
		check(game:GetService("Workspace").CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]) -- check again

		for i,v in pairs(Wardrobes) do
			if Wardrobe == nil then
				Wardrobe = v
			else
				if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Door.Position).Magnitude < (Wardrobe.Door.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
					Wardrobe = v
				end
			end
		end
	end
	function getWardrobe()
		loadWardrobes()
		return Wardrobe
	end

	function getWalkPart()
		local P = nil

		local A60_A120 = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
		if A60_A120 then -- and A60_A120.Main.Position.Y > -4 then
			P = getWardrobe()
		else
			P = game:GetService("Workspace").CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value].Door
		end

		return P
	end

	function unhidefunc() plr.Character:SetAttribute("Hiding",false) end
	function isLocker(Part)
		return Part.Name == "Rooms_Locker"
	end 

	local autoa1000 = nil
	autoa1000 = window_rooms:AddToggle({
		Name = "Auto A-1000",
		Value = false,
		Callback = function(val, oldval)
			if flags.noa90 == false then noa90btn:Set(true);oldnormalmessage("AUTO A-1000", "Enabled Harmless A90", 5) end

			if PathRunning == true then 
				PathRunning = false
				task.wait()
			end

			flags.autorooms = val
			if val then
				local goingToHide = false
				local HideCheck = game:GetService("RunService").RenderStepped:Connect(function()
					if flags.autorooms == true then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
						game.Players.LocalPlayer.Character.Collision.CanCollide = false
						game.Players.LocalPlayer.Character.Collision.Size = Vector3.new(8, game.Players.LocalPlayer.Character.Collision.Size.Y, 8)
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 21

						local Part = getWalkPart()
						local A60_A120 = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
						if A60_A120 then
							if Part then
								if isLocker(Part) then
									if A60_A120.Main.Position.Y > -4 then
										if plr:DistanceFromCharacter(Part.Door.Position) <= 9 then
											goingToHide = true
											if plr.Character.HumanoidRootPart.Anchored == false then
												fireproximityprompt(Part.HidePrompt)
											end
											--else if plr:DistanceFromCharacter(Part.Door.Position) <= 11.5 then plr.Character:PivotTo(Part.Door.CFrame) end
										end
									end
								end
							end
						else
							if plr.Character.HumanoidRootPart.Anchored == true then 
								repeat task.wait() until not (workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120"))
								unhidefunc();goingToHide = false 
							end
						end

						if game.Players.LocalPlayer.Character.Humanoid.Health < 1 then autoa1000:Set(false) end
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
						game.Players.LocalPlayer.Character.Collision.CanCollide = true
						game.Players.LocalPlayer.Character.Collision.Size = Vector3.new(4, game.Players.LocalPlayer.Character.Collision.Size.Y, 4)
					end

					if flags.autorooms_blockcontrols == false then
						plr.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
					end
				end)

				while flags.autorooms do
					task.wait();if flags.noa90 == false then noa90btn:Set(true);oldnormalmessage("AUTO A-1000", "Enabled Harmless A90", 5) end
					--repeat task.wait() until goingToHide == false and plr.Character.HumanoidRootPart.Anchored == false

					local Part = getWalkPart()
					if goingToHide == false or not isLocker(Part) then
						unhidefunc()
					end

					local Highlight = Instance.new("Highlight", Pathfinding_Highlights)
					Highlight.FillColor = Color3.fromRGB(85, 255, 0)
					Highlight.Adornee = Part.Door

					task.spawn(function()
						if flags.autorooms_debug == true then
							if isLocker(Part) then
								oldnormalmessage("AUTO A-1000 [DEBUG]", "Trying to go to "..Part.Name..".", 5)
							else
								oldnormalmessage("AUTO A-1000 [DEBUG]", "Trying to go to next door ("..(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value + 1)..").", 5)
							end
						end
					end)

					local Path = PathfindingService:CreatePath({ 
						WaypointSpacing = 1, 
						AgentRadius = 0.8,
						AgentCanJump = false 
					})

					local HRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
					if not HRP then HRP = game.Players.LocalPlayer.Character.PrimaryPart end

					local Success, ErrorMessage = pcall(function()
						Path:ComputeAsync(HRP.Position - Vector3.new(0, 3, 0), Part.Door.Position)
					end)

					if Success and Path.Status == Enum.PathStatus.Success then 
						PathRunning = true
						local waypoints = Path:GetWaypoints()
						VisualizerFolder:ClearAllChildren()
						PathModule.visualize(waypoints)

						for i, v in pairs(waypoints) do
							if HRP.Anchored == false then
								if PathRunning == false then
									pcall(function() Highlight.OutlineTransparency = 1 end);pcall(function() Highlight.FillTransparency = 1 end);pcall(function() Highlight.Adornee = nil end)
									Pathfinding_Highlights:ClearAllChildren()
									VisualizerFolder:ClearAllChildren()
									break
								else
									Humanoid:MoveTo(v.Position)
									Humanoid.MoveToFinished:Wait()
								end
							end
						end

						if isLocker(Part) then
							repeat task.wait() until HRP.Anchored == false or plr.Character:GetAttribute("Hiding") == false or PathRunning == false
						end
						PathRunning = false
					end

					pcall(function() Highlight.OutlineTransparency = 1 end);pcall(function() Highlight.FillTransparency = 1 end);pcall(function() Highlight.Adornee = nil end)
					Pathfinding_Highlights:ClearAllChildren()
					VisualizerFolder:ClearAllChildren()
				end

				task.spawn(function()--if goingToHide == false then
					repeat task.wait() until flags.autorooms == false and goingToHide == false
					HideCheck:Disconnect()
					--else
					--HideCheck:Disconnect()
				end)--end
			else
				plr.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
			end
		end
	})
	buttons.autorooms = autoa1000
	local autorooms_debugbtn = window_rooms:AddToggle({
		Name = "Auto A-1000 - Debug Notifications",
		Value = false,
		Callback = function(val, oldval)
			flags.autorooms_debug = val
		end
	})
	buttons.autorooms_debug = autorooms_debugbtn
	local autoa1000blockcontrols = window_rooms:AddToggle({
		Name = "Auto A-1000 - Block Controls",
		Value = false,
		Callback = function(val, oldval)
			flags.autorooms_blockcontrols = val
		end
	})
	--buttons.autorooms_blockcontrols = autoa1000blockcontrols
	autoa1000blockcontrols:Set(true)

	LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
		if flags.autorooms == true then
			if LatestRoom.Value ~= 1000 then
				if flags.autorooms_blockcontrols == true then
					plr.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
				else
					plr.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
				end
			else
				plr.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
				autoa1000:Set(false)
				normalmessage("AUTO A-1000", "Finished walking to A-1000!", "Thanks for using POOPDOORS EDITED Auto A-1000.", 10)
			end
		else
			plr.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
		end
	end)
end

if inRooms == false then
	window_rooms:AddLabel({ Name = "You need to be in Rooms for this\nsection." })
end

print("Loading trolling tab")
local dropdownTrolling = window_Trolling:AddDropdown({
	Name = 'Body Positions (Server-Side)',
	List = {
		"None",
		"Upside Down",
		"Broken Back",
		"Seizure",
		"Twitching"
	},
	Callback = function(val)
		flags.dropdowntrolling = val
	end,
})
buttons.dropdowntrolling = dropdownTrolling

local MotorRepTest = false
local MotorReplicationBodyRot, MotorReplication, MotorReplicatione, MotorReplicationLegRot, MotorReplicationBodyPitch, MotorReplicationtoggle
if MotorRepTest == true then
	MotorReplication = GUIWindow:CreateTab({
		Name = "MotorRepTest"
	})
	MotorReplicatione = MotorReplication:CreateSection({
		Name = "MotorRepTest"
	})
	MotorReplicationtoggle = MotorReplicatione:AddToggle({
		Name = "Enabled",
		Value = false,
		Callback = function(val, oldval)
		end
	})
	MotorReplicationLegRot = MotorReplicatione:AddSlider({
		Name = "LegRot",
		Value = 0,
		Min = -4,
		Max = 4,
		Callback = function(val, oldval)
		end
	})
	MotorReplicationBodyPitch = MotorReplicatione:AddSlider({
		Name = "BodyPitch",
		Value = 0,
		Min = -360,
		Max = 360,
		Callback = function(val, oldval)
		end
	})
	MotorReplicationBodyRot = MotorReplicatione:AddSlider({
		Name = "BodyRot",
		Value = 0,
		Min = -180,
		Max = 180,
		Callback = function(val, oldval)
		end
	})
end

task.spawn(function()
	while true do
		if dropdownTrolling:Get() == "Twitching" then
			game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(0, 0, 180, false)
		end
		task.wait(math.random(0, 0.9))
	end
end)
game["Run Service"].RenderStepped:Connect(function()
	if MotorRepTest == false then
		if eyesspawned == false then
			if dropdownTrolling:Get() == "Upside Down" then
				game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(4, 0, 180, false)
			end
			if dropdownTrolling:Get() == "Broken Back" then
				game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(-4, -360, 180, false)
			end
			if dropdownTrolling:Get() == "Seizure" then
				game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(math.random(-4, 4), math.random(-360, 360), math.random(-180, 180), false)
			end
		end
	else
		if MotorReplicationtoggle:Get() == true then
			local legRotation = MotorReplicationLegRot:Get()
			local bodyPitch = MotorReplicationBodyPitch:Get()
			local bodyRotation = MotorReplicationBodyRot:Get()
			game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(legRotation, bodyPitch, bodyRotation, false)
		end
	end
end)

print("Loading gui toggle & close function")
function togglegui()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightShift, false, game)
	task.wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.RightShift, false, game)
end
function closegui()
	flags = DELFLAGS
	--flags.camfov = 70
	--flags.walkspeedtoggle = false
	pcall(function()
		for _,e in pairs(esptable) do
			for _,v in pairs(e) do
				pcall(function()
					v.delete()
				end)
			end
		end
	end)

	VisualizerFolder:Destroy()
	GlobalESPFolder:Destroy()
	pcall(function() MobileButton["1"]:Destroy() end)
	pcall(function() getgenv().POOPDOORSLOADED = false;POOPDOORSLOADED = false end)

	task.wait(.1)
	normalmessage("POOPDOORS EDITED v"..currentver, "GUI closed!")
end
window_guisettings:AddButton({
	Name = "Close Gui",
	Callback = function()
		Library.unload()
	end
})
window_guisettings:AddButton({
	Name = "Reload Gui",
	Callback = function()
		task.spawn(function()
			repeat task.wait(.1) until POOPDOORSLOADED == false or POOPDOORSLOADED == nil
			loadstring(game:HttpGet((gui_data.loadstring),true))()
		end)
		Library.unload()
	end
})

if isMobile == true then -- and mobiletoggles then 
	print("Loading mobile toggle button")
MobileButton["1"] = Instance.new("ScreenGui");
	MobileButton["1"]["Name"] = randomString()
	if get_hidden_gui or gethui then
		local HIDEUI = get_hidden_gui or gethui
		MobileButton["1"]["Parent"] = HIDEUI()
	elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
		syn.protect_gui(MobileButton["1"])
		MobileButton["1"]["Parent"] = game:GetService("CoreGui")
	elseif game:GetService("CoreGui"):FindFirstChild('RobloxGui') then
		MobileButton["1"]["Parent"] = game:GetService("CoreGui").RobloxGui
	else
		MobileButton["1"]["Parent"] = game:GetService("CoreGui")
	end
	MobileButton["1"]["IgnoreGuiInset"] = true;
	MobileButton["1"]["Name"] = [[PM]];
	MobileButton["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

	-- TopBar Frame
	MobileButton["2"] = Instance.new("Frame", MobileButton["1"]);
	MobileButton["2"]["BackgroundTransparency"] = 1;
	MobileButton["2"]["Size"] = UDim2.new(1, 0, 0, 36);
	MobileButton["2"]["Position"] = UDim2.new(0, 16, 0, 0);
	MobileButton["2"]["Name"] = [[LeftFrame]];
	MobileButton["3"] = Instance.new("UIListLayout", MobileButton["2"]);
	MobileButton["3"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
	MobileButton["3"]["FillDirection"] = Enum.FillDirection.Horizontal;
	MobileButton["3"]["Name"] = [[Layout]];
	MobileButton["3"]["Padding"] = UDim.new(0, 12);
	MobileButton["3"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	-- Fake Buttons
	MobileButton["4"] = Instance.new("Frame", MobileButton["2"]);
	MobileButton["4"]["BackgroundTransparency"] = 1;
	MobileButton["4"]["Size"] = UDim2.new(0, 32, 1, 0);
	MobileButton["4"]["Name"] = [[Place]];
	MobileButton["5"] = Instance.new("Frame", MobileButton["2"]);
	MobileButton["5"]["BackgroundTransparency"] = 1;
	MobileButton["5"]["Size"] = UDim2.new(0, 32, 1, 0);
	MobileButton["5"]["Name"] = [[Place]];
	MobileButton["5bruh"] = Instance.new("Frame", MobileButton["2"]);
	MobileButton["5bruh"]["BackgroundTransparency"] = 1;
	MobileButton["5bruh"]["Size"] = UDim2.new(0, 32, 1, 0);
	MobileButton["5bruh"]["Name"] = [[Place]];

	-- Button
	MobileButton["7"] = Instance.new("Frame", MobileButton["6"]);
	MobileButton["7"]["BackgroundTransparency"] = 1;
	MobileButton["7"]["Size"] = UDim2.new(0, 32, 1, 0);
	MobileButton["7"]["Name"] = [[Button]];
	MobileButton["8"] = Instance.new("ImageButton", MobileButton["7"]);
	MobileButton["8"]["AnchorPoint"] = Vector2.new(0, 1);
	MobileButton["8"]["Image"] = [[rbxasset://textures/ui/TopBar/iconBase.png]];
	MobileButton["8"]["Size"] = UDim2.new(0, 32, 0, 32);
	MobileButton["8"]["Name"] = [[Background]];
	MobileButton["8"]["Position"] = UDim2.new(0, 0, 1, 0);
	MobileButton["8"]["BackgroundTransparency"] = 1;
	MobileButton["9"] = Instance.new("ImageLabel", MobileButton["8"]);
	MobileButton["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	MobileButton["9"]["Image"] = [[rbxassetid://2914903943]];
	MobileButton["9"]["Size"] = UDim2.new(0, 24, 0, 24);
	MobileButton["9"]["Name"] = [[Icon]];
	MobileButton["9"]["BackgroundTransparency"] = 1;
	MobileButton["9"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	MobileButton["a"] = Instance.new("ImageLabel", MobileButton["8"]);
	MobileButton["a"]["ZIndex"] = 2;
	MobileButton["a"]["SliceCenter"] = Rect.new(8, 8, 8, 8);
	MobileButton["a"]["ScaleType"] = Enum.ScaleType.Slice;
	MobileButton["a"]["ImageTransparency"] = 1;
	MobileButton["a"]["Image"] = [[rbxasset://LuaPackages/Packages/_Index/UIBlox-8b8d973a-6c028e8e/UIBlox/App/ImageSet/ImageAtlas/./img_set_1x_1.png]];
	MobileButton["a"]["ImageRectSize"] = Vector2.new(17, 17);
	MobileButton["a"]["Size"] = UDim2.new(1, 0, 1, 0);
	MobileButton["a"]["Name"] = [[StateOverlay]];
	MobileButton["a"]["ImageRectOffset"] = Vector2.new(492, 104);
	MobileButton["a"]["BackgroundTransparency"] = 1;

	MobileButton["7"].Name = "PToggle"
	MobileButton["7"].Background.Icon.Image = "rbxassetid://12308333801"
	MobileButton["7"].Parent = MobileButton["2"]
	MobileButton["7"].Background.MouseEnter:Connect(function()
		MobileButton["7"].Background.StateOverlay.ImageTransparency = 0.9
	end)
	MobileButton["7"].Background.MouseLeave:Connect(function()
		MobileButton["7"].Background.StateOverlay.ImageTransparency = 1
	end)
	MobileButton["7"].Background.MouseButton1Down:Connect(function() togglegui() end)
end


task.spawn(function()
	while WaitUntilTerminated(.1) do end
	closegui()
end)

print("script loaded")
scriptLoaded = true
normalmessage(
	"POOPDOORS EDITED v"..currentver, "Script loaded!", 
	"Took "..(os.time() - POOPDOORS_START_TIME).."ms.", 
	5
)
