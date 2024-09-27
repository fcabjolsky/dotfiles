local Worktree = require("git-worktree")
local Job = require 'plenary.job'


local function file_exists(path)
  local file = io.open(path, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Switch then
    require("git-push").setup()
  end
  if op == Worktree.Operations.Create then
    local path = "./" .. metadata.path .. "/package.json"
    if file_exists(path) then
      Job:new({
        command = 'npm',
        args = {
          'i'
        },
        cwd = vim.fn.expand('%:p:h') .. "/" .. metadata.path,
        on_stderr = function(_, err)
          vim.inspect(err)
        end,
        on_exit = function()
          vim.defer_fn(function()
            vim.cmd("LspRestart")
          end, 1)
        end,
      }):start()
    end
  end
end)

