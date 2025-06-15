ESX = exports["es_extended"]:getSharedObject()

local measureActive = false
local point1 = nil
local point2 = nil
local showMeasure = false

RegisterNetEvent('measure:start', function()
    if measureActive then
        ESX.ShowNotification("❌ Maßband deaktiviert.")
        measureActive = false
        point1 = nil
        point2 = nil
        showMeasure = false
    else
        ESX.ShowNotification("📏 Maßband aktiviert. Drücke [E], um Punkt 1 und Punkt 2 zu setzen.")
        measureActive = true
        point1 = nil
        point2 = nil
        showMeasure = false
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if measureActive then
            if IsControlJustReleased(0, 38) then
                local coords = GetEntityCoords(PlayerPedId())
                if not point1 then
                    point1 = coords
                    ESX.ShowNotification("📍 Punkt 1 gesetzt.")
                elseif not point2 then
                    point2 = coords
                    ESX.ShowNotification("📍 Punkt 2 gesetzt.")
                    showMeasure = true

                    SetTimeout(20000, function()
                        point1 = nil
                        point2 = nil
                        showMeasure = false
                    end)
                end
            end
        end

        if showMeasure and point1 and point2 then
            local distance = #(point2 - point1)
            local midPoint = vector3(
                (point1.x + point2.x) / 2,
                (point1.y + point2.y) / 2,
                (point1.z + point2.z) / 2 + 0.5
            )
            DrawText3D(midPoint.x, midPoint.y, midPoint.z, ("📐 %.2f Meter"):format(distance))
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = #(p - vec3(x, y, z))

    local scale = 0.35 / distance
    if scale < 0.25 then scale = 0.25 end
    if scale > 0.75 then scale = 0.75 end

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end