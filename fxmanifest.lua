fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Ganji Advanced Notifications'
author 'Ganjitoka'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

shared_scripts {
   'config.lua',
}

dependencies { 
    'ox_lib' 
}

files {
    'html/index.html',
    'html/sounds/*.mp3',
    'html/images/*.png',
    'html/script.js',
    'html/style.css',
}


dependency '/assetpacks'
