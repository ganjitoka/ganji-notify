local QBCore = exports['qb-core']:GetCoreObject()

function GetSocietyType(society)
	for k, v in pairs(QBCore.Shared.Jobs) do
		if k == society then return 'job' end
		if v.type == society then return 'jobtype' end
	end
	for k, v in pairs(QBCore.Shared.Gangs) do
		if k == society then return 'gang' end
	end
	return nil
end

RegisterServerEvent('ganji-notify:societyNotify', function(title, message, type, duration, society)
	local players = QBCore.Functions.GetQBPlayers()
	local societyType = GetSocietyType(society)
	local sendList = {}
	for _, v in pairs(players) do
		if societyType == 'job' then
			if v.PlayerData.job.name == society then
				sendList[#sendList + 1] = v.PlayerData.source
			end
		elseif societyType == 'jobtype' then
			if QBCore.Shared.Jobs[v.PlayerData.job.name].type == society then
				sendList[#sendList + 1] = v.PlayerData.source
			end
		elseif societyType == 'gang' then
			if v.PlayerData.gang.name == society then
				sendList[#sendList + 1] = v.PlayerData.source
			end
		end
	end

	if #sendList == 0 then
		TriggerClientEvent('ganji-notify:sendNotification', source, title, message, type, duration)
	else
		for i=1, #sendList do
			TriggerClientEvent('ganji-notify:sendNotification', sendList[i], title, message, type, duration)
		end
	end
end)

