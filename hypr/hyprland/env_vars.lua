hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("EDITOR", "nvim")
hl.env("VISUAL", "nvim")
hl.env("DOCKER_HOST", "unix:///run/user/1000/docker.sock")

local home = os.getenv("HOME")
hl.env("PATH",
  home .. "/.local/share/pnpm/bin:" ..
  home .. "/.local/bin:" ..
  home .. "/go/bin:" ..
  os.getenv("PATH")
)
