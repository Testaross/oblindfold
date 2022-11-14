local bag = nil

CreateThread(function()
    lib.requestModel(`prop_money_bag_01`, 500)
end)

RegisterNetEvent('blindfold', function()
    bag = CreateObject(`prop_money_bag_01`, 0, 0, 0, true, true, true)
    while not DoesEntityExist(bag) do
        Wait(0)
    end
    AttachEntityToEntity(bag, cache.ped, GetPedBoneIndex(cache.ped, 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "open"
    })
end)

RegisterNetEvent('remove-blindfold', function()
    DeleteEntity(bag)
    SetEntityAsNoLongerNeeded(bag)
    SendNUIMessage({type = 'closeAll'})
    SendNUIMessage({action = "close"})
end)

exports.ox_target:addGlobalPlayer({
    {
        name = 'blindfold',
        icon = 'fa-solid fa-car-side',
        label = 'Blindfold',
        canInteract = function(entity, distance, coords, name)
			local count = exports.ox_inventory:Search('count', 'blindfold')
            local id = GlobalState.blindfolds[GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))]
            if id then
                return false
            end
			if count >= 1 then
            	return true
			end
        end,
        onSelect = function(data)
            TriggerServerEvent('blindfold', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
    },
    {
        name = 'remove-blindfold',
        icon = 'fa-solid fa-car-side',
        label = "Remove blindfold",
        canInteract = function(entity, distance, coords, name)
            local id = GlobalState.blindfolds[GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))]
            if id then
                return true
            end
            return false
        end,
        onSelect = function(data)
            TriggerServerEvent('remove-blindfold', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
    }
})
