Config = {}

Config.DefaultTimeout = 5000 -- Time notification will appear on screen by default
Config.DefaultSound = "pop" -- 'pop', 'ping', 'boing', 'droplet', 'email', 'equip', 'fanfare', 'gotmail', 'livechat', 'negative_beeps', 'start', 'stop', 'twinkle', 'water'
Config.DefaultPosition = "top-right" --"top-left", "top-center", "top-right", "center", "bottom-left", "bottom-center", "bottom-right", "left", "right"
Config.MaxWidth = "20vw" -- maximum width

Config.Translate = {
	enabled = true,
	defaultLanguage = "en",
	translationResource = "ganji-translate",
	translationFunction = "TranslateMessage",
}

Config.NotificationTypes = {
	["success"] = {
		color = "positive",
		icon = "check_circle",
		textColor = "white",
	},
	["error"] = {
		color = "negative",
		icon = "cancel",
		textColor = "white",
	},
	["warning"] = {
		color = "warning",
		icon = "warning",
		textColor = "white",
	},
	["neutral"] = {
		color = "dark",
		icon = "notifications",
		textColor = "white",
	},
	["info"] = {
		color = "blue",
		icon = "info",
		textColor = "white",
	},
	["default"] = {
		color = "dark",
	},
}
