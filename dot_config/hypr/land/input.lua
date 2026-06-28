---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us,cz",
		kb_variant = ",qwerty",
		kb_model = "",
		kb_rules = "",
		kb_options = "grp:win_space_toggle",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		accel_profile = "flat",

		repeat_delay = 210,
		repeat_rate = 40,

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
