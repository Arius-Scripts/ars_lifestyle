--#--
--Fx info--
--#--
fx_version   "cerulean"
use_fxv2_oal "yes"
lua54        "yes"
game         "gta5"
version      "1.0.2"


--#--
--Resource info--
--#--
name "ars_pausemenu"
author  "Arius Development"
repository "https://github.com/Arius-Development/ars_pausemenu"
description "A simple pause menu script"

--#--
--Manifest--
--#--
client_scripts   {
    "client/*.lua"
}

server_scripts   {
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

