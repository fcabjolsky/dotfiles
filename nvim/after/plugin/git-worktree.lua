local Worktree = require("git-worktree")
Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Switch then
    require("git-push").setup()
  end
end)
