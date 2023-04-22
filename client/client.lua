local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
	Wait(500)
	startLoop()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

local pauseMenuOpen = false

local function closePauseMenu()
	if pauseMenuOpen then
		local ped = PlayerPedId()
		ClearPedTasks(ped)
		DeleteObject(prop)
		DeleteEntity(prop)

		TransitionFromBlurred(1000)
		pauseMenuOpen = false
		SetNuiFocus(false, false)
		SendNUIMessage({
			action = 'close'
		})
	end
end


local function requestAnimDict(animDict)
	if HasAnimDictLoaded(animDict) then return animDict end

    RequestAnimDict(animDict)

    if coroutine.running() then
        timeout = tonumber(timeout) or 500

        for _ = 1, timeout do
            if HasAnimDictLoaded(animDict) then
                return animDict
            end

            Wait(0)
        end
    end

    return animDict
end

local function requestModel(model)
    if not tonumber(model) then model = joaat(model) end

    if HasModelLoaded(model) then return model end

    RequestModel(model)

    if coroutine.running() then
        timeout = tonumber(timeout) or 500

        for _ = 1, timeout do
            if HasModelLoaded(model) then
                return model
            end

            Wait(0)
        end

    end

    return model
end


local function openPauseMenu()
	if not pauseMenuOpen then
		local ped = PlayerPedId()

		local dictName = "amb@world_human_tourist_map@male@base"
		local set = "base"

		local propModel = "prop_tourist_map_01"

		local pedCoords = GetEntityCoords(ped)

		local dict = requestAnimDict(dictName)
		local propModel = requestModel(propModel)
		
		prop = CreateObject(propModel, pedCoords + vector3(0.0,0.0,0.2),  true,  true, true)
		
		AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
		SetModelAsNoLongerNeeded(propModel)

		TaskPlayAnim(ped, dict, set, 2.0, 2.0, -1, 58, 0, false, false, false)
		
		ESX.TriggerServerCallback('ars_pausemenu:getData', function(data)


			local playerGender = string.lower(data.sex)
			local playerJob = ESX.PlayerData.job.label
			local playerDob = data.dob

			local playerCash = data.cash or 0
			local playerBank = data.bank or 0
			local playerTotal = playerCash + playerBank

			local playerName = data.name
			local playerId = data.id



			if playerGender == "m" then playerGender = "Male" end
			if playerGender == "f" then playerGender = "Female" end

			pauseMenuOpen = true
			SetNuiFocus(true, true)
			SendNUIMessage({
				action = 'open',

				gender = playerGender,
				job = playerJob,
				dob = playerDob,

				cash = playerCash,
				bank = playerBank,
				total = playerTotal,

				name = playerName,
				id = playerId,

			})
		end)
	else
		closePauseMenu()
	end
end

function startLoop()
	while true do
		Wait(5)
		SetPauseMenuActive(false)
		if IsControlJustPressed(0, 200) then
			local playerPed = PlayerPedId()

            if not IsPedFalling(playerPed) then 
				if not IsPauseMenuActive()then 
					openPauseMenu()
				end
			end
		end
	end
end

RegisterNUICallback('close', function(data, cb)
	closePauseMenu()
	cb('ok')
end)

RegisterNUICallback('openMap', function(data, cb)
	closePauseMenu()
	ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1)
	cb('ok')
end)

RegisterNUICallback('openSettings', function(data, cb)
	closePauseMenu()
	ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1)
	cb('ok')
end)

RegisterNUICallback('disconnect', function(data, cb)
	closePauseMenu()
	TriggerServerEvent("ars_pausemenu:disconnectPlayer")
	cb('ok')
end)
