-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function ensure_ts_bridge_daemon()
  print(vim.inspect(vim.g.ts_bridge_daemon_started))
  if vim.g.ts_bridge_daemon_started then
    return
  end
  vim.g.ts_bridge_daemon_started = true
  vim.fn.jobstart({
    "ts-bridge",
    "daemon",
    "--listen",
    "127.0.0.1:7007", -- choose your port
    "--idle-ttl",
    "10m",
  }, {
    detach = true,
    env = { RUST_LOG = "info" },
  })
end

local function wait_for_daemon(host, port, timeout_ms)
  local addr = string.format("%s:%d", host, port)
  local function is_ready()
    local ok, chan = pcall(vim.fn.sockconnect, "tcp", addr, { rpc = false })
    if not ok then
      return false
    end
    if type(chan) == "number" and chan > 0 then
      vim.fn.chanclose(chan)
      return true
    end
    return false
  end
  return vim.wait(timeout_ms, is_ready, 50)
end

local function daemon_cmd(dispatchers)
  print("Starting ts-bridge daemon...")
  ensure_ts_bridge_daemon()
  -- Built-in LSP has no `on_new_config`, and `before_init` runs after `cmd`, so
  -- start + wait here to avoid a first-attach connection refusal.
  wait_for_daemon("127.0.0.1", 7007, 500)
  return vim.lsp.rpc.connect("127.0.0.1", 7007)(dispatchers)
end

vim.lsp.config("ts_bridge", {
  cmd = daemon_cmd,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  settings = {
    ["ts-bridge"] = {
      separate_diagnostic_server = false,
      enable_inlay_hints = false,
    },
  },
})

vim.lsp.enable("ts_bridge")

vim.api.nvim_create_user_command("TSBridgeStatus", function()
  local client = vim.lsp.get_clients({ bufnr = 0, name = "ts_bridge" })[1]
  if not client then
    vim.notify("ts_bridge not attached to this buffer", vim.log.levels.WARN)
    return
  end
  client.request("ts-bridge/status", {}, function(err, result)
    if err then
      vim.notify(vim.inspect(err), vim.log.levels.ERROR)
      return
    end
    vim.print(result)
  end)
end, {})
