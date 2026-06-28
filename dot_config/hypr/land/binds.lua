local hs = require("hyprsplit")

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(TERMINAL))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())

-- local closeWindowBind = hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
--
hl.bind(
	mainMod .. " + SHIFT + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FILEMANAGER))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(MENU))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(WEBBROWSER))
-- hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- FULLSCREEN JUNK

-- buffer to store window sizes for toggling maximized fullscreen because hyprland for some reason doesn't remember them
-- local windowSizes = {}

-- hl.bind(mainMod .. " + F", function()
-- 	local current_window = hl.get_active_window()
-- 	if current_window == nil then
-- 		hl.notification.create({
-- 			title = "No active window",
-- 			duration = 2000,
-- 			text = "Cannot toggle fullscreen without an active window",
-- 		})
-- 		return
-- 	end
--
-- 	local window_address = current_window.address
-- 	local fullscreen_state = current_window.fullscreen_client
-- 	local is_maximized = fullscreen_state == 1
--
-- 	if is_maximized and windowSizes[window_address] ~= nil then
-- 		hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
-- 		hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
-- 		windowSizes[window_address] = nil
-- 	else
-- 		local window_size = current_window.size
--
-- 		hl.dispatch(hl.dsp.window.fullscreen({ mode = "maximized", action = "set" }))
-- 		windowSizes[window_address] = window_size
-- 	end
-- end)

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + CTRL + hjkl keys
hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.move({ direction = "right" }))

-- Move between monitors with mainMod + SHIFT + hl keys
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.focus({ monitor = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.focus({ monitor = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hs.config({ num_workspaces = 10 })
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hs.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hs.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + CTRL + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + CTRL + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
--
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.focus({ direction = "left" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(
	"Print",
	hl.dsp.exec_cmd('grim - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"')
)
hl.bind(
	"SUPER + Print",
	hl.dsp.exec_cmd(
		'grim -g "$(slurp -d)" - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'
	)
)

hl.bind("SUPER + m", hl.dsp.exec_cmd("~/Scripts/mute.sh"))
hl.bind("SUPER + SHIFT + m", hl.dsp.exec_cmd("~/Scripts/mic-mute.sh"))
hl.bind("SUPER + SHIFT + d", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call notifications toggleDND"))
hl.bind("SUPER + SHIFT + s", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call idleInhibitor toggle"))
