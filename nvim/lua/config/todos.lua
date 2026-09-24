local namespace = vim.api.nvim_create_namespace("todo_diagnostics")

local function update_todo_diagnostics(args)
  local bufnr = args.buf
  local diagnostics = {}

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  for line_number, line in ipairs(lines) do
    local start_col = line:find("TODO", 1, true)

    if start_col then
      table.insert(diagnostics, {
        lnum = line_number - 1,
        col = start_col - 1,
        end_lnum = line_number - 1,
        end_col = #line,
        severity = vim.diagnostic.severity.INFO,
        message = line:sub(start_col),
        source = "TODO",
      })
    end
  end

  vim.diagnostic.set(namespace, bufnr, diagnostics)
end

vim.api.nvim_create_autocmd({
  "BufEnter",
  "BufWritePost",
  "TextChanged",
  "TextChangedI",
}, {
  callback = update_todo_diagnostics,
})
