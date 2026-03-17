local components = require("config.heirline.components")

vim.o.cmdheight = 0

return { -- statusline
	components.RightPadding(components.Mode, 1),
	components.RightPadding(components.FileNameBlock, 1),
	components.RightPadding(components.Git, 1),
	components.RightPadding(components.Diagnostics, 1),
	components.RightPadding(components.Overseer, 1),
	components.RightPadding(components.SearchOccurrence, 1),
	components.MacroRecording,
	components.Fill,
	components.RightPadding(components.LspProgress, 1),
	components.RightPadding(components.LSPActive),
	components.Fill,
	components.RightPadding(components.ShowCmd, 1),
	-- components.RightPadding(components.Formatters, 1),
	components.RightPadding(components.SimpleIndicator),
	components.RightPadding(components.FileType, 0),
	components.Ruler,
	components.ScrollBar,
}
