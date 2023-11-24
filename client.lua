local QBCore = exports["qb-core"]:GetCoreObject()

function Notify(message, msgtype, timeout, caption, society)
	if society then
		TriggerServerEvent("ganji-notify:societyNotify", message, msgtype, timeout, caption, society)
	else
		TriggerEvent("ganji-notify:sendNotification", message, msgtype, timeout, caption)
	end
end
exports("Notify", Notify)

RegisterNetEvent("ganji-notify:Notify", function(message, msgtype, timeout, caption, society)
	Notify(message, msgtype, timeout, caption, society)
end)

RegisterNetEvent("ganji-notify:sendNotification", function(message, ptype, ptimeout, pcaption)
	local text = nil
	local icon = nil
	local image = nil
	local spinner = nil
	local color = nil
	local textColor = nil
	local translate = Config.Translate.enabled
	local sound = Config.DefaultSound
	local caption = pcaption
	local msgtype = ptype
	local timeout = ptimeout or Config.DefaultTimeout
	local position = Config.DefaultPosition

	if type(message) == "table" then
		text = message.text
		if not text or text == "" then
			return
		end
		if message.icon then
			icon = message.icon
		elseif message.image then
			image = message.image
		elseif message.spinner then
			spinner = message.spinner
		end
		if message.sound then
			sound = message.sound
		end
		if message.position then
			position = message.position
		end
		if message.color then
			color = message.color
		end
		if message.textColor then
			textColor = message.textColor
		end
		if message.translate ~= nil then
			translate = message.translate
		end
	else
		text = message
		if not text or text == "" then
			return
		end
	end

	local premade = Config.NotificationTypes[msgtype] or Config.NotificationTypes.default

	if not (icon or image or spinner) then
		if premade.icon then
			icon = premade.icon
		elseif premade.image then
			image = premade.image
		elseif premade.spinner then
			spinner = premade.spinner
		end
	end

	if not color then
		color = premade.color
	end
	if not textColor then
		textColor = premade.textColor
	end

	if translate and Config.Translate.enabled and GetResourceState(Config.Translate.translationResource) == "started" then
		local resource = Config.Translate.translationResource
		local functionname = Config.Translate.translationFunction
	
		if text and text ~= "" then
			text = exports[resource][functionname](exports[resource], text)
		end

		if caption and caption ~= "" then
			caption = exports[resource][functionname](exports[resource], caption)
		end
	end

	SendNUIMessage({
		action = "notification",
		text = text,
		icon = icon,
		image = image,
		spinner = spinner,
		sound = sound,
		caption = caption,
		color = color,
		textColor = textColor,
		timeout = timeout,
		position = position,
	})
end)

RegisterNUICallback("nuiready", function(data, cb)
	SendNUIMessage({
		action = "init",
		timeout = Config.DefaultTimeout or 5000,
		maxWidth = Config.MaxWidth or "20vw",
		position = Config.DefaultPosition or "top-right",
	})
	cb("ok")
end)

function DumpTable(obj)
	if type(obj) == 'table' then
	   local s = '{ '
	   for k,v in pairs(obj) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. DumpTable(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(obj)
	end
 end