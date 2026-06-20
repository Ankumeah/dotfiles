package.path = package.path .. ";" .. os.getenv("HOME") .. "/.cache/wal/colors-hyprland.lua"
require("colors-hyprland")

require("hyprland.monitors")
require("hyprland.default_apps")
require("hyprland.window_rules")
require("hyprland.autostart")
require("hyprland.env_vars")
require("hyprland.decorations")
require("hyprland.inputs")
require("hyprland.keybinds")
require("hyprland.animations")
