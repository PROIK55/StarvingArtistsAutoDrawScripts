-- Gui to Lua
-- Version: 3.2

local starvecompatibilitytest = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local title = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")

starvecompatibilitytest.Name = "starve compatibility test"
starvecompatibilitytest.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
starvecompatibilitytest.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = starvecompatibilitytest
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Size = UDim2.new(0, 381, 0, 187)

title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 3
title.Size = UDim2.new(0, 381, 0, 50)
title.Font = Enum.Font.SourceSans
title.Text = "running compatability test. please wait."
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextScaled = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(247, 255, 130)
TextButton.BorderSizePixel = 2
TextButton.Position = UDim2.new(0.236220479, 0, 0.486631006, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.Unknown
TextButton.Text = ""

wait(2)

TextButton.MouseButton1Click:Connect(function()
    TextButton.BackgroundColor3 = Color3.fromRGB(170, 252, 139)
end)

pcall(function()
    for _, conn in ipairs(getconnections(TextButton.MouseButton1Click)) do
        conn:Fire()
    end
end)

wait(0.5)

if TextButton.BackgroundColor3 == Color3.fromRGB(170, 252, 139)
and pcall(function()
    getconnections(Instance.new("TextBox").FocusLost)
end) then

    wait(0.5)
    starvecompatibilitytest:Destroy()
else
    title:Destroy()

    local notice = Instance.new("TextLabel")
    local close = Instance.new("TextButton")

    notice.Parent = Frame
    notice.Text = "your executor will most likely not support this script."

    close.Parent = Frame
    close.Text = "X"

    close.MouseButton1Click:Connect(function()
        starvecompatibilitytest:Destroy()
    end)

    return
end
