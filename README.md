# Features

- Customize many aspects of notifications per notification or default in config file
    - Icon/Image/Spinner or none
    - Sound - choose between many preinstalled sounds or add your own
    - Location - Corners, Left, Right, Top, Bottom, or Center of Screen
    - Colors - Background/Text Colors
    - Duration - how long the notification will stay on screen
- Caption under main message - optional
- Translation Option* (ganji-translate or another translation script required)
- Send notifications to any job or gang (QBCore required)
- Six customizable default styles - success, error, warning, neutral, info, and default

# Options

- Icons
    - Material Icons, Material Symbols, Ion Icons, Font Awesome, MDI, Eva, Themify, Line Awesome, Bootstrap Icons
    - https://quasar.dev/vue-components/icon#webfont-usage
- Spinners
    - https://quasar.dev/vue-components/spinners
    - QSpinnerAudio, QSpinnerBall, QSpinnerBars, QSpinnerBox, QSpinnerClock, QSpinnerComment, QSpinnerCube, QSpinnerDots, QSpinnerFacebook, QSpinnerGears, QSpinnerGrid, QSpinnerHearts, QSpinnerHourglass, QSpinnerInfinity, QSpinnerIos, QSpinnerOrbit, QSpinnerOval, QSpinnerPie, QSpinnerPuff, QSpinnerRadio, QSpinnerRings
- Positions
    - top-left, top, top-right, left, center, right, bottom-left, bottom, bottom-right, left, right.
- Sounds
    - 'pop', 'ping', 'boing', 'droplet', 'email', 'equip', 'fanfare', 'gotmail', 'livechat', 'negative_beeps', 'start', 'stop', 'twinkle', 'water’ or add your own.
    - to add your own, put the mp3 file in the html/sounds directory
- Colors
    - https://quasar.dev/style/color-palette#color-list
    
    # Config
    
    ```lua
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
    ```
    
    # Usage
    
    exports[’ganji-notify’]:Notify(message, type, timeout, caption)
    
    message: string - Message text
    
    message: table :
    
    text: string = message text. REQUIRED
    
    icon: string = see “icons” above for options
    
    -or-
    
    image: string = image url
    
    -or- 
    
    spinner: string = see “spinners” above for options
    
    sound: string = sound the notification makes.  See “sounds” above for options
    
    position: string = position of notification on screen. See above for options.
    
    color: string = background color of notification. See link above to color codes.
    
    textColor: string = color of message/caption text. See link above to color codes.
    
    translate: bool = whether or not to translate message
    
    type: string - any premade style defined in config file
    
    timeout: integer - Time in ms the notification will last
    
    caption: string - text shown smaller and under the main message.
    
    # Examples
    
    exports[’ganji-notify’]:Notify(”Example”)
    
    exports[’ganji-notify’]:Notify("Success Message", "success", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify("Error Message", "error", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify("Warning Message", "warning", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify("Neutral Message", "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify("Info Message", "info", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify("Default Message", "default", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Message with fontawesome icon", icon = "fa-solid fa-joint" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Message with image", image = "images/VRPnewLogo.png", color="white", textColor="dark" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Message with spinner", spinner = "QSpinnerGrid" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Message with colors changed", color = "red-10", textColor = "green-9" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Top-Left", position = "top-left" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Top-Center", position = "top" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Top-Right", position = "top-right" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Left", position = "left" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Center", position = "center" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Right", position = "right" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Bottom-Left", position = "bottom-left" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Bottom-Center", position = "bottom" }, "neutral", 5000, "Example Caption")
    
    exports[’ganji-notify’]:Notify({ text = "Bottom-Right", position = "bottom-right" }, "neutral", 5000, "Example Caption")![notifications](https://github.com/ganjitoka/ganji-notify/assets/3233242/c5636e2b-a468-49fb-a07c-e39ca50d4641)
![notifications3](https://github.com/ganjitoka/ganji-notify/assets/3233242/6f947ab3-1fed-4fb5-bca1-af91ca6ff90a)
![notifications2](https://github.com/ganjitoka/ganji-notify/assets/3233242/39c726b4-cab7-4577-913d-05e3ed05dd51)
