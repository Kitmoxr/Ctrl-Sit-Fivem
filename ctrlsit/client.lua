-- ############################################################################ --
-- # ----------------------  Made by JVM Team - Kitmoxr --------------------- # --
-- # ----------------  Discord : https://discord.gg/dyrqqnF  ---------------- # --
-- ############################################################################ --


local sit = false

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait(5)

        local ped = GetPlayerPed( -1 )
        if (DoesEntityExist(ped) and not IsEntityDead(ped) ) then 
            DisableControlAction( 0, 36, true )

            if (not IsPauseMenuActive() ) then 
                if (IsDisabledControlJustPressed(0,36)) then 
                    RequestAnimSet("move_ped_crouched")

                    while (not HasAnimSetLoaded("move_ped_crouched", 0.60)) do 
                        Citizen.Wait(50)
                    end 

                    if (sit == true) then 
                        ResetPedMovementClipset(ped, 0)
                        sit = false 
                    elseif (sit == false) then
                        SetPedMovementClipset(ped,"move_ped_crouched", 0.40)
                        sit = true 
                    end 
                end
            end 
        end 
    end
end )