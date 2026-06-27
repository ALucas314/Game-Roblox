local Hinge = script.Parent.Hinge

local TweenService = game:GetService("TweenService")
local info = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local Prox = Hinge.ProximityPrompt

local aberta = false

local ClosedCFrame = Hinge.CFrame

-- Ajuste este valor conforme a largura da porta
local Offset = CFrame.new(5, 0, 0)

local OpenCFrame =
	ClosedCFrame
	* Offset
	* CFrame.Angles(0, math.rad(90), 0)
	* Offset:Inverse()

Prox.Triggered:Connect(function()

	if aberta then
		TweenService:Create(Hinge, info, {
			CFrame = ClosedCFrame
		}):Play()

		Prox.ActionText = "Abrir"
	else
		TweenService:Create(Hinge, info, {
			CFrame = OpenCFrame
		}):Play()

		Prox.ActionText = "Fechar"
	end

	aberta = not aberta
end)