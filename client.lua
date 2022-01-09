local Config = {}

RegisterCommand('hud', function(source, args, rawCommand)
    elite3 = not elite3
    TriggerEvent('hud:toggleui', elite3)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	elite3 = true
    showhud()
end)

RegisterNetEvent('hud:toggleui')
AddEventHandler('hud:toggleui', function(show)
    if show == true then
        elite3 = true
        showhud()
    else
        elite3 = false
    end
end)


function showhud()
    local player = PlayerPedId()
    local health = (GetEntityHealth(player) - 100)
    local armor = GetPedArmour(player)
    while elite3 do
        Citizen.Wait(200)
        player = PlayerPedId()
        health = (GetEntityHealth(player) - 100)
        armor = GetPedArmour(player)
        if not IsPauseMenuActive() then
            SendNUIMessage({
                action = 'elite',
                show = elite3,
                health = health,
                armour = armor,
            })
        else
            SendNUIMessage({
                action = 'elite',
                show = false,
            })
        end
    end
end
