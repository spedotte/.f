pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

-- focus windows automatically when they are raised
require("awful.autofocus")

local awesome_conf_dir = gears.filesystem.get_configuration_dir()

-- Global variables
Terminal = "alacritty"
TerminalCmd = Terminal .. " -e "
Editor = "nvim"

-- The ssh connection name of a server. Could be user@ip, or a name from ~/.ssh/config, or anything else that works with ssh(1).
Server = "tarneo@cocinero"


-- Error handling: this isn't useful here, but is if the config is used as fallback.
dofile(awesome_conf_dir .. "error_handling.lua")

-- Themes define colours, font and wallpapers.
beautiful.init(awesome_conf_dir .. "theme/theme.lua")

-- Screens, layouts, tags
dofile(awesome_conf_dir .. "screens.lua")

-- Key bindings
dofile(awesome_conf_dir .. "keys.lua")

-- Rules: how windows are placed and managed
-- If you want to make specific programs appear on specific tags, you can do that here.
dofile(awesome_conf_dir .. "rules.lua")

-- Signals: what to do when a window is created, moved, etc.
dofile(awesome_conf_dir .. "signals.lua")



-- Autostart applications

-- Conky: system monitor
-- awful.spawn.with_shell("killall conky; conky")

-- Keyboard manager: automatically set layouts for the different keyboards I use
awful.spawn.with_shell("~/.config/awesome/kb_manager.sh")

-- mpd: music player daemon
awful.spawn.with_shell("mpd")

-- Picom: compositor. Allows transparency and other eyecandy.
-- awful.spawn.with_shell("picom")

-- Nextcloud: sync files with your nextcloud server
-- awful.spawn.with_shell("nextcloud --background")

-- Emacs: I use emacs as my secondary editor (for screenplays)
-- Orgmode is also configured in neovim, so I only rarely use emacs.
-- Running it in the backgroud allows it to start faster when I need it.
-- awful.spawn.with_shell("emacs --daemon")

-- Unison sync script: syncs files with my server.
awful.spawn.with_shell("pgrep unison || ~/.config/scripts/unison-sync")

-- Element: Matrix client
awful.spawn.with_shell("element-desktop --hidden")


-- Enable VPN
awful.spawn.with_shell("wg-quick up vpn")
