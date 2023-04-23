local ESX = exports["es_extended"]:getSharedObject()

local menuOpen = false
local function openLifeStyle()
	SetNuiFocus(true, true)
	SendNUIMessage({
        action = 'open',
    })
	menuOpen = true

end

local function closeLifeStyle()
	SetNuiFocus(false, false)
	SendNUIMessage({
        action = 'close',
    })
	menuOpen = false
end

RegisterNetEvent("ars_lifestyle:openLifeStyle", openLifeStyle)

RegisterNUICallback('civil', function(data, cb)
	closeLifeStyle()
	TriggerServerEvent("ars_lifestyle:giveItemCivil")
	cb('ok')
end)

RegisterNUICallback('gangster', function(data, cb)
	closeLifeStyle()
	TriggerServerEvent("ars_lifestyle:giveItemGangster")
	cb('ok')
end)

RegisterNUICallback('business', function(data, cb)
	closeLifeStyle()
	TriggerServerEvent("ars_lifestyle:giveItemBusiness")
	cb('ok')
end)
