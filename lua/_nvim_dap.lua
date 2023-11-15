local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode',
	name = 'lldb'
}
 
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint)
-- vim.keymap.set('<Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- vim.keymap.set('<Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- vim.keymap.set('<Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- vim.keymap.set('<Leader>dl <Cmd>lua require'dap'.run_last()<CR>

local dap = require('dap')
local lldb_config = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.cpp = lldb_config
dap.configurations.c = lldb_config
dap.configurations.rust = lldb_config

local dap_ui = require("dapui").setup()
-- local dap_vtext = require("nvim-dap-virtual-text").setup()
