ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
    local identifier = ESX.GetPlayerFromId(source).identifier
    MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},function(res)
        if res[1].skin == nil then  
            TriggerClientEvent("ars_lifestyle:openLifeStyle", source)
        end
    end)
end)

RegisterNetEvent("ars_lifestyle:giveItemCivil", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("money", 1)
    xPlayer.addInventoryItem("burger", 1)
    xPlayer.addInventoryItem("water", 1)
    xPlayer.addInventoryItem("lockpick", 1)
end)

RegisterNetEvent("ars_lifestyle:giveItemGangster", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("money", 1)
    xPlayer.addInventoryItem("burger", 1)
    xPlayer.addInventoryItem("water", 1)
    xPlayer.addInventoryItem("lockpick", 1)
end)

RegisterNetEvent("ars_lifestyle:giveItemBusiness", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("money", 1)
    xPlayer.addInventoryItem("burger", 1)
    xPlayer.addInventoryItem("water", 1)
    xPlayer.addInventoryItem("lockpick", 1)
end)