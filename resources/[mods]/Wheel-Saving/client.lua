Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
		speler = GetPlayerPed(-1)
        if IsPedInAnyVehicle(speler, false) then
			if GetIsTaskActive(speler,2) then
				voertuig = GetVehiclePedIsUsing(speler)
				angle = GetVehicleSteeringAngle(voertuig)
				Citizen.Wait(100)
				SetVehicleSteeringAngle(voertuig, angle)
			end

        end
    end
end)
