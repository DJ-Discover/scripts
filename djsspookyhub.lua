getgenv().CandyMagnetActive = false
getgenv().SlappleMagnetActive = false

local ScreenGui = Instance.new("ScreenGui")
local Success, CoreGui = pcall(function() return game:GetService("CoreGui") end)
ScreenGui.Parent = Success and CoreGui or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "SlapBattlesLocalEnginePanel"

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 200)
Frame.Position = UDim2.new(0.5, -175, 0.4, -100)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Title.BorderSizePixel = 0
Title.Text = "DJ's Spooky Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = Frame
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

local CandyBtn = Instance.new("TextButton")
CandyBtn.Size = UDim2.new(1, -16, 0, 32)
CandyBtn.Position = UDim2.new(0, 8, 0, 45)
CandyBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CandyBtn.Text = "Candy Corn Magnet: OFF"
CandyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CandyBtn.Font = Enum.Font.Gotham
CandyBtn.TextSize = 12
CandyBtn.Parent = Frame
Instance.new("UICorner", CandyBtn).CornerRadius = UDim.new(0, 6)

CandyBtn.MouseButton1Click:Connect(function()
    getgenv().CandyMagnetActive = not getgenv().CandyMagnetActive
    if getgenv().CandyMagnetActive then
        CandyBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        CandyBtn.Text = "Candy Corn Magnet: ON"
        task.spawn(function()
            local CandyFolder = game:GetService("Workspace"):WaitForChild("CandyCorns", 5)
            local Player = game:GetService("Players").LocalPlayer
            while getgenv().CandyMagnetActive do
                local character = Player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                if rootPart and CandyFolder then
                    for _, candy in ipairs(CandyFolder:GetChildren()) do
                        if not getgenv().CandyMagnetActive then break end
                        if candy:IsA("BasePart") then candy.CFrame = rootPart.CFrame end
                    end
                end
                task.wait(0.1)
            end
        end)
    else
        CandyBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        CandyBtn.Text = "Candy Corn Magnet: OFF"
    end
end)
local SlappleBtn = Instance.new("TextButton")
SlappleBtn.Size = UDim2.new(1, -16, 0, 32)
SlappleBtn.Position = UDim2.new(0, 8, 0, 80)
SlappleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
SlappleBtn.Text = "Slapple Magnet: OFF"
SlappleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SlappleBtn.Font = Enum.Font.Gotham
SlappleBtn.TextSize = 12
SlappleBtn.Parent = Frame
Instance.new("UICorner", SlappleBtn).CornerRadius = UDim.new(0, 6)

SlappleBtn.MouseButton1Click:Connect(function()
    getgenv().SlappleMagnetActive = not getgenv().SlappleMagnetActive
    if getgenv().SlappleMagnetActive then
        SlappleBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        SlappleBtn.Text = "Slapple Magnet: ON"
        task.spawn(function()
            local Player = game:GetService("Players").LocalPlayer
            while getgenv().SlappleMagnetActive do
                local character = Player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                local arenaWorkspace = game:GetService("Workspace"):FindFirstChild("Arena")
                local halloweenDecor = arenaWorkspace and arenaWorkspace:FindFirstChild("Halloween_Decorations")
                local island = arenaWorkspace and arenaWorkspace:FindFirstChild("island5")
                local slappleFolder = island and island:FindFirstChild("Slapples")
                if rootPart then
                    if slappleFolder then
                        for _, item in ipairs(slappleFolder:GetChildren()) do
                            if not getgenv().SlappleMagnetActive then break end
                            if item.Name == "Slapple" or item.Name == "GoldenSlapple" then
                                if item:IsA("Model") then
                                    if item.PrimaryPart then item:SetPrimaryPartCFrame(rootPart.CFrame)
                                    elseif item:FindFirstChild("Glove") then item.Glove.CFrame = rootPart.CFrame end
                                elseif item:IsA("BasePart") then item.CFrame = rootPart.CFrame end
                            end
                        end
                    end
                    if halloweenDecor then
                        for _, item in ipairs(halloweenDecor:GetChildren()) do
                            if not getgenv().SlappleMagnetActive then break end
                            if item.Name == "Slapple" then
                                if item:IsA("Model") then
                                    if item.PrimaryPart then item:SetPrimaryPartCFrame(rootPart.CFrame)
                                    elseif item:FindFirstChild("Glove") then item.Glove.CFrame = rootPart.CFrame end
                                elseif item:IsA("BasePart") then item.CFrame = rootPart.CFrame end
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    else
        SlappleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        SlappleBtn.Text = "Slapple Magnet: OFF"
    end
end)

local function runDebugScan()
    local candyCount = game:GetService("Workspace"):FindFirstChild("CandyCorns") and #game:GetService("Workspace").CandyCorns:GetChildren() or 0
    local arena = game:GetService("Workspace"):FindFirstChild("Arena")
    local island = arena and arena:FindFirstChild("island5")
    local sf = island and island:FindFirstChild("Slapples")
    local slappleCount = sf and #sf:GetChildren() or 0
    print("Candy Spawns: " .. tostring(candyCount) .. " | Slapples: " .. tostring(slappleCount))
end

local DebugBtn = Instance.new("TextButton")
DebugBtn.Size = UDim2.new(1, -16, 0, 32)
DebugBtn.Position = UDim2.new(0, 8, 0, 115)
DebugBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
DebugBtn.Text = "Debug Scan (F9 console)"
DebugBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DebugBtn.Font = Enum.Font.Gotham
DebugBtn.TextSize = 12
DebugBtn.Parent = Frame
Instance.new("UICorner", DebugBtn).CornerRadius = UDim.new(0, 6)
DebugBtn.MouseButton1Click:Connect(runDebugScan)

local ServerHopBtn = Instance.new("TextButton")
ServerHopBtn.Size = UDim2.new(1, -16, 0, 32)
ServerHopBtn.Position = UDim2.new(0, 8, 0, 150)
ServerHopBtn.BackgroundColor3 = Color3.fromRGB(45, 85, 145)
ServerHopBtn.Text = "Find Low Player Server (Hop)"
ServerHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerHopBtn.Font = Enum.Font.Gotham
ServerHopBtn.TextSize = 12
ServerHopBtn.Parent = Frame
Instance.new("UICorner", ServerHopBtn).CornerRadius = UDim.new(0, 6)

ServerHopBtn.MouseButton1Click:Connect(function()
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")
    local placeId = game.PlaceId
    ServerHopBtn.Text = "Searching..."
    
    -- Updated domain from roproxy to games.ff-roproxy.com to handle requests reliably
    local success, response = pcall(function() 
        return game:HttpGet("https://games.ff-roproxy.com/v1/games/" .. tostring(placeId) .. "/servers/Public?sortOrder=Asc&limit=100") 
    end)
    
    if success and response then
        local decoded = HttpService:JSONDecode(response)
        if decoded and decoded.data then
            local targetServer, lowestPlayers = nil, math.huge
            for _, server in ipairs(decoded.data) do
                if server.playing < lowestPlayers and server.playing > 0 and server.id ~= game.JobId then
                    if server.maxPlayers and server.playing < server.maxPlayers then
                        lowestPlayers = server.playing
                        targetServer = server.id
                    end
                end
            end
            if targetServer then
                ServerHopBtn.Text = "Teleporting!"
                TeleportService:TeleportToPlaceInstance(placeId, targetServer, game:GetService("Players").LocalPlayer)
            else 
                ServerHopBtn.Text = "No Server Found" 
            end
        else
            ServerHopBtn.Text = "Parse Error"
        end
    else 
        ServerHopBtn.Text = "Proxy Error" 
    end
end)
