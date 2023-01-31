RegisterNetEvent('police:client:GetCuffed', function(playerId, isSoftcuff)
    local ped = PlayerPedId()   
    if not isHandcuffed then
        GetCuffedAnimation(playerId)
            exports['ps-ui']:Circle(function(success) 
                if success then 
                    ClearPedTasks(PlayerPedId())
                    QBCore.Functions.Notify("You broke free")
                else 
            isHandcuffed = true
            TriggerServerEvent("police:server:SetHandcuffStatus", true)
            ClearPedTasksImmediately(ped)
            if GetSelectedPedWeapon(ped) ~= `WEAPON_UNARMED` then
                SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
            end
            if not isSoftcuff then
                cuffType = 16
                QBCore.Functions.Notify("You are cuffed!")
            else
                cuffType = 49
                QBCore.Functions.Notify("You are cuffed, but you can walk")
            end
        end
    end, 1, 4)
    else
        isHandcuffed = false
        isEscorted = false
        TriggerEvent('hospital:client:isEscorted', isEscorted)
        DetachEntity(ped, true, false)
        TriggerServerEvent("police:server:SetHandcuffStatus", false)
        ClearPedTasksImmediately(ped)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "Uncuff", 0.2)
        QBCore.Functions.Notify("You are uncuffed!")
    end
end)