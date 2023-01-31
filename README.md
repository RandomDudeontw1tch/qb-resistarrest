# qb-resist-arrest
resist arrest for qb-core

WARNING IAM NOT RESPONIBLE IF ANYTHING HAPPENS

Dependincs 
https://github.com/Project-Sloth/ps-ui

installion 

part 1

Add ps-ui in your addon or resource folder
put ensure ps-ui in your server.cfg

part 2
to add the code go to qb-policejob/client/interactions.lua
go to line 372 then paste this in to line 406

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

Config

if the circle go to fast then this is how to make it go slower
on line 395 at 1, 4 put it down more for me its 1, 0 



I did not write this code i just found it on discord and decided to post it on here because i never found any of them anywhere 
if you want to support me join my fivem server 
https://discord.gg/Ub87na2V
Server name is Bangs world rp
if the invite is expired add me on discord and ill invite you again 

Randomdude#2333



