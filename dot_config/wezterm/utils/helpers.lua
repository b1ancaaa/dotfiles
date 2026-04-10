local wezterm = require("wezterm")
local M = {}

local appearance = wezterm.gui.get_appearance()

M.is_dark = function()
	return appearance:find("Dark")
end

local function alpha_pct(opacity)
	return math.floor(opacity * 100 + 0.5)
end

M.tab_bar_colors = function(opacity)
	local alpha = alpha_pct(opacity)
	local background = string.format("rgba(12%%, 12%%, 18%%, %d%%)", alpha)
	local hover_bg = string.format("rgba(27%%, 28%%, 35%%, %d%%)", alpha)

	return {
		background = background,
		active_tab = {
			bg_color = "#cba6f7",
			fg_color = "#1e1e2e",
			intensity = "Bold",
		},
		inactive_tab = {
			fg_color = "#cba6f7",
			bg_color = background,
			intensity = "Normal",
		},
		inactive_tab_hover = {
			fg_color = "#cba6f7",
			bg_color = hover_bg,
			intensity = "Bold",
		},
		new_tab = {
			fg_color = "#808080",
			bg_color = background,
		},
	}
end

M.apply_opacity_overrides = function(window, opacity)
	local overrides = window:get_config_overrides() or {}
	overrides.window_background_opacity = opacity
	overrides.colors = {
		tab_bar = M.tab_bar_colors(opacity),
	}
	window:set_config_overrides(overrides)
end

M.setup_opacity_toggle = function(transparent_opacity)
	wezterm.on("toggle-opacity", function(window, pane)
		local overrides = window:get_config_overrides() or {}
		local current_opacity = overrides.window_background_opacity or transparent_opacity
		local target_opacity = transparent_opacity

		if math.abs(current_opacity - transparent_opacity) < 0.001 then
			target_opacity = 1.0
		end

		M.apply_opacity_overrides(window, target_opacity)
	end)
end

return M
