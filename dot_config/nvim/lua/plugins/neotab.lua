return {
	"kawre/neotab.nvim",
	event = "InsertEnter",
	opts = {
		semicolon = {
			enabled = true,
			ft = { "cs", "c", "cpp", "java", "rust", "go" },
		}, -- configuration goes here
	},
}
