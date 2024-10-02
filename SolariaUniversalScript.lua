local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Solaria Universal Script",
   LoadingTitle = "Solaria Hub",
   LoadingSubtitle = "by Folite25",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "SCWK6xw2vN", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Solaria Universal Script",
      Subtitle = "Key Sur Le Discord",
      Note = "Nothing Here",
      FileName = "SolariaHubKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/r3bDM1Wz"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22") 
   }        
})

local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image

-- Correct usage of PlayerTab instead of Tab
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Paramètres de hauteur et de vitesse
local heightMultiplier = 1.5 -- Le multiplicateur de hauteur (1.5 = 150% de la taille d'origine)
local speedMultiplier = 2 -- Le multiplicateur de vitesse (2 = 200% de la vitesse d'origine)

-- Fonction pour changer la taille du personnage
local function changeHeight()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Size = part.Size * heightMultiplier
            part.Position = part.Position + Vector3.new(0, (part.Size.Y / 2) * (heightMultiplier - 1), 0)
        elseif part:IsA("Accessory") then
            local handle = part:FindFirstChild("Handle")
            if handle then
                handle.Size = handle.Size * heightMultiplier
            end
        end
    end
    humanoid.HipHeight = humanoid.HipHeight * heightMultiplier
end

-- Fonction pour changer la vitesse du personnage
local function changeSpeed()
    humanoid.WalkSpeed = humanoid.WalkSpeed * speedMultiplier
end

-- Appliquer les changements
changeHeight()
changeSpeed()

-- Optionnel: Réinitialiser la taille et la vitesse après un certain temps
wait(10) -- Par exemple, après 10 secondes

-- Réinitialiser les paramètres d'origine
local function resetCharacter()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Size = part.Size / heightMultiplier
        elseif part:IsA("Accessory") then
            local handle = part:FindFirstChild("Handle")
            if handle then
                handle.Size = handle.Size / heightMultiplier
            end
        end
    end
    humanoid.HipHeight = humanoid.HipHeight / heightMultiplier
    humanoid.WalkSpeed = humanoid.WalkSpeed / speedMultiplier
end

resetCharacter()


local DashSpeedSlider = PlayerTab:CreateSlider({
   Name = "Dash Speed",
   Range = {10, 100},
   Increment = 1,
   Suffix = "Length",
   CurrentValue = 10,
   Flag = "Slider2", -- Different flag for this slider
   Callback = function(Value)
      game.Players.LocalPlayer.Character:SetAttribute("DashLength", Value)
   end,
})

local DashSpeedSlider = PlayerTab:CreateSlider({
   Name = "Jump Height",
   Range = {10, 500},
   Increment = 1,
   Suffix = "Length",
   CurrentValue = 10,
   Flag = "Slider2", -- Different flag for this slider
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})
