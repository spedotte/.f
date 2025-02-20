---------------------------
-- Gruvbox awesome theme --
---------------------------

local theme = {}

theme.background = "#282828"
theme.foreground = "#ebdbb2"
theme.color0 = "#3c3836"
theme.color1 = "#cc241d"
theme.color2 = "#98971a"
theme.color3 = "#d79921"
theme.color4 = "#458588"
theme.color5 = "#b16286"
theme.color6 = "#689d6a"
theme.color7 = "#a89984"
theme.color8 = "#928374"
theme.color9 = "#fb4934"
theme.color10 = "#b8bb26"
theme.color11 = "#fabd2f"
theme.color12 = "#83a598"
theme.color13 = "#d3869b"
theme.color14 = "#8ec07c"
theme.color15 = "#fbf1c7"
theme.cursor = "#bdae93"


theme.bg_accent = theme.color0
theme.fg_accent = theme.color15
theme.fg_inactive = theme.color14

-- ADD THE GAAAAP
theme.useless_gap = 5
theme.gap_single_client = true

theme.bar_bg = theme.background
theme.bar_fg = theme.foreground

theme.font          = "Fantasque Sans Mono 9"

theme.bg_normal     = theme.background
theme.bg_focus      = theme.background
theme.bg_urgent     = theme.background
theme.bg_minimize   = theme.background
theme.bg_systray    = theme.background

theme.fg_normal     = theme.foreground
theme.fg_focus      = theme.foreground
theme.fg_urgent     = theme.foreground
theme.fg_minimize   = theme.foreground

theme.border_width  = 2
theme.border_normal = theme.color8
theme.border_focus  = theme.color15
theme.border_marked = "#91231c"

theme.notification_border_color = theme.color8
theme.notification_border_width = 2
theme.notification_max_width = 500
theme.notification_max_height = 100
theme.notification_icon_size = 100

theme.taglist_fg_focus = theme.fg_accent
theme.taglist_fg_occupied = theme.fg_accent
theme.taglist_fg_empty = theme.fg_inactive
theme.taglist_bg_focus = theme.bg_accent

theme.tasklist_fg_focus = theme.color15
theme.tasklist_fg_normal = theme.color14

theme.titlebar_fg_focus = theme.color15
theme.titlebar_fg_normal = theme.color14

-- theme.wallpaper = "~/.config/awesome/theme/walls/railway.jpg"
theme.wallpaper = "~/.config/awesome/theme/walls/rio-panorama.jpg"
-- theme.wallpaper_color = "#1d2021"
-- theme.wallpaper_folder = "~/.config/awesome/theme/walls/"

return theme
