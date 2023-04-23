--#--
--Fx info--
--#--
fx_version   "cerulean"
use_fxv2_oal "yes"
lua54        "yes"
game         "gta5"
version      "1.0.0"


--#--
--Resource info--
--#--
name "ars_lifestyle"
author  "Arius Development"
description "A simple life style script"

--#--
--Manifest--
--#--
client_scripts   {
    "client/*.lua"
}

server_scripts   {
    '@oxmysql/lib/MySQL.lua',
    "server/*.lua"
}



--#--
--Web--
--#--

ui_page "web/index.html"

files {
    "web/index.html",
    "web/js/*.js",
    "web/css/*.css",
    "web/images/*.*"
}

