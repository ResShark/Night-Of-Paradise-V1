ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent("scratchoffs:view")
AddEventHandler("scratchoffs:view", function()
  ESX.UI.Menu.CloseAll()

  if scratchoffIsAWinner() then
    reward = determineWinningAmount()
    dispenseReward(reward)
    showWonNotification(reward)
  else
    TriggerServerEvent('scratchoffs:dispenseUsedScratchoff')
    showLostNotification()
  end

end)

function scratchoffIsAWinner()
  math.randomseed(GetGameTimer())
  return (math.random(1, Config.OneInChanceOfWinning) == 1)
end

function determineWinningAmount()
  math.randomseed(GetGameTimer())
  return math.random(Config.WinningAmountMinimum, Config.WinningAmountMaximum)
end

function dispenseReward(amount)
  TriggerServerEvent('scratchoffs:dispenseReward', amount)
end

function showWonNotification(amount)
  ESX.ShowNotification("~o~Ticket Gratte-Gratte~n~~g~Vous avez gagné!~n~~s~Félicitations, vous avez gagné ~g~$" .. amount .. "~s~!")
end

function showLostNotification()
  ESX.ShowNotification("~o~Ticket Gratte-Gratte~n~~r~Vous avez perdu!~n~~s~Peut être plus de chance la prochaine fois!")
end
