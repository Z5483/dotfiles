local lspconfig = {}

if vim.fn.executable('clangd') == 1 then
	require'lspconfig'.clangd.setup{}
end

if vim.fn.executable('rls') == 1 then
	require'lspconfig'.rls.setup{}
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>dN', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'g0', ':lua vim.lsp.buf.document_symbol()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)

if os.getenv('TERM') ~= 'linux' then
	vim.cmd('sign define LspDiagnosticsSignError text=✖')
	vim.cmd('sign define LspDiagnosticsSignWarning text=')
	vim.cmd('sign define LspDiagnosticsSignInformation text=')
	vim.cmd('sign define LspDiagnosticsSignHint text=➤')
end