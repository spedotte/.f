-- This file configures the keybindings of awesome.

local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

modkey = "Mod4"

globalkeys = gears.table.join(
    -- Applications launcher
    awful.key({ modkey,           }, "p", function() awful.spawn.with_shell("dmenu_run") end,
              {description = "launch dmenu", group = "launcher"}),
    -- Brave browser
    awful.key({ modkey,           }, "b", function() awful.spawn.with_shell("brave") end,
              {description = "launch brave", group = "launcher"}),
    -- newsflash
    --awful.key({ modkey,           }, "r", function() awful.spawn.with_shell("newsflash") end,
              --{description = "launch newsflash", group = "launcher"}),
    -- ncmpcpp
    -- awful.key({ modkey,           }, "u", function() awful.spawn.with_shell(terminal .. " ncmpcpp") end,
    --           {description = "launch ncmpcpp", group = "launcher"}),

    -- Discord
    awful.key({ modkey,           }, "d", function() awful.spawn.with_shell("discord") end,
              {description = "launch discord", group = "launcher"}),
    -- Open terminal
    awful.key({ modkey,           }, "Return", function () awful.spawn.with_shell(terminal) end,
              {description = "open a terminal", group = "launcher"}),

    -- Reload awesome
    awful.key({ modkey,  }, "q", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    -- change the screen layout
    awful.key({ modkey   }, "1", function () awful.spawn.with_shell("xrandr --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output HDMI-2 --off --output DP-2 --off --output HDMI-3 --off") end,
              {description = "change screen layout", group = "awesome"}),

    -- change the screen layout
    awful.key({ modkey   }, "2", function () awful.spawn.with_shell("xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --off --output HDMI-2 --mode 2560x1080 --pos 0x0 --rotate normal --output DP-2 --off --output HDMI-3 --off") end,
              {description = "change screen layout", group = "awesome"}),

    -- Shutdown the computer
    awful.key({ modkey, "Control" }, "q", function() awful.spawn.with_shell("sudo shutdown now") end,
              {description = "shutdown", group = "launcher"}),

    -- Hibernate the computer
    awful.key({ modkey, "Control" }, "h", function() awful.spawn.with_shell("sudo ZZZ") end,
              {description = "hibernate", group = "launcher"}),

    -- Suspend the computer
    awful.key({ modkey, "Control" }, "s", function() awful.spawn.with_shell("lock systemctl suspend") end,
              {description = "suspend", group = "launcher"}),

    -- Print area / window
    awful.key({}, "Print", function() awful.spawn.with_shell("maim --select | xclip -selection clipboard -target image/png") end,
              {description = "print area", group = "launcher"}),

    -- change brightness
    awful.key({}, "XF86MonBrightnessUp", function() awful.spawn.with_shell('math "$(cat /sys/class/backlight/intel_backlight/brightness)+500" | sudo tee /sys/class/backlight/intel_backlight/brightness') end,
              {description = "increase brightness", group = "launcher"}),
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn.with_shell('math "$(cat /sys/class/backlight/intel_backlight/brightness)-500" | sudo tee /sys/class/backlight/intel_backlight/brightness') end,
              {description = "decrease brightness", group = "launcher"}),

        -- Change volume
    awful.key({}, "XF86AudioRaiseVolume", function ()
              awful.spawn.with_shell("pactl set-sink-volume 0 +5%")
              end),
    awful.key({}, "XF86AudioLowerVolume", function ()
              awful.spawn.with_shell("pactl set-sink-volume 0 -5%")
              end),
    awful.key({}, "XF86AudioMute", function ()
              awful.spawn.with_shell("pactl set-sink-mute 0 toggle")
              end),
    awful.key({}, "XF86AudioNext", function ()
              awful.spawn.with_shell("mpc next")
              end),
    awful.key({}, "XF86AudioPrev", function ()
              awful.spawn.with_shell("mpc prev")
              end),
    awful.key({}, "XF86AudioPlay", function ()
              awful.spawn.with_shell("playerctl play-pause")
              end),

    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "i",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "e",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "y", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "i", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "e", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "o",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "n",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey,           }, "n",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "o",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    --awful.key({ modkey, "Control" }, "j",     function () awful.tag.incncol( 1, nil, true)    end,
              --{description = "increase the number of columns", group = "layout"}),
    --awful.key({ modkey, "Control" }, "m",     function () awful.tag.incncol(-1, nil, true)    end,
              --{description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey, }, "u",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),
    -- Bookmarks with dmenu
    awful.key({ modkey }, "m", function ()
        awful.spawn.with_shell("xdotool type (grep -v '^#' ~/.config/awesome/bookmarks | dmenu -i -l 10)")
    end,
    {description = "open bookmark", group = "launcher"}),
    awful.key({ modkey,           }, ",", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    -- show hotkeys
    awful.key({ modkey,           }, "h", function () hotkeys_popup.show_help(nil, awful.screen.focused()) end,
              {description="show help", group="awesome"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "w",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey            }, "c",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Shift"   }, "y",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "l",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"})
    --awful.key({ modkey, "Control" }, "h",
        --function (c)
            --c.maximized_vertical = not c.maximized_vertical
            --c:raise()
        --end ,
        --{description = "(un)maximize vertically", group = "client"}),
    --awful.key({ modkey, "Shift"   }, "h",
        --function (c)
            --c.maximized_horizontal = not c.maximized_horizontal
            --c:raise()
        --end ,
        --{description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
local tagkeys = { "a", "r", "s", "t", "g"}
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, tagkeys[i],
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, tagkeys[i],
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, tagkeys[i],
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, tagkeys[i],
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
