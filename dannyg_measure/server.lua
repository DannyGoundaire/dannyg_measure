ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('measuringtape', function(source)
    TriggerClientEvent('measure:start', source)
end)