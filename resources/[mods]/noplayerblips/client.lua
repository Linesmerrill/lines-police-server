--- Configure these options:

--- min_players_online: If the number of players online drops below this number, blips will no longer be hidden.
--- set this to 0 to disable this feature.
local min_players_online = 0 -- (default: 0)

--- blip_display_type: possible values:
-- 1: hide blips completely.
-- 2: show blips on both the minimap/radar and in the pause menu.
-- 3: show blips in the pause menu only (hidden on minimap/radar).
local blip_display_type = 1 -- (default: 1)

--- alternative_blip_display_type: this display type will be used if the player is allowed to see blips.
--- possible values are:
-- 2: show blips on both the minimap/radar and in the pause menu.
-- 3: show blips in the pause menu only (hidden on minimap/radar).
local alternative_blip_display_type = 2 -- (default: 2)

-- Set this to false if this is causing problems on your server.
-- It's a somewhat hacky solution to remove PLD blips but it's not 100% tested.
-- Also PLD blips don't take permissions or displaytypes in mind, if you leave this
-- as "true", the blips will be gone for everyone until the server restarts and players restart their game.
local disable_pld_blips = true

-- Set this to false if you still want to be able to see player names above their heads.
-- People with the god permission will always be able to see the player names.
-- If you enabled the min_players_online option, then playernames will only be hidden if there's enough players online.
local disable_player_names = true

-- Distance in meters. If you are within -distance- meters from another player, you will see their name above their head.
-- Set this to -1 if you want all player names to be hidden at all times (no matter how close you get to someone, 
-- you won't see their names). (God permission still overrides this, god players can see them all the time!)
local disable_player_names_distance = -1


--- Don't touch this code
local god = false

Citizen.CreateThread(function()
    TriggerServerEvent('CheckPermissions')
    while true do
        Citizen.Wait(0) -- Wait 0 seconds to prevent crashing.
        if not god and NetworkGetNumConnectedPlayers() >= min_players_online then
            for x=0,32 do
                local entityblip = GetBlipFromEntity(GetPlayerPed(x))
                if DoesBlipExist(entityblip) then
                    SetBlipShowCone(blip, false)
                    SetBlipDisplay(entityblip, blip_display_type)
                end
                if disable_pld_blips then
                    local PLD_Blip = GetFirstBlipInfoId(1)
                    if DoesBlipExist(PLD_Blip) then
                        SetBlipSprite(PLD_Blip, 239)
                        SetBlipDisplay(PLD_Blip, blip_display_type)
                    end
                end
            end
            -- Loop through all the players
            for Player=0,NetworkGetNumConnectedPlayers() do
                local GamerTagId = 0
                local PlayerPed = GetPlayerPed(Player)
                
                -- If the player (loop id) is NOT the same as the current player, create a new GamerTagId.
                if Player ~= PlayerId() then
                    GamerTagId = CreateMpGamerTag(PlayerPed, GetPlayerName(Player), false, false, "", 0)
                end
                
                -- Using that GamerTagId, we remove the gamertag if the player is more than _distance_ away from another other player.
                if Vdist2(GetEntityCoords(PlayerPed, true), GetEntityCoords(PlayerPedId(), true)) > disable_player_names_distance * 10 or GamerTagId == PlayerId() then
                    RemoveMpGamerTag(GamerTagId)
                end
            end
        else
            for x=0,32 do
                local entityblip = GetBlipFromEntity(GetPlayerPed(x))
                if DoesBlipExist(entityblip) then
                    SetBlipDisplay(entityblip, alternative_blip_display_type)
                end
            end
        end
    end
end)

RegisterNetEvent('SetGod')
AddEventHandler('SetGod', function()
    god = true
end)

