ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("ars_pausemenu:disconnectPlayer", function()
    local playerSource = source
    DropPlayer(playerSource, "[Arius Development] \nHave a nice day!")
end)


ESX.RegisterServerCallback('ars_pausemenu:getData', function(source, cb)
    local data = {}
    local xPlayer = ESX.GetPlayerFromId(source)


    
    data.name = xPlayer.getName()
    data.cash = xPlayer.getMoney()
    data.bank = xPlayer.getAccount("bank").money

    data.sex = xPlayer.variables.sex
    data.dob = xPlayer.variables.dateofbirth
    data.id = source



    cb(data)
end)
