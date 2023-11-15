_G.keymapper = function(modes, lhs, rhs, override_opts, bufnr)
	-- set default options
	local opts = { noremap = true, silent = true }
	local buf_local = false

	-- if the user wants a buffer_local mapping, take note
	-- because we have to use nvim_buf_set_keymap instead
	if override_opts then
		if override_opts.buffer then
			-- remove buffer key from override_opts table
			override_opts.buffer = nil
			buf_local = true
		end
		-- extend the default options with user's overrides
		vim.tbl_extend('keep', override_opts, opts)
	end

	-- set a buffer-local mapping
	if buf_local then
		vim.api.nvim_buf_set_keymap(bufnr or 0, mode, lhs, rhs, opts)
		-- set a regular global mapping
	else
		vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
	end
end
