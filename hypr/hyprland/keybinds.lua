local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(Menu))
hl.bind(mainMod .. " + SHIFT + CTRL + L", hl.dsp.exec_cmd(Lockscreen))

hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim -o \"$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')\" ~/Pictures/Screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S-%N').png && notify-send \"Screenshot taken\""))
hl.bind(mainMod .. " + SPACE", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ mode = "floating", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + n", hl.dsp.exec_cmd("makoctl dismiss -a"))
hl.bind(mainMod .. " + SHIFT + w", hl.dsp.exec_cmd(Terminal .. " --class floating-kitty -e zsh -c \"~/.config/change_wallpaper/yazi_picker.sh\""))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "d" }))

for i = 1, 10 do
  hl.bind(mainMod .. " + " .. i % 10, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i % 10, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + minus", hl.dsp.focus({ workspace = 11 }))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = 11, follow = false }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("switch:off:Lid Switch", hl.dsp.dpms({ action = "on" }), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.dpms({ action = "off" }), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("playerctl pause -a"), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(Lockscreen), { locked = true })
