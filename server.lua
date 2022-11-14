local blindfolds = {}
GlobalState.blindfolds = blindfolds

RegisterNetEvent('blindfold', function(target)
    local src = source
    if target == nil or target == -1 then return end
    if target < 1 then return end
    if blindfolds[target] ~= nil then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(target))) > 10.0 then return end
    local search = exports.ox_inventory:Search(src, 'count', 'blindfold')
    if search >= 1 then
        exports.ox_inventory:RemoveItem(src, 'blindfold', 1)
        TriggerClientEvent('blindfold', target)
        blindfolds[target] = true
        GlobalState.blindfolds = blindfolds
    else
        print(string.format('ID: %s tried to blind %s but has no blindfold!', src, target))
    end
end)

RegisterNetEvent('remove-blindfold', function(target)
    local src = source
    if target == nil or target == -1 then return end
    if target < 1 then return end
    if blindfolds[target] == nil then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(target))) > 10.0 then return end
    TriggerClientEvent('remove-blindfold', target)
    exports.ox_inventory:AddItem(src, 'blindfold', 1)
    blindfolds[target] = nil
    GlobalState.blindfolds = blindfolds
end)