--VARIABLES--
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = game.Workspace:WaitForChild("Camera")
local humanoid = character:WaitForChild("Humanoid")

local tweenInfo = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false
)

local runnignTweenGoal = {
	FieldOfView = 80
}

local walkingTweenGoal = {
	FieldOfView = 70
}

local runningTween = tweenService:Create(camera, tweenInfo, runnignTweenGoal)
local walkingTween = tweenService:Create(camera, tweenInfo, walkingTweenGoal)

userInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = 26
		runningTween:Play()
	end
end)

userInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = 16
		walkingTween:Play()
	end
end)
