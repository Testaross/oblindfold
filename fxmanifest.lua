fx_version 'cerulean'
game 'gta5'
description 'jsfour updated'
lua54 'on'

shared_scripts {
    '@ox_lib/init.lua',
}

ui_page 'html/index.html'

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}

client_script {
	'client.lua'
}

files {
	'html/index.html',
	'html/assets/images/blindfold.png',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/init.js',
}
