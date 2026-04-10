--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

local wezterm = require("wezterm")
local h = require("utils/helpers")
local k = require("utils/keys")
local is_windows = wezterm.target_triple:find("windows") ~= nil
wezterm.on("gui-startup", function(cmd) -- set startup Window position
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():set_position(1000, 1000)
end)
local act = wezterm.action
local transparent_opacity = 0.8
h.setup_opacity_toggle(transparent_opacity)

local config = {
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                         GENERAL                         │
	-- ╰─────────────────────────────────────────────────────────╯
	check_for_updates = false,
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                       APPEARANCE                        │
	-- ╰─────────────────────────────────────────────────────────╯
	-- FONT
	font_size = 13,
	font = wezterm.font_with_fallback({
		{ family = "MapleMono NF" },
		{ family = "LXGW WenKai Mono", weight = "Bold" }, -- 你好
	}),

	-- COLOR SCHEME
	color_scheme = "Catppuccin Mocha",
	set_environment_variables = {
		BAT_THEME = "Catppuccin-mocha",
	},

	-- WINDOW
	initial_cols = 127,
	initial_rows = 37,
	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 15,
	},
	adjust_window_size_when_changing_font_size = false,
	window_close_confirmation = "AlwaysPrompt",
	window_background_opacity = transparent_opacity,

	-- TABS
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	colors = {
		tab_bar = h.tab_bar_colors(transparent_opacity),
	},

	-- ╭─────────────────────────────────────────────────────────╮
	-- │                          KEYS                           │
	-- ╰─────────────────────────────────────────────────────────╯
	keys = {
		-- k.ctrl_key(
		-- 	"s",
		-- 	act.Multiple({
		-- 		act.SendKey({ key = "\x1b" }), -- escape
		-- 		k.multiple_actions(":wa"),
		-- 	})
		-- ),
		k.alt_to_tmux_prefix("1", "1"),
		k.alt_to_tmux_prefix("2", "2"),
		k.alt_to_tmux_prefix("3", "3"),
		k.alt_to_tmux_prefix("4", "4"),
		k.alt_to_tmux_prefix("5", "5"),
		k.alt_to_tmux_prefix("6", "6"),
		k.alt_to_tmux_prefix("7", "7"),
		k.alt_to_tmux_prefix("8", "8"),
		k.alt_to_tmux_prefix("9", "9"),
		k.alt_to_tmux_prefix("i", "i"),
		k.alt_to_tmux_prefix("n", '"'), -- tmux horizontal split
		k.alt_to_tmux_prefix("N", "%"), -- tmux vertical split
		k.alt_to_tmux_prefix("d", "w"), -- tmux-sessionx
		k.alt_to_tmux_prefix("c", "c"), -- new tmux window
		k.alt_to_tmux_prefix("x", "x"), -- tmux close pane
		k.alt_to_tmux_prefix("z", "z"), -- tmux zoom
		{
			key = "t",
			mods = "ALT",
			action = wezterm.action.EmitEvent("toggle-opacity"),
		},
	},
}

if is_windows then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
else
	config.default_prog = { "/usr/bin/fish", "-l" }
end

return config
