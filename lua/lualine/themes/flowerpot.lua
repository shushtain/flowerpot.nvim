local palette = require("flowerpot.palette").setup()
local theme = {}

theme.normal = {
	a = {
		fg = palette.gray.v10,
		bg = palette.gray.v60,
		gui = "bold",
	},
	b = {
		fg = palette.gray.v80,
		bg = palette.gray.v30,
	},
	c = {
		fg = palette.gray.v80,
		bg = palette.gray.v20,
	},
}

theme.insert = {
	a = {
		fg = palette.green.v10,
		bg = palette.green.v60,
		gui = "bold",
	},
	b = {
		fg = palette.green.v80,
		bg = palette.green.v30,
	},
	c = {
		fg = palette.green.v80,
		bg = palette.green.v20,
	},
}

theme.visual = {
	a = {
		fg = palette.blue.v10,
		bg = palette.blue.v60,
		gui = "bold",
	},
	b = {
		fg = palette.blue.v80,
		bg = palette.blue.v30,
	},
	c = {
		fg = palette.blue.v80,
		bg = palette.blue.v20,
	},
}

theme.replace = {
	a = {
		fg = palette.yellow.v10,
		bg = palette.yellow.v60,
		gui = "bold",
	},
	b = {
		fg = palette.yellow.v80,
		bg = palette.yellow.v30,
	},
	c = {
		fg = palette.yellow.v80,
		bg = palette.yellow.v20,
	},
}

theme.command = {
	a = {
		fg = palette.magenta.v10,
		bg = palette.magenta.v60,
		gui = "bold",
	},
	b = {
		fg = palette.magenta.v80,
		bg = palette.magenta.v30,
	},
	c = {
		fg = palette.magenta.v80,
		bg = palette.magenta.v20,
	},
}

theme.terminal = {
	a = {
		fg = palette.cyan.v10,
		bg = palette.cyan.v60,
		gui = "bold",
	},
	b = {
		fg = palette.cyan.v80,
		bg = palette.cyan.v30,
	},
	c = {
		fg = palette.cyan.v80,
		bg = palette.cyan.v20,
	},
}

theme.inactive = {
	a = {
		fg = palette.gray.v60,
		bg = palette.gray.v20,
		gui = "bold",
	},
	b = {
		fg = palette.gray.v60,
		bg = palette.gray.v20,
	},
	c = {
		fg = palette.gray.v60,
		bg = palette.gray.v20,
	},
}

return theme
