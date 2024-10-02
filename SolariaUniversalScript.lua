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

local Slider = Tab:CreateSlider({
   Name = "WalkSpeed",
   Range = {10, 100},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    game.Players.LocalPlayer.Character:SetAttribute("SpeedMultiplier", value)
   end,    
})

local Slider = Tab:CreateSlider({
   Name = "Dash Speed",
   Range = {10, 100},
   Increment = 1,
   Suffix = "Length",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    game.Players.LocalPlayer.Character:SetAttribute("DashLength", value)
   end,
})
