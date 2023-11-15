local tel = require('telescope.builtin')
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local cfg_dir = "~/.config/"

local configs = finders.new_table {
	results = {
		{ "nvim", cfg_dir .. "nvim" },
		{ "xmonad", cfg_dir .. "xmonad" },
		{ "systemd", cfg_dir .. "systemd/user" },
		{ "zsh", cfg_dir .. "zsh" },
		{ "scripts", "~/.scripts" },
	},
	entry_maker = function(entry)
		return {
			value = entry,
			display = entry[1],
			ordinal = entry[1],
		}
	end
}


-- our picker function: colors
local config_picker = function(opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "configs",
		finder = configs,
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local sel = action_state.get_selected_entry()
				vim.cmd(":tabnew")
				vim.cmd(":tcd " .. sel.value[2])
				vim.cmd(":Explore")
			end)
			return true
		end,
	}):find()
end


vim.keymap.set('n', '<leader>ff', tel.find_files, {})
vim.keymap.set('n', '<leader>fg', tel.git_files, {})
vim.keymap.set('n', '<leader>fG', tel.live_grep, {})
vim.keymap.set('n', '<leader>fb', tel.buffers, {})
vim.keymap.set('n', '<leader>fh', tel.help_tags, {})
vim.keymap.set('n', '<leader>fc', config_picker, {})

