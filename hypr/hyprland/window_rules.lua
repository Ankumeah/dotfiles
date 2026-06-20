hl.window_rule({
  name = "opaque_fullscreen",
  match = { fullscreen = 1 },
  opacity = "1.0 1.0",
})

hl.window_rule({
  name = "float_kitty",
  match = { class = "floating-kitty" },
  float = true,
  size = "(monitor_w*0.7) (monitor_h*0.7)",
  center = true,
})

hl.window_rule({
  name = "float_scrcpy",
  match = { class = "scrcpy" },
  float = true,
})
