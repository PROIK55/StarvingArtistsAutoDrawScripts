local G2L = {}

G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

G2L["2"] = Instance.new("Frame", G2L["1"])
G2L["2"]["BorderSizePixel"] = 0
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(68, 71, 75)
G2L["2"]["Size"] = UDim2.new(0, 200, 0, 195)
G2L["2"]["Position"] = UDim2.new(0.5, -100, 0.5, -97)

G2L["3"] = Instance.new("TextButton", G2L["2"])
G2L["3"]["Text"] = "fuck off"
G2L["3"]["Name"] = "close"

G2L["4"] = Instance.new("TextButton", G2L["2"])
G2L["4"]["Text"] = "copy link"
G2L["4"]["Name"] = "copy"

G2L["6"] = Instance.new("TextLabel", G2L["2"])
G2L["6"]["Text"] = "join the discord :3"

G2L["8"] = Instance.new("ImageLabel", G2L["2"])
G2L["8"]["Image"] = "rbxassetid://18817097052"

G2L["9"] = Instance.new("ImageLabel", G2L["2"])
G2L["9"]["Image"] = "rbxassetid://18817519330"

G2L["a"] = Instance.new("LocalScript", G2L["2"])

local function C_a()
    local TweenService = game:GetService("TweenService")
    local frame = script.Parent.Parent.Frame
    local closeButton = frame:WaitForChild("close")

    local function fadeOutFrameAndContents(frame)
        for _, descendant in ipairs(frame:GetDescendants()) do
            if descendant:IsA("GuiObject") then
                local props = {}

                if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
                    props.TextTransparency = 1
                end

                if descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
                    props.ImageTransparency = 1
                end

                props.BackgroundTransparency = 1

                TweenService:Create(descendant, TweenInfo.new(1), props):Play()
            end
        end

        local tween = TweenService:Create(frame, TweenInfo.new(1), {
            BackgroundTransparency = 1
        })

        tween:Play()
        tween.Completed:Connect(function()
            frame.Visible = false
        end)
    end

    closeButton.MouseButton1Click:Connect(function()
        fadeOutFrameAndContents(frame)
    end)
end

task.spawn(C_a)

local function C_b()
    local player = game.Players.LocalPlayer
    local screenGui = script.Parent.Parent
    local frame = screenGui:WaitForChild("Frame")
    local copyButton = frame:WaitForChild("copy")

    copyButton.MouseButton1Click:Connect(function()
        local link = "https://discord.gg/MP9nZgEeQD"
        setclipboard(link)

        local HttpService = game:GetService("HttpService")
        local httprequest = request or http_request or (syn and syn.request)

        if httprequest then
            httprequest({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    Origin = "https://discord.com"
                },
                Body = HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    nonce = HttpService:GenerateGUID(false),
                    args = {code = "MP9nZgEeQD"}
                })
            })
        end
    end)
end

task.spawn(C_b)

local function C_c()
    local TweenService = game:GetService("TweenService")
    local frame = script.Parent.Parent.Frame

    frame.Size = UDim2.new(0, 0, 0, 0)
    frame.Visible = true

    TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {
        Size = UDim2.new(0, 200, 0, 195)
    }):Play()
end

task.spawn(C_c)

return G2L["1"], require;
