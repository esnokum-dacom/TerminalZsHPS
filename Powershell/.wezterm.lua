local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.font = wezterm.font("RobotoMono Nerd Font")

config.color_scheme = "Apprentice (Gogh)"

config.colors = {
	split = "rgba(0,0,0,0.0)",
	background = "#151515",
	tab_bar = {
		background = "rgba(0,0,0,0.0)",
		active_tab = {
			bg_color = "rgba(0, 0, 0, 0)",
			fg_color = "rgba(0, 0, 0, 0)",
		},
		inactive_tab = {
			bg_color = "rgba(0, 0, 0, 0)",
			fg_color = "rgba(0, 0, 0, 0)",
		},

		inactive_tab_hover = {
			bg_color = "rgba(0, 0, 0, 0.0)",
			fg_color = "rgba(0, 0, 0, 0.0)",
		},
		new_tab = {
			bg_color = "rgba(0, 0, 0, 0.0)",
			fg_color = "#f0f0f0",
		},
		new_tab_hover = {
			bg_color = "rgba(0, 0, 0, 0.0)",
			fg_color = "#404040",
		},
	},
}

wezterm.on("format-tab-title", function(tab)
	local bg_color = tab.is_active and "#f2f2f2" or "#151515"
	local fg_color = tab.is_active and "#000000" or "#808080"
	local trans = tab.is_active and "rgba(0,0,0,0.0)" or "rgba(0,0,0,0.0)"
	local process_name = tab.active_pane.foreground_process_name
	local Titel = "Poweshell"

	if process_name:find("powershell") then
		Titel = "PowerShell"
	elseif process_name:find("cmd") then
		Titel = "CMD"
	elseif process_name:find("bash") then
		Titel = "Bash"
	elseif process_name:find("nu") then
		Titel = "Nushell"
	elseif process_name:find("zsh") then
		Titel = "Zsh"
	elseif process_name:find("fish") then
		Titel = "Fish"
	end

	return {
		{ Foreground = { Color = bg_color } },
		{ Text = " " },

		{ Background = { Color = bg_color } },
		{ Foreground = { Color = fg_color } },
		{ Text = Titel },

		{ Background = { Color = trans } },
		{ Foreground = { Color = bg_color } },
		{ Text = " " },
	}
end)

config.tab_bar_style = {
	new_tab = wezterm.format({
		{ Text = "  ♰  " },
	}),
	new_tab_hover = wezterm.format({
		{ Text = "  ♰  " },
	}),
}

config.keys = {
	{
		key = "c",
		mods = "CTRL|ALT",
		action = wezterm.action({ CopyTo = "Clipboard" }),
	},
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
	{
		key = "v",
		mods = "ALT|CTRL",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "Enter",
		mods = "ALT|CTRL",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "LeftArrow",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "i",
		mods = "SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "e",
		mods = "SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = ".",
		mods = "ALT|CTRL",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		key = "W",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

config.window_padding = {
	top = 0,
	bottom = 0,
}

config.default_cursor_style = "BlinkingBar"

config.force_reverse_video_cursor = true

config.window_background_opacity = 0.85

config.text_background_opacity = 1

config.window_decorations = "RESIZE"

config.enable_tab_bar = true

config.enable_wayland = true

config.font_size = 10

config.default_prog = { "pwsh.exe" }

return config
