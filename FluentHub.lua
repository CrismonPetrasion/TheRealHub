--// Values

local Key = "TroXerOnTop912351234"
_G.Key = Key

--// Settings

if game.PlaceId == 6403373529 then
    if game:IsLoaded() then
        if _G.Key == Key then
            local Bypass;
            Bypass = hookmetamethod(game, "__namecall", function(Method, ...) 
                if getnamecallmethod() == "FireServer" and Method == game.ReplicatedStorage.Ban then
                    return
                elseif getnamecallmethod() == "FireServer" and Method == game.ReplicatedStorage.AdminGUI then
                    return
                elseif getnamecallmethod() == "FireServer" and Method == game.ReplicatedStorage.WalkSpeedChanged then
                    return
                end
                return Bypass(Method, ...)
            end)
            
            local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
            local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
            local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
            
            local Window = Fluent:CreateWindow({
                Title = "Test " .. Fluent.Version,
                SubTitle = "By ArteeSo",
                TabWidth = 160,
                Size = UDim2.fromOffset(580, 460),
                Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
                Theme = "Dark",
                MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
            })
            
            --// Function
            
            function Notify(Title, Content, Duration)
                Fluent:Notify({
                    Title = Title,
                    Content = Content,
                    SubContent = "SubContent", -- Optional
                    Duration = Duration or 1 -- Set to nil to make the notification not disappear
                })
            end
            
            --// Player
            
            game.Players.PlayerAdded:Connect(function()
                Notify("Player", "Player has been joined as ".. game.Players.LocalPlayer.Name, 1)
            end)
            
            --// Tabs
            
            local Tabs = {
                Main = Window:AddTab({
                    Title = "Main",
                    Icon = "home",
                }),
                Player = Window:AddTab({
                    Title = "Player",
                    Icon = "contact-2",
                }),
                Settings = Window:AddTab({
                    Title = "Settings",
                    Icon = "settings",
                })
            }
            
            local Options = Fluent.Options
            
            --// Sliders
            
            local Slider = Tabs.Player:AddSlider("Slider", {
                Title = "Walk Speed",
                Description = "Changes player's walkspeed!",
                Defualt = 16,
                Min = 0,
                Max = 1000,
                Rounding = 1,
                Callback = function(Value)
                    Notify("Configuration", "Walk Speed was changed to ".. Value, 1)
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
                end
            })
            
            local Slider2 = Tabs.Player:AddSlider("Slider", {
                Title = "Jump Power",
                Description = "Changes player's jump power!",
                Defualt = 50,
                Min = 0,
                Max = 1000,
                Rounding = 1,
                Callback = function(Value)
                    Notify("Configuration", "Jump Power was changed to ".. Value, 1)
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
                end
            })
            
            local Slider3 = Tabs.Player:AddSlider("Slider", {
                Title = "Gravity",
                Description = "Changes player's gravity!",
                Defualt = 50,
                Min = 0,
                Max = 1000,
                Rounding = 1,
                Callback = function(Value)
                    Notify("Configuration", "Gravity was changed to ".. Value, 1)
                    game.Workspace.Gravity = Value
                end
            })
        end
    end
end
