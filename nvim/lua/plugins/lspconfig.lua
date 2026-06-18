return {
  "neovim/nvim-lspconfig",
  config = function()
    local lsps = {
      "lua_ls",
      "bashls",
      "pyright",
      "clangd",
      "dockerls",
      "yamlls",
      "ts_ls",
      "rust_analyzer",
      "html",
      "cssls",
      "gopls",
      "just"
    }

    local schemas_dir = vim.fn.stdpath("config") .. "/lua/schemas/"
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local schemas = {
      [schemas_dir .. "docker-compose.json"] = "*compose*.y{a,}ml",
      [schemas_dir .. "github-workflow.json"] = "./.github/workflows/*.y{a,}ml",
      [schemas_dir .. "k8s/kustomization.json"] = "kustomization.y{a,}ml",
      [schemas_dir .. "k8s/deployment-apps-v1.json"] = "k8s/**/*deployment.y{a,}ml",
      [schemas_dir .. "k8s/service-v1.json"] = "k8s/**/*service.y{a,}ml",
      [schemas_dir .. "k8s/secret-v1.json"] = "k8s/**/*secrets.y{a,}ml",
      [schemas_dir .. "k8s/configmap-v1.json"] = "k8s/**/*config-map.y{a,}ml",
      [schemas_dir .. "k8s/statefulset-apps-v1.json"] = "k8s/**/*stateful-set.y{a,}ml",
      [schemas_dir .. "k8s/cronjob-batch-v1.json"] = "k8s/**/*cron.y{a,}ml",
      [schemas_dir .. "k8s/job-batch-v1.json"] = "k8s/**/*job.y{a,}ml",
    }

    for _, lsp in ipairs(lsps) do
      local opts = { capabilities = capabilities }

      if lsp == "yamlls" then
        opts.settings = { yaml = { schemas = schemas } }
      elseif lsp == "lua_ls" then
        opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
      elseif lsp == "gopls" then
        opts.settings = { gopls = { buildFlags = { "-tags=sqlite3,postgres" } } }
      end

      vim.lsp.config(lsp, opts)
      vim.lsp.enable(lsp)
    end

    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
  end
}
