Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            if ( IsPedSittingInAnyVehicle( ped ) ) then 
                local vehicle = GetVehiclePedIsIn( ped, false )

                if ( GetVehicleClass( veh ) ~= 14 and GetVehicleClass( veh ) ~= 15 and GetVehicleClass( veh ) ~= 16 and GetVehicleClass( veh ) ~= 21 ) then 
                    if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                        -- if ( IsVehicleStopped( vehicle ) ) then 
                        if ( GetEntitySpeed( vehicle ) == 0 and GetIsVehicleEngineRunning( vehicle ) ) then 
                            SetVehicleBrakeLights( vehicle, true )
                        end 
                    end 
                end 
            end 
        end 
    end
end )