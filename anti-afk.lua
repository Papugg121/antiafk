local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Watermark = Instance.new("TextLabel")

ScreenGui.Name = "AntiAfkGUI"
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 180)
MainFrame.Active = true
MainFrame.Draggable = true

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleLabel.BorderSizePixel = 0
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Anti-AFK Script"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.Position = UDim2.new(0.1, 0, 0.35, 0)
ToggleButton.Size = UDim2.new(0.8, 0, 0.25, 0)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "Anti-AFK Enabled"
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 127)
ToggleButton.TextScaled = true

UICorner.Parent = ToggleButton

Watermark.Name = "Watermark"
Watermark.Parent = MainFrame
Watermark.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Watermark.BorderSizePixel = 0
Watermark.Position = UDim2.new(0, 0, 0.85, 0)
Watermark.Size = UDim2.new(1, 0, 0.15, 0)
Watermark.Font = Enum.Font.GothamBold
Watermark.Text = "Made By papuk420"
Watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
Watermark.TextScaled = true
Watermark.TextTransparency = 0.2

local antiAfkEnabled = true

local VirtualUser = game:GetService("VirtualUser")
local function EnableAntiAfk()
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        if antiAfkEnabled then
            VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end
    end)
end

EnableAntiAfk()

ToggleButton.MouseButton1Click:Connect(function()
    antiAfkEnabled = not antiAfkEnabled
    if antiAfkEnabled then
        ToggleButton.Text = "Anti-AFK Enabled"
        ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 127)
    else
        ToggleButton.Text = "Anti-AFK Disabled"
        ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, isProcessed)
    if not isProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
