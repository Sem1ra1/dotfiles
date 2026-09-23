local mainMod = "SUPER"
local scriptsDir = "~/.config/hypr/scripts"

-- Source: $configs/Defaults.conf — convert this file to Lua and ensure it is on Lua's package.path.
require("configs.Defaults")

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("pkill rofi || true && rofi -show drun -modi drun,filebrowser,run,window"), { description = "app launcher" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("xdg-open \"https://\""), { description = "open default browser" })
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(scriptsDir .. "/OverviewToggle.sh"), { description = "desktop overview" })
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"), { description = "Open terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nemo"), { description = "file manager" })

hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd(scriptsDir .. "/Refresh.sh"), { description = "refresh bar and menus" })
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd(scriptsDir .. "/GameMode.sh"), { description = "toggle game mode" })

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "fullscreen" })
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), { description = "maximize window" })
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"), { description = "Float all windows" })
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(scriptsDir .. "/Dropterminal.sh $term"), { description = "DropDown terminal" })

hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')\""), { description = "zoom in" })
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')\""), { description = "zoom out" })

hl.bind(mainMod .. " + CTRL + ALT + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"), { description = "toggle waybar on/off" })

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(scriptsDir .. "/Hyprsunset.sh toggle"), { description = "toggle night light" })

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(scriptsDir .. "/KeyboardLayout.sh switch"), { locked = true, non_consuming = true, description = "switch keyboard layout globally" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -a -s 10 -u 150 --render-inactive"), { description = "Color Picker" })

hl.bind("CTRL + ALT + Delete", hl.dsp.exit(), { description = "exit Hyprland" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "close active window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(scriptsDir .. "/KillActiveProcess.sh"), { description = "Terminate active process" })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(scriptsDir .. "/LockScreen.sh"), { description = "lock screen" })
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(scriptsDir .. "/Wlogout.sh"), { description = "powermenu" })
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "notification panel" })

hl.bind(mainMod .. " + M", hl.dsp.layout("swapwithmaster"), { description = "swap with master" })

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "toggle pseudo (dwindle)" })

hl.bind("ALT + tab", hl.dsp.window.cycle_next({ next = true }), { description = "cycle next window" })
hl.bind("ALT + tab", hl.dsp.window.bring_to_top(), { description = "bring active to top" })

hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc"), { locked = true, repeating = true, description = "volume up" })
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec"), { locked = true, repeating = true, description = "volume down" })
hl.bind("ALT + xf86audioraisevolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc-precise"), { locked = true, repeating = true, description = "volume up precise" })
hl.bind("ALT + xf86audiolowervolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec-precise"), { locked = true, repeating = true, description = "volume down precise" })
hl.bind("xf86AudioMicMute", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle-mic"), { locked = true, description = "toggle mic mute" })
hl.bind("xf86audiomute", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle"), { locked = true, description = "toggle mute" })
hl.bind("xf86Sleep", hl.dsp.exec_cmd("systemctl suspend"), { locked = true, description = "sleep" })
hl.bind("xf86Rfkill", hl.dsp.exec_cmd(scriptsDir .. "/AirplaneMode.sh"), { locked = true, description = "airplane mode" })

-- hl.bind("xf86AudioPlayPause", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true, description = "play/pause" })
hl.bind("xf86AudioPause", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true, description = "pause" })
hl.bind("xf86AudioPlay", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true, description = "play" })
hl.bind("xf86AudioNext", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --nxt"), { locked = true, description = "next track" })
hl.bind("xf86AudioPrev", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --prv"), { locked = true, description = "previous track" })
hl.bind("xf86audiostop", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --stop"), { locked = true, description = "stop" })

hl.bind("Print", hl.dsp.exec_cmd("flatpak run org.flameshot.Flameshot gui"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --now"), { description = "screenshot now" })
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --area"), { description = "screenshot (area)" })
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in5"), { description = "screenshot in 5s" })
hl.bind(mainMod .. " + CTRL + SHIFT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in10"), { description = "screenshot in 10s" })
hl.bind("ALT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --active"), { description = "screenshot active window" })

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --swappy"), { description = "screenshot (swappy)" })

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true, description = "resize left (-50)" })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true, description = "resize right (-50)" })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true, description = "resize up (-50)" })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true, description = "resize down (+50)" })

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true, description = "resize left (-50)" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true, description = "resize right (+50)" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true, description = "resize up (-50)" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true, description = "resize down (+50)" })

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ direction = "l" }), { description = "move window left" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "r" }), { description = "move window right" })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.move({ direction = "u" }), { description = "move window up" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.move({ direction = "d" }), { description = "move window down" })

hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "l" }), { description = "swap window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }), { description = "swap window right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "u" }), { description = "swap window up" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "d" }), { description = "swap window down" })

hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "toggle group" })

hl.bind(mainMod .. " + Tab", hl.dsp.group.next(), { description = "Change Group Forward" })
-- TODO: manual review on line 119 — changegroupactive: expected 'f', 'b', or an index (got "")
-- hl.bind(mainMod .. " + CTRL + tab", hl.dsp.changegroupactive(), { description = "change active in group" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.group.prev(), { description = "Change Group Back" })

hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ into_group = "l" }), { description = "Move left into group" })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ into_group = "r" }), { description = "Move Right into group" })
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ out_of_group = true }), { description = "Move active out of group" })

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }), { description = "focus left" })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "focus right" })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }), { description = "focus up" })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }), { description = "focus down" })

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "focus down" })

hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special" }), { description = "move to special workspace" })
hl.bind(mainMod .. " + U", hl.dsp.workspace.toggle_special(""), { description = "toggle special workspace" })

hl.bind(mainMod .. " + code:10", hl.dsp.focus({ workspace = 1 }), { description = "workspace 1" })
hl.bind(mainMod .. " + code:11", hl.dsp.focus({ workspace = 2 }), { description = "workspace 2" })
hl.bind(mainMod .. " + code:12", hl.dsp.focus({ workspace = 3 }), { description = "workspace 3" })
hl.bind(mainMod .. " + code:13", hl.dsp.focus({ workspace = 4 }), { description = "workspace 4" })
hl.bind(mainMod .. " + code:14", hl.dsp.focus({ workspace = 5 }), { description = "workspace 5" })
hl.bind(mainMod .. " + code:15", hl.dsp.focus({ workspace = 6 }), { description = "workspace 6" })
hl.bind(mainMod .. " + code:16", hl.dsp.focus({ workspace = 7 }), { description = "workspace 7" })
hl.bind(mainMod .. " + code:17", hl.dsp.focus({ workspace = 8 }), { description = "workspace 8" })
hl.bind(mainMod .. " + code:18", hl.dsp.focus({ workspace = 9 }), { description = "workspace 9" })
hl.bind(mainMod .. " + code:19", hl.dsp.focus({ workspace = 10 }), { description = "workspace 10" })
hl.bind(mainMod .. " + O", hl.dsp.focus({ workspace = 5 }), { description = "workspace 5" })

hl.bind(mainMod .. " + SHIFT + code:10", hl.dsp.window.move({ workspace = 1 }), { description = "move to workspace 1" })
hl.bind(mainMod .. " + SHIFT + code:11", hl.dsp.window.move({ workspace = 2 }), { description = "move to workspace 2" })
hl.bind(mainMod .. " + SHIFT + code:12", hl.dsp.window.move({ workspace = 3 }), { description = "move to workspace 3" })
hl.bind(mainMod .. " + SHIFT + code:13", hl.dsp.window.move({ workspace = 4 }), { description = "move to workspace 4" })
hl.bind(mainMod .. " + SHIFT + code:14", hl.dsp.window.move({ workspace = 5 }), { description = "move to workspace 5" })
hl.bind(mainMod .. " + SHIFT + code:15", hl.dsp.window.move({ workspace = 6 }), { description = "move to workspace 6" })
hl.bind(mainMod .. " + SHIFT + code:16", hl.dsp.window.move({ workspace = 7 }), { description = "move to workspace 7" })
hl.bind(mainMod .. " + SHIFT + code:17", hl.dsp.window.move({ workspace = 8 }), { description = "move to workspace 8" })
hl.bind(mainMod .. " + SHIFT + code:18", hl.dsp.window.move({ workspace = 9 }), { description = "move to workspace 9" })
hl.bind(mainMod .. " + SHIFT + code:19", hl.dsp.window.move({ workspace = 10 }), { description = "move to workspace 10" })

hl.bind(mainMod .. " + CTRL + code:10", hl.dsp.window.move({ workspace = 1, follow = false }), { description = "move silently to workspace 1" })
hl.bind(mainMod .. " + CTRL + code:11", hl.dsp.window.move({ workspace = 2, follow = false }), { description = "move silently to workspace 2" })
hl.bind(mainMod .. " + CTRL + code:12", hl.dsp.window.move({ workspace = 3, follow = false }), { description = "move silently to workspace 3" })
hl.bind(mainMod .. " + CTRL + code:13", hl.dsp.window.move({ workspace = 4, follow = false }), { description = "move silently to workspace 4" })
hl.bind(mainMod .. " + CTRL + code:14", hl.dsp.window.move({ workspace = 5, follow = false }), { description = "move silently to workspace 5" })
hl.bind(mainMod .. " + CTRL + code:15", hl.dsp.window.move({ workspace = 6, follow = false }), { description = "move silently to workspace 6" })
hl.bind(mainMod .. " + CTRL + code:16", hl.dsp.window.move({ workspace = 7, follow = false }), { description = "move silently to workspace 7" })
hl.bind(mainMod .. " + CTRL + code:17", hl.dsp.window.move({ workspace = 8, follow = false }), { description = "move silently to workspace 8" })
hl.bind(mainMod .. " + CTRL + code:18", hl.dsp.window.move({ workspace = 9, follow = false }), { description = "move silently to workspace 9" })
hl.bind(mainMod .. " + CTRL + code:19", hl.dsp.window.move({ workspace = 10, follow = false }), { description = "move silently to workspace 10" })
hl.bind(mainMod .. " + CTRL + bracketleft", hl.dsp.window.move({ workspace = -1, follow = false }), { description = "move silently to previous workspace" })
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.window.move({ workspace = "+1", follow = false }), { description = "move silently to next workspace" })

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "previous workspace" })
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "e+1" }), { description = "next workspace" })
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "e-1" }), { description = "previous workspace" })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "move window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "resize window" })
